#define SD1G  //001

// *******************************************************************
//  Include section

#include "cmem7_conf.h"
#include "cmem7_misc.h"
#include "cmem7_spi.h"
#include "cmem7_uart.h"
#include "cmem7_ddr.h"
#include "cmem7_gpio.h"

#include "cmem7_retarget.h"

#include "mmc_sd.h"


#define SPI_DEVICE	SPI0
#define R_DDRM					0x60000000

uint8_t  SD_Type=0;

// *******************************************************************
//  Function define section

void init_gpio(void)
{
	//GPIO_Init(GPIO_GROUP_GPIO, 0xFFFFFFFF); //accept interrupt when input data encountered a positive edge
	GPIO_EnableOutput(GPIO_GROUP_GPIO, 0xFFFFFFFF);
}

//Set frequency of SPI clock(Fsck), divided from arm clock(Fclk_io)
void SPI_SetSpeed(SPI0_Type* SPIx, uint16_t spi_divider) {
	assert_param(IS_SPI_ALL_PERIPH(SPIx));
	
  SPIx->DIV = spi_divider; //fsck = fclk_io / (DIV + 1) / 2
}

//SD SPI write one byte
void SD_SPI_WriteByte(uint8_t wdata)
{
	uint32_t data;
	uint8_t countw;
	
	data = wdata;
	SPI_RxEnable(SPI_DEVICE, FALSE); //when SPI write, the received data will not be stored into rfifo
	
  do {
		countw = SPI_WriteFifo(SPI_DEVICE, 1, &data);
	}while(countw < 1);
	
	SPI_Transcation(SPI_DEVICE, 1);
}

//SD SPI read one byte
uint8_t SD_SPI_ReadByte(void)
{
	uint32_t data = 0xFF;
	uint8_t countw, countr;
	uint8_t rd_data;

	SPI_RxEnable(SPI_DEVICE, TRUE); //when SPI write, the received data will be stored into rfifo
	
  do {
		countw = SPI_WriteFifo(SPI_DEVICE, 1, &data);
	}while(countw < 1);

	SPI_Transcation(SPI_DEVICE, 1);

	do {
		countr = SPI_ReadFifo(SPI_DEVICE, 1, &data);
	}while(countr < 1);

	rd_data = data;

	return rd_data;
}

//SD identification mode clock frequency, 400KHz, for compatibility
void SD_SPI_SpeedLow(void)
{
	//Low freq. is required for MultiMediaCard compatibility when Identification Mode
	SPI_SetSpeed(SPI_DEVICE, 249);//set frequency to 400KHz, based on 200MHz arm clock
}

//SD data transfer mode clock frequency, 25MHz
void SD_SPI_SpeedHigh(void)
{
  SPI_SetSpeed(SPI_DEVICE, 3);//set frequency to 25MHz, based on 200MHz arm clock
}

//SPI initial for SD access
void SD_SPI_Init(void)
{
	{
		SPI_InitTypeDef init;
		
		init.SPI_Mode = SPI_MODE_CPOL_0_CPHA_0;
		init.SPI_RxEn = TRUE;
		init.SPI_BitLength = 8;
		init.SPI_Gap = 0;
		SPI_Init(SPI_DEVICE, &init);
	}

  SPI_Enable(SPI_DEVICE, TRUE);
}

//SD delay among Command, Response, and Data-block
void SD_Delay(uint8_t cnt)
{
  while(cnt--){
		SD_SPI_WriteByte(0xff);
	}
}

//SD delay among Command, Response, and Data-block
uint8_t SD_WaitReady(void)
{
  uint32_t t=0;
	do{
		if(SD_SPI_ReadByte() == 0xff)
			return 0; //SD card is ready
		t++;
	}while(t<0xffffff);//SD card is busy
	
	return 1;
}

//Read data from SD card, single block read
uint8_t SD_RecvData(uint8_t *buf,uint16_t len)
{
	uint8_t st_bk_token;
  uint8_t Retry=0;
	
	//First byte: Start Block
  Retry=0x7F;
  do { //wait (delay Nac) untill the start block flag byte is captured
    st_bk_token=SD_SPI_ReadByte();
  }while((st_bk_token==0xFF) && Retry--);
	
	if((st_bk_token & 0xF0) == 0) //Data Error Token
	{
		return 1;
	}
	else if(st_bk_token == 0xFE) // Start Block Token
	{
		//User data
		while(len--)
		{
			*buf = SD_SPI_ReadByte();
			buf++;
		}

		//Last two bytes(16-bit) CRC(dummy CRC)
		SD_SPI_WriteByte(0xFF);
		SD_SPI_WriteByte(0xFF);
	}
	else
	{
		return 2;
	}

  return 0;
}

//SD block data write
//buf: 512byte data to be send for writing
//cmd_token: Start Block Token(single write 0xFE, multiple write 0xFC), or Stop tran token of multiple write(0xFD)
uint8_t SD_SendBlock(uint8_t *buf,uint8_t cmd_token)
{
  uint16_t t;

	if(SD_WaitReady())//delay(Nwr) when first write, or wait delay(Nec) when busy period
	return 1; //The SD card is long time in busy state

  SD_SPI_WriteByte(cmd_token); //First byte of each block(maybe Start-Block-Token or Stop-Tran-Token)
  if(cmd_token!=0xFD)          //if not a Stop transmission token
  {
    for(t=0;t<512;t++)
      SD_SPI_WriteByte(buf[t]);//send 512 user data
    SD_SPI_WriteByte(0xFF);    //Two bytes(16bits) crc
    SD_SPI_WriteByte(0xFF);
		
		//every data block written to the card will be acknlwledged by a data response token.
    t=SD_SPI_ReadByte();       //Read Data Response Token, which is one byte long
    if((t&0x1F)!=0x05)
      return 2;                //Data rejected due to a CRC/Write error
  }
    return 0; //Write block success, or Stop transmission success
}


//SD send command
uint8_t SD_SendCmd(uint8_t cmd, uint32_t arg, uint8_t crc)
{
	uint8_t r1;
  uint8_t Retry=0;
	uint32_t data[7];
	uint8_t countw;
	uint8_t bytesize;

  SD_Delay(1); //delay: Ncs and Nrc(delay period between last host-command's card-response to new host-command)
	if(SD_WaitReady())
		return 0xff; //The SD card is long time in busy state

	data[0] = cmd | 0x40;
	data[1] = arg >> 24;
	data[2] = arg >> 16;
	data[3] = arg >> 8;
	data[4] = arg;
	data[5] = crc;
	data[6] = 0xff;
	
	if(cmd==CMD12)
		bytesize = 7;//Skip a stuff byte when stop reading
	else
		bytesize = 6;
	
	SPI_RxEnable(SPI_DEVICE, FALSE); //when SPI write, the received data will not be stored into rfifo
	
  do {
		countw = SPI_WriteFifo(SPI_DEVICE, bytesize, data);
	}while(countw < 1);
	
	SPI_Transcation(SPI_DEVICE, bytesize);

  //Read command response, here will have a delay: Ncr
  Retry=0x1F;
  do {
    r1=SD_SPI_ReadByte();
  }while((r1&0x80) && Retry--);

  //return first byte(Format R1) of the response token
  return r1;
}

//Get CID of SD card
uint8_t SD_GetCID(uint8_t *cid_data)
{
  uint8_t r1;

  //CMD10, SEND_CID, asks the selected card to send its card identification(CID)
  r1=SD_SendCmd(CMD10,0,0x01);
  if(r1==0x00)
  {
    r1=SD_RecvData(cid_data,16);  //CID is 128bit(16 bytes)
  }
  SD_Delay(1); //delay: Nec
  if(r1)
    return 1;
  else
    return 0;
}

//Get CSD of SD card
uint8_t SD_GetCSD(uint8_t *csd_data)
{
  uint8_t r1;

  r1=SD_SendCmd(CMD9,0,0x01);     //CMD9,SEND_CSD
  if(r1==0)
  {
    r1=SD_RecvData(csd_data, 16); //CSD is 128bit(16 bytes)
  }
  SD_Delay(1); //delay: Nec
  if(r1)
    return 1;
  else
    return 0;
}


//Get SD card capacity in sectors(each sector assume as 512bytes)
uint32_t SD_GetSectorCount(void)
{
  uint8_t csd[16];
  uint32_t Capacity;
  uint8_t n;
  uint16_t csize;

  //Get csd(Card-Specific Data) register contents
  if(SD_GetCSD(csd)!=0)
    return 0;

  //SDHC or not
  if((csd[0]&0xC0)==0x40)//V2.00 High Capacity
  {
    csize = csd[9] + ((uint16_t)csd[8] << 8) + 1; //total 22bits, but upper 6 bits of this field is 0 of V2.00
    Capacity = (uint32_t)csize << 10; //Sector number, each sector 512bytes
  }
  else                   //V1.01-1.10, V2.00 Standard Capacity
  {
    n = (csd[5] & 15) + ((csd[10] & 128) >> 7) + ((csd[9] & 3) << 1) + 2; //READ_BL_LEN + C_SIZE_MULT + 2
    csize = (csd[8] >> 6) + ((uint16_t)csd[7] << 2) + ((uint16_t)(csd[6] & 3) << 10) + 1;//total 12bits
    Capacity= (uint32_t)csize << (n - 9);//Sector number, each sector assume 512byts
  }

  return Capacity;
}

//Initialize of SD
uint8_t SD_Initialize(void)
{
  uint8_t r1;          // SD R1 reponse
  uint32_t retry;
  uint8_t buf[4];
  uint16_t i;

  SD_SPI_Init();       //Init SPI configuration
  SD_SPI_SpeedLow();   //set Low frequency for Identification mode
  for(i=0;i<10;i++)
    SD_SPI_WriteByte(0xFF);       //delay
  retry=20;
  do {
    r1=SD_SendCmd(CMD0,0,0x95);   //CMD0, CS asserted, go to spi operation mode
  }while((r1!=0x01) && retry--);

  SD_Type=0;                      //supported SD protocol version
  if(r1==0x01)
  {
    if(SD_SendCmd(CMD8,0x1AA,0x87)==1)//SD V2.0 or later
    {
      for(i=0;i<4;i++)
        buf[i]=SD_SPI_ReadByte();     //Get trailing return value of R7 resp
      if(buf[2]==0x01&&buf[3]==0xAA)  //supply voltage 2.7~3.6V
      {
        retry=0xFFFE;
        do {
          SD_SendCmd(CMD55,0,0x01);   //CMD55 is APP_CMD
          r1=SD_SendCmd(CMD41,0x40000000,0x01);//ACMD41: CMD41 after CMD55, HCS(Host capacity support) is 1
        }while(r1&&retry--); //untill card returns into "in_idle_state"=0
        if(retry&&SD_SendCmd(CMD58,0,0x01)==0) //get CCS information in the response
        {
          for(i=0;i<4;i++)
            buf[i]=SD_SPI_ReadByte(); //32bit OCR
          if(buf[0]&0x40)
            SD_Type=SD_TYPE_V2HC;     //CCS=1, High Capacity SD Memory Card
          else
            SD_Type=SD_TYPE_V2;       //CCS=0, Standard Capacity SD Memory Card
        }
      }
    }
    else//SD V1.x/ MMC  V3
    {
      SD_SendCmd(CMD55,0,0x01);       //CMD55 is APP_CMD
      r1=SD_SendCmd(CMD41,0,0x01);    //ACMD41: CMD41 after CMD55, HCS(Host capacity support) is 0
      if(r1<=1)
      {
        SD_Type=SD_TYPE_V1;
        retry=0xFFFE;
        do {
          SD_SendCmd(CMD55,0,0x01);
          r1=SD_SendCmd(CMD41,0,0x01);//repeat ACMD41 untill "in_idle_state"=0
        }while(r1&&retry--);
      }
      else                            //MMC
      {
        SD_Type=SD_TYPE_MMC;          //MMC V3
        retry=0xFFFE;
        do {
          r1=SD_SendCmd(CMD1,0,0x01); //CMD1
        }while(r1&&retry--);
      }
      if(retry==0||SD_SendCmd(CMD16,512,0x01)!=0)
        SD_Type=SD_TYPE_ERR;
    }
  }
  SD_Delay(1);        //Delay: Nec
  SD_SPI_SpeedHigh(); //Now in data-transfer mode, set clock frequency 25MHz
  if(SD_Type)
    return 0;
  else if(r1)
    return r1;

  return 0xaa;        //Not a SD card, initial failed
}

//Read SD sector(512bytes each)
//buf: store the read data from SD card
//sector: physical sector number
//cnt: how many sectors/blocks will be read
uint8_t SD_ReadDisk(uint8_t*buf,uint32_t sector,uint8_t cnt)
{
  uint8_t r1;

  if(SD_Type!=SD_TYPE_V2HC)
    sector <<= 9;                     //translate into bytes address when Standard SD, under 512bytes per sector
  if(cnt==1)
  {
    r1=SD_SendCmd(CMD17,sector,0x01); //Single block read
    if(r1==0)                         //Command Respones R1 no error
    {
      r1=SD_RecvData(buf,512);        //read the following data(512bytes) into buf
    }
  }
  else
  {
    r1=SD_SendCmd(CMD18,sector,0x01); //Multiple block read
    do
    {
      r1=SD_RecvData(buf,512);        //each block 512bytes
      buf+=512;
    }while(--cnt && r1==0);
    SD_SendCmd(CMD12,0,0x01);         //Stop Transmission in Multiple Block Read Operation
  }
  SD_Delay(1);                        //delay: Nec

  return r1;
}

//Write SD sector(512bytes each)
//buf: store the data that will be written into SD card
//sector: physical sector number
//cnt: how many sectors/blocks will be written
uint8_t SD_WriteDisk(uint8_t*buf,uint32_t sector,uint8_t cnt)
{
  uint8_t r1;

  if(SD_Type!=SD_TYPE_V2HC)
    sector <<= 9;                     //translate into bytes address when Standard SD, under 512bytes per sector
  if(cnt==1)
  {
    r1=SD_SendCmd(CMD24,sector,0x01); //Single block write
    if(r1==0)                         //Command Respones R1 no error
    {
      r1=SD_SendBlock(buf,0xFE);      //write the 512bytes data of buf into SD card, Start-Token=0xFE
    }
  }
  else
  {
    if(SD_Type!=SD_TYPE_MMC)
    {
      SD_SendCmd(CMD55,0,0x01);       //ACMD23, Set the number of write blocks to be pre-erased before writing, to
      SD_SendCmd(CMD23,cnt,0x01);     //be used for faster multiple block wr command, default "1"(one wr block)
    }
    r1=SD_SendCmd(CMD25,sector,0x01); //Multiple block write
    if(r1==0)
    {
      do
      {
        r1=SD_SendBlock(buf,0xFC);    //each block 512bytes, Start-Token=0xFC
        buf+=512;
      }while(--cnt && r1==0);
      r1=SD_SendBlock(0,0xFD);        //multiple write transmition stop, Stop-Tran-Token=0xFD
    }
  }
  SD_Delay(1);                        //delay: Nec
  return r1;
}


int main(void)
{
	uint8_t SD_cid_data[20];
	uint8_t rets=0;
	uint8_t count;
	uint32_t fig_num;
	uint32_t i,j,k;
	uint16_t RGB_value;
	uint32_t RGB_Addr, RGB_Each_Line_Addr_Begin, RGB_Each_Line_Addr_End;

	uint8_t LBA_Buff[1536];	// Data buffer to store read data, 512*3
	uint32_t LBA_Sector;
	uint32_t LBA_Logical_Sector_Begin = 16;
	uint32_t BMP_start_sector_logical[20];
	
	MEM_CHIP_INFO chip_info;

	{
		UART_InitTypeDef init;

		UART_StructInit(&init);
		UART_Init(PRINT_UART, &init);
		UART_Cmd(PRINT_UART, TRUE);
	}
	
#if (DDR_TYPE == 3)
	chip_info.mem_type = MEM_DDR3;
	chip_info.Bus_width = 16;
  chip_info.Chip_bus_width = 16;
	chip_info.Chip_size = 256;
	DDR_Init(&chip_info /* 128Mbx16 */, &DDR3PREDEF[DDR3_400]);
#elif (DDR_TYPE == 2)
	chip_info.mem_type = MEM_DDR2;
  chip_info.Bus_width = 16;
  chip_info.Chip_bus_width = 16;
	chip_info.Chip_size = 64;
	DDR_Init(&chip_info /*64Mb*16, 4-bank, 10CA 2BASEL 3BA 13RA*/, &DDR2PREDEF[DDR2_400]);
#endif
	
	init_gpio();
	//gpio.bit0, indicate the first BMP figure load to DDR done; gpio.bit1, used to change the display figures
	GPIO_Write(GPIO_GROUP_GPIO, 0x00000003, 0x00000003);//mask,data
	
	for(i=0;i<20;i++)
    SD_cid_data[i]=0;
	
	do{
		SD_Initialize();
		rets=SD_GetCID(SD_cid_data);
	}while(rets==1);
	
  //Following 16 BMP figure, all rgb565, data start at offset 0x46, each 3072+1 sectors
	//cme_web0:11288- (rgb565, cme home page figure)
	//fig0:14368- (rgb565, 3072+1 sectors)
	//fig1:17448-
	//fig2:20528-
	//fig3:23608-
	//fig4:26688-
	//fig5:29768-
	//fig6:32848-
	//fig7:35928-
	//fig8:39008-
	//fig9:42088-
	//figa:45168-
	//figb:48248-
	//figc:51328-
	//figd:54408-
	//fige:57488-
	//figf:8208-
	BMP_start_sector_logical[0] = 11288;//14368;
	BMP_start_sector_logical[1] = 17448;
	BMP_start_sector_logical[2] = 20528;
	BMP_start_sector_logical[3] = 23608;
	BMP_start_sector_logical[4] = 26688;
	BMP_start_sector_logical[5] = 29768;
	BMP_start_sector_logical[6] = 32848;
	BMP_start_sector_logical[7] = 35928;
	BMP_start_sector_logical[8] = 39008;
	BMP_start_sector_logical[9] = 42088;
	BMP_start_sector_logical[10]= 45168;
	BMP_start_sector_logical[11]= 48248;
	BMP_start_sector_logical[12]= 51328;
	BMP_start_sector_logical[13]= 54408;//
	BMP_start_sector_logical[14]= 57488;
	BMP_start_sector_logical[15]= 8208;
	
	for(j=0; j<768; j++) {
		for(k=0; k<1024*2; k+=2) {
			if(k < 128*2)
				*(uint16_t *)(0x62000000 + j*1024*2 + k) = 0x00ff & ~k;
			else if(k < 2*128*2)
				*(uint16_t *)(0x62000000 + j*1024*2 + k) = 0xf800 | (0x00ff & k);
			else if(k < 3*128*2)
				*(uint16_t *)(0x62000000 + j*1024*2 + k) = 0x07e0;
			else if(k < 4*128*2)
				*(uint16_t *)(0x62000000 + j*1024*2 + k) = 0xffe0;
			else if(k < 5*128*2)
				*(uint16_t *)(0x62000000 + j*1024*2 + k) = 0x001f;
			else if(k < 6*128*2)
				*(uint16_t *)(0x62000000 + j*1024*2 + k) = 0xf81f;
			else if(k < 7*128*2)
				*(uint16_t *)(0x62000000 + j*1024*2 + k) = 0x07ff;
			else
				*(uint16_t *)(0x62000000 + j*1024*2 + k) = 0xffff;
		}
	}
	
	for(j=0; j<24; j++) {
		for(k=0; k<1024*2; k+=2) {
			if(k < 128*2)
				*(uint16_t *)(0x20002000 + j*1024*2 + k) = 0x00ff & k;
			else if(k < 2*128*2)
				*(uint16_t *)(0x20002000 + j*1024*2 + k) = 0xf800 | (0x00ff & ~k);
			else if(k < 3*128*2)
				*(uint16_t *)(0x20002000 + j*1024*2 + k) = 0x07e0;
			else if(k < 4*128*2)
				*(uint16_t *)(0x20002000 + j*1024*2 + k) = 0xffe0;
			else if(k < 5*128*2)
				*(uint16_t *)(0x20002000 + j*1024*2 + k) = 0x001f;
			else if(k < 6*128*2)
				*(uint16_t *)(0x20002000 + j*1024*2 + k) = 0xf81f;
			else if(k < 7*128*2)
				*(uint16_t *)(0x20002000 + j*1024*2 + k) = 0x07ff;
			else
				*(uint16_t *)(0x20002000 + j*1024*2 + k) = 0xffff;
		}
	}

			
	for(fig_num=0; fig_num<16; fig_num++){
		LBA_Sector=LBA_Logical_Sector_Begin + BMP_start_sector_logical[fig_num];
		RGB_Each_Line_Addr_Begin = 0x60000000 + 0x17f800 + 0x200000*fig_num;//0x6017f800
		RGB_Each_Line_Addr_End = 0x60000000 + 0x200000*fig_num;
		RGB_Addr = RGB_Each_Line_Addr_Begin;
		for(i=0,k=0,count=3; i<=3072; i+=3) {
			rets=SD_ReadDisk(LBA_Buff,(LBA_Sector+i),count);	// r1=0,fail.... jones
			if(rets == 0) {
				if(i == 0)
					j = 0x46;
				else
					j = 0;
				while(j<1536) {
					RGB_value = LBA_Buff[j+1];
					RGB_value <<= 8;
					RGB_value |= LBA_Buff[j];
					*(uint16_t *)(RGB_Addr + k) = RGB_value;
					k += 2;
					if(k == 0x800){
						RGB_Addr -= k;
						if(i == 3072)
							count = 1;
						if(RGB_Addr < RGB_Each_Line_Addr_End){
							i = 3073; //also break out of the for loop
							break;
						}
						k = 0;
					}
					j += 2;
				}
			}
			else {
				printf("Not finish all sectors of the image!\n");
			}
		}
		GPIO_Write(GPIO_GROUP_GPIO, 0x00000002, 0x00000000);//(mask,data), write 0
		GPIO_Write(GPIO_GROUP_GPIO, 0x00000002, 0x00000002);//(mask,data), write 1
		GPIO_Write(GPIO_GROUP_GPIO, 0x00000002, 0x00000002);//(mask,data), write 1
		GPIO_Write(GPIO_GROUP_GPIO, 0x00000002, 0x00000000);//(mask,data), write 0
		
		//gpio.bit0, indicate the first BMP figure load to DDR done, low active
		GPIO_Write(GPIO_GROUP_GPIO, 0x00000001, 0x00000000);//mask,data
	}
	
	while(1){
		for(i=0; i<2000; i++){
			for(j=0; j<60000; j++);
		}
		//gpio.bit1, high pulse valid, used to change the display figures
		GPIO_Write(GPIO_GROUP_GPIO, 0x00000002, 0x00000000);//(mask,data), write 0
		GPIO_Write(GPIO_GROUP_GPIO, 0x00000002, 0x00000002);//(mask,data), write 1
		GPIO_Write(GPIO_GROUP_GPIO, 0x00000002, 0x00000002);//(mask,data), write 1
		GPIO_Write(GPIO_GROUP_GPIO, 0x00000002, 0x00000000);//(mask,data), write 0
	}

}


// // // 	BeginSector  =(MBR.Entry[ubItmp0].MBREntry.BeginSector & 0x3F);
// // // 	BeginCylinder=((WORD)(MBR.Entry[ubItmp0].MBREntry.BeginSector& 0xc0) <<2)|(MBR.Entry[ubItmp0].MBREntry.BeginCylinder ) ;
// // // 		  	 
// // // 		
// // // 			EndSector  =(MBR.Entry[ubItmp0].MBREntry.EndSector & 0x3F);
// // // 			EndCylinder=((WORD)(MBR.Entry[ubItmp0].MBREntry.EndSector& 0xc0) <<2)|(MBR.Entry[ubItmp0].MBREntry.EndCylinder ) ;
// // // 	
// // // 			if(	BeginSector==0 & BeginCylinder==0 & EndSector==0 & EndCylinder == 0)
// // // 			{
// // // 			   uwItmp0++;		
// // // 					while(1);
// // // 			   //continue;
// // // 			}
// // // 			
// // // 			//UartString("\nMBR[");UartByteHex_(ubItmp0);UartString("]")	;
// // // 			

// // // 			NumberSectorsOffset.b[0]= MBR.Entry[ubItmp0].MBREntry.NumberSectorsOffset.b[3];
// // // 			NumberSectorsOffset.b[1]= MBR.Entry[ubItmp0].MBREntry.NumberSectorsOffset.b[2];
// // // 			NumberSectorsOffset.b[2]= MBR.Entry[ubItmp0].MBREntry.NumberSectorsOffset.b[1];
// // // 			NumberSectorsOffset.b[3]= MBR.Entry[ubItmp0].MBREntry.NumberSectorsOffset.b[0];
// // // 	
// // // 			MBRNumberSectors.b[0]= MBR.Entry[ubItmp0].MBREntry.NumberSectors.b[3];
// // // 			MBRNumberSectors.b[1]= MBR.Entry[ubItmp0].MBREntry.NumberSectors.b[2];
// // // 			MBRNumberSectors.b[2]= MBR.Entry[ubItmp0].MBREntry.NumberSectors.b[1];
// // // 			MBRNumberSectors.b[3]= MBR.Entry[ubItmp0].MBREntry.NumberSectors.b[0];
// // // 			Entry_type=MBR.Entry[ubItmp0].MBREntry.Type;

// // // 	//
// // // 	//		NumberSectorsOffset=((MBR.Entry1.MBREntry.NumberSectorsOffset&0xff000000)>>24)|
// // // 	//							((MBR.Entry1.MBREntry.NumberSectorsOffset&0x00ff0000)>>8) |
// // // 	//							((MBR.Entry1.MBREntry.NumberSectorsOffset&0x0000ff00)<<8) |
// // // 	//							((MBR.Entry1.MBREntry.NumberSectorsOffset&0x000000ff)<<24);
// // // 	//		MBRNumberSectors=   ((MBR.Entry1.MBREntry.NumberSectors&0xff000000)>>24)|
// // // 	//							((MBR.Entry1.MBREntry.NumberSectors&0x00ff0000)>>8) |
// // // 	//							((MBR.Entry1.MBREntry.NumberSectors&0x0000ff00)<<8) |
// // // 	//							((MBR.Entry1.MBREntry.NumberSectors&0x000000ff)<<24);
// // // 	//
// // // 	
// // // 		if((EndCylinder- BeginCylinder +1)<1024)
// // // 		{  //< 1024 
// // // 		
// // // 	//		NumberSectors.l	= 	((EndSector- BeginSector +1L)*
// // // 	//							(EndCylinder- BeginCylinder +1L)*						
// // // 	//							(MBR.Entry[ubItmp0].MBREntry.EndHead- MBR.Entry[ubItmp0].MBREntry.BeginHead +1L))
// // // 	//				  		  + ((EndSector- BeginSector +1L)*(EndCylinder- BeginCylinder +1L))-NumberSectorsOffset.l ;	
// // // 				
// // // 			//UartString("\n<1024,");	 
// // // 		}
// // // 		if((EndCylinder- BeginCylinder +1)>=1024)
// // // 		{ //>=1024 jump to partition sector	
// // // 		   
// // // 			//UartString("\n>=1024,");
// // // 		}

// // // 			
// // // 		//
// // //     // Number of valid data sectors in the last cluster of a file
// // //     //
// // // 		/*
// // //     SectorsOfLastCluster =
// // //         ( (UINT) (pFsFCB->fcbFileSize.UL & pFsDPB->dpbClusterBytesMask)
// // //                              + DpbBytesPerSector - 1 ) / DpbBytesPerSector;
// // // 	*/

// // // 		LBA_Sector=NumberSectorsOffset.l;count=1;
// // //     rets=SD_ReadDisk(LBA_Buff,LBA_Sector,count);//yes,already can read PBS(BOOT SECTOR) FAT(0xeb,0x3c....0x55,0xaa)
// // // 		
// // // 			for(uwItmp0=0;uwItmp0<512;uwItmp0++)
// // // 			{
// // // 				XBYTE[0x8400+uwItmp0]=LBA_Buff[uwItmp0];  //copy DMA(EPD) BUFFER buffer to BootSector BUFFER(0x8400)
// // // 		
// // // 			//	if(!(uwItmp0%16))	UartString("\n");
// // // 			//	UartByteHex_(XBYTE[0xfc00+uwItmp0]);  
// // // 			}
// // // 			MBRNumberSectors.b[0]= XBYTE[0x8400+35];//28-31
// // // 			MBRNumberSectors.b[1]= XBYTE[0x8400+34];
// // // 			MBRNumberSectors.b[2]= XBYTE[0x8400+33];
// // // 			MBRNumberSectors.b[3]= XBYTE[0x8400+32];
// // // 		//	
// // // 		//	MBRNumberSectors=   (((DWORD)(XBYTE[0xfc00+31]))<<24) |
// // // 		//						(((DWORD)(XBYTE[0xfc00+30]))<<16) |
// // // 		//						(((DWORD)(XBYTE[0xfc00+29]))<<8)  |
// // // 		//						(((DWORD)(XBYTE[0xfc00+28])));
// // // 		//	
// // // 			
// // // 		  Root_Sector=(BootSector.bpbNumberOfFATs * 																				//caculate Root Dir Sector Address
// // // 			((BootSector.bpbSectorsPerFAT.le.h8<<8)|(BootSector.bpbSectorsPerFAT.le.l8))) +
// // // 			((BootSector.bpbReservedSectors.le.h8<<8)|(BootSector.bpbReservedSectors.le.l8))+
// // // 			((BootSector.bpbHiddenSectors.le.h8<<24)|(BootSector.bpbHiddenSectors.le.mh8<<16)|
// // // 			(BootSector.bpbHiddenSectors.le.ml8<<8)|(BootSector.bpbHiddenSectors.le.l8));
// // // 			
// // // 			//RootDirSectors = ((BPB_RootEntCnt * 32) + (BPB_BytsPerSec -1)) / BPB_BytsPerSec;
// // // 		  RootDirSectors=((((BootSector.bpbRootEntries.le.h8<<8) |(BootSector.bpbRootEntries.le.l8)) *32L));
// // // 			RootDirSectors+=((((BootSector.bpbBytesPerSector.le.h8<<8) |(BootSector.bpbBytesPerSector.le.l8)-1L)));
// // // 			RootDirSectors= RootDirSectors/ (((BootSector.bpbBytesPerSector.le.h8<<8) |(BootSector.bpbBytesPerSector.le.l8)))+1L;
// // // 			
// // // 			//FirstDataSector = BPB_ResvdSecCnt + (BPB_NumFATs * FATSz) + RootDirSectors;
// // // 		  /*
// // // 			FirstData_Sector=((BootSector.bpbReservedSectors.le.h8<<8)|(BootSector.bpbReservedSectors.le.l8))+
// // // 											BootSector.bpbNumberOfFATs * ((BootSector.bpbSectorsPerFAT.le.h8<<8)|(BootSector.bpbSectorsPerFAT.le.l8))+
// // // 											RootDirSectors;
// // // 			*/
// // // 			FirstData_Sector=((BootSector.bpbReservedSectors.le.h8<<8)|(BootSector.bpbReservedSectors.le.l8))+
// // // 											BootSector.bpbNumberOfFATs * ((BootSector.bpbSectorsPerFAT.le.h8<<8)|(BootSector.bpbSectorsPerFAT.le.l8))+
// // // 											Root_Sector;
// // // 											
// // // 			//FirstSectorofCluster = ((N - 2) * BPB_SecPerClus) + FirstDataSector;
// // // 			OffsetData_Sector=FirstData_Sector-Root_Sector;

// // // 	/*
// // // 			LBA_Sector=Root_Sector;count=1;
// // //       res=SD_ReadDisk(LBA_Buff,LBA_Sector,count);//
// // // 		
// // // 			for(uwItmp0=0;uwItmp0<512;uwItmp0++)
// // // 			{
// // // 				XBYTE[0x8800+uwItmp0]=LBA_Buff[uwItmp0];  //copy DMA(EPD) BUFFER buffer to RootDir BUFFER(0x8800)
// // // 					  
// // // 			}
// // // 	    
// // // 	*/		
// // // 			
// // // 				//OpenConfigFileTxt(0,0);
// // // 	
// // // 	
// // // //			res=CDIR("BMP     ");
// // // //	  OpenConfigFileTxt("CONFIG  ");
// // // //	  res=SearchFile("0_PIC    ");
// // // 	
// // // 			
// // // 			
// // // /*			 
// // // 			 SearchFileEntry("BMP     ", Type_RootDir ,0);//search BMP in Root DIR
// // // 			 //LBA_Sector=(FindCluster.UI) * BootSector.bpbSectorsPerCluster +2048+448;   count=1;  //get dir info "BMP"			
// // // 			#ifdef SD1G	
// // // 							LBA_Sector=((FindCluster.UI) * BootSector.bpbSectorsPerCluster) +(2048+448);//1G CARD
// // // 			#else
// // // 							LBA_Sector=((FindCluster.UI) * BootSector.bpbSectorsPerCluster) +(512);//2G CARD
// // // 			#endif			 //LBA_Sector=(FindCluster.UI) * BootSector.bpbSectorsPerCluster +2048+476;   count=1;  //get dir info "BMP"			
// // // 	    
// // // */	
// // // 	
// // // 	
// // // 	/*		 
// // //        res=SD_ReadDisk(LBA_Buff,LBA_Sector,count);//
// // // 		
// // // 			for(uwItmp0=0;uwItmp0<512;uwItmp0++)
// // // 			{
// // // 				XBYTE[0x9800+uwItmp0]=LBA_Buff[uwItmp0];  //copy DMA(EPD) BUFFER buffer to RootDir BUFFER(0x8800)		
// // // 			}
// // // 	 */   
// // // 			//SearchFileEntry("0_PIC    ", Type_SubDirFile ,LBA_Sector);//search BMP in Root DIR
// // // 			//SearchFileEntry("00_0516_", Type_SubDirFile ,LBA_Sector);//search BMP in Root DIR
// // // //			SearchFileEntry("REDNWHIT", Type_SubDirFile ,LBA_Sector);//search BMP in Root DIR
// // // 			//SearchFileEntry("BW      ", Type_SubDirFile ,LBA_Sector);//search BMP in Root DIR
// // // 			
// // // //			LBA_Sector=(FindCluster.UI) * BootSector.bpbSectorsPerCluster +2048+448;   count=1;  //get file info "0_PIC"
// // // 	//		LBA_Sector=(FindCluster.UI * BootSector.bpbSectorsPerCluster )+2048L+448L;   count=1;  //get file info "0_PIC"


// // // //===========================

// // // 						//res=CDIR("ACF     ");
// // // 						//SearchFileEntry("ACF     ",8,Type_RootDir ,0);//search BMP in Root DIR
// // // 	/*				P0_0=1;//CS
// // // 						P0_1=1;//DATA
// // // 						P0_2=1;//CLK
// // // 						Delay10us();
// // // 						P0_2=0;//CLK
// // // 						Delay10us();
// // // 						P0_2=1;//CLK
// // // 						Delay10us();
// // // 						P0_2=0;//CLK
// // // 						Delay10us();
// // // 						*/
// // // 						P0_0=1;//cs
// // // 						SearchFileEntry("TOP_RT~1",8,Type_RootFile ,0);//search ACF in Root DIR
// // // 						//P0_2=0;//CLK		
// // // 						
// // // 						P0_0=0;//cs
// // // 						checksum=0L;
// // // 						wordcounter=0;	
// // // 						for(uwItmp0=0;uwItmp0<(UINT)(FileSize/512L);uwItmp0++)
// // // 						{									
// // // 								
// // // 							
// // // 								while(1)
// // // 								{		
// // //                    for(ps_x=0;ps_x<512;ps_x++)
// // // 								   { 
// // // 										 LBA_Buff[ps_x]=0xff;
// // // 									 }
// // // 									 
// // // 										 
// // // 									 rets=SD_ReadDisk(LBA_Buff,LBA_Sector,count);//									 
// // // 									 
// // // 									 if(rets==0x00)
// // // 											 break;
// // // 									 if(rets==0xff)
// // // 											 continue;
// // // 									 if(rets==0x01)
// // // 											 continue;
// // // 									 if(rets==0x04)//JONES illegal command
// // // 											 continue;	
// // // 									 if(rets==0x20)//JONES address error
// // // 											 continue;	
// // // 									 if(rets==0x1f)//JONES ??? error
// // // 											 continue;
// // // 									 if(rets==0x09)//JONES cmd crc error & idle
// // // 											 continue;
// // // 									 if(rets==0x7f)//JONES ???
// // // 											 continue;
// // // 									 if((LBA_Buff[0]==0xff) && (LBA_Buff[1]==0xff) && (LBA_Buff[2]==0xff)&& (LBA_Buff[3]==0xff))
// // // 									     continue;
// // // 										// if(rets!=0xff)
// // // 										//	 break;
// // // 									 
// // // 									 
// // // 								}
// // // 								
// // // 								
// // // 								for(ps_x=0;ps_x<512;ps_x++)
// // // 								{ 
// // // 									checksum+=LBA_Buff[ps_x]+0L;
// // // 									wordcounter++;
// // // 									bit_mask=0x80;
// // // 									for(i_mask=0;i_mask<8;i_mask++)
// // // 									{
// // // 										 P0_2=0;//clk
// // // 										 Delay10us();
// // // 										 if(LBA_Buff[ps_x] & bit_mask)//data
// // // 												P0_1=1;
// // // 										 else
// // // 												P0_1=0;
// // // 										 Delay10us();
// // // 										 P0_2=1;//clk
// // // 										 Delay10us();
// // // 										 bit_mask>>=1;
// // // 										 
// // // 									}
// // // 									Delay10us();
// // // 									//Delay10us();
// // // 									//Delay10us();
// // // 								}
// // // 								LBA_Sector++;//jones

// // // 							}
// // // 							
// // // 								//4.发送数据																										
// // // 								//Uart0SendBuffer(LBA_Buff, 512);
// // // 							
// // // 							//LBA_Sector++;//jones
// // // 							
// // // 							//FindCluster.be.h8=RootDir[iw].dirFirstCluster.le.h8 ;
// // // 							//FindCluster.be.l8=RootDir[iw].dirFirstCluster.le.l8 ;
// // // 							//LBA_Sector=(FindCluster.UI * BootSector.bpbSectorsPerCluster )+2048L+448L;   count=1;  //get file info "0_PIC"
// // // 							//LBA_Sector=((FindCluster.UI) * BootSector.bpbSectorsPerCluster) +(512);//2G CARD
// // // 							
// // // 					/*
// // // 								if(FileSize % 512L)
// // // 								{
// // // 									unsigned int xdata ps_x;
// // // 									unsigned char xdata bit_mask,i_mask;
// // // 									while(1)
// // // 									{							
// // // 										 rets=SD_ReadDisk(LBA_Buff,LBA_Sector,count);//
// // // 										 if(rets==0x00)
// // // 											 break;
// // // 									   if(rets==0xff)
// // // 											 continue;
// // // 									 	if(rets==0x01)
// // // 											 continue;
// // // 										// if(rets!=0xff)
// // // 										//	 break;
// // // 									}	
// // // 									*/
// // // 									for(ps_x=0;ps_x<512;ps_x++)
// // // 								   { 
// // // 										 LBA_Buff[ps_x]=0xff;
// // // 									 }
// // // 									while(1)
// // // 									{		
// // // 										 for(ps_x=0;ps_x<512;ps_x++)
// // // 										 { 
// // // 											 LBA_Buff[ps_x]=0xff;
// // // 										 }
// // // 										 
// // // 											 
// // // 										 rets=SD_ReadDisk(LBA_Buff,LBA_Sector,count);//									 
// // // 										 
// // // 										 if(rets==0x00)
// // // 												 break;
// // // 										 if(rets==0xff)
// // // 												 continue;
// // // 										 if(rets==0x01)
// // // 												 continue;
// // // 										 if(rets==0x04)//JONES illegal command
// // // 												 continue;	
// // // 										 if(rets==0x20)//JONES address error
// // // 												 continue;	
// // // 										 if(rets==0x1f)//JONES ??? error
// // // 												 continue;
// // // 										 if(rets==0x09)//JONES cmd crc error & idle
// // // 												 continue;
// // // 										 if(rets==0x7f)//JONES ???
// // // 												 continue;
// // // 										 if((LBA_Buff[0]==0xff) && (LBA_Buff[1]==0xff) && (LBA_Buff[2]==0xff)&& (LBA_Buff[3]==0xff))
// // // 												 continue;
// // // 											// if(rets!=0xff)
// // // 											//	 break;
// // // 										 
// // // 										 
// // // 									}
// // // 								
// // // 									
// // // 									ps_x=FileSize % 512;
// // // 									for(ps_x=0;ps_x<(UINT)(FileSize % 512L);ps_x++)
// // // 									{ 
// // // 										checksum += LBA_Buff[ps_x]+0L;
// // // 										wordcounter++;
// // // 										bit_mask=0x80;
// // // 										for(i_mask=0;i_mask<8;i_mask++)
// // // 										{
// // // 											 P0_2=0;//clk
// // // 											 Delay10us();
// // // 											 if(LBA_Buff[ps_x] & bit_mask)//data
// // // 													P0_1=1;
// // // 											 else
// // // 													P0_1=0;
// // // 											 Delay10us();
// // // 											 P0_2=1;//clk
// // // 											 Delay10us();
// // // 											 bit_mask>>=1;
// // // 											 
// // // 										}
// // // 										Delay10us();																								
// // // 									}
// // // 										
// // // 									for(i_mask=0;i_mask<32;i_mask++)
// // // 									{
// // // 										 P0_2=0;//clk
// // // 										Delay10us();
// // // 										 P0_1=1;//data
// // // 										Delay10us();
// // // 										 P0_2=1;//clk
// // // 										Delay10us();
// // // 										 P0_1=1;//data
// // // 										Delay10us();
// // // 									}
// // // 									P0_2=1;//clk
// // // 									P0_0=1;	//cs			
// // // 								//}
// // // 									
// // // 								
// // // 												
// // // 	checksum++;				//if 0x4f54c2 is pass
// // //   wordcounter++;			//0x56cad		
//  reset();									
//while(1);

//===========================
// // //}
	





//   #define XBYTE           ((UBYTE volatile xdata*)0) 
// // XBYTE = 0x8000
// 	UCHAR xdata LBA_Buff[512]			_at_ 0x8200;	// Data buffer to store read data 
//   PBS	xdata BootSector 					_at_ 0x8400;	// Struct buffer to conver buffer read data 
//   MasterBootRecord_t xdata MBR  _at_ 0x8600;	//MBR
//   DIR xdata RootDir[128]        _at_ 0x8800;  //0x8800~0x97FF (8 sector *512 Byte)
//   DIR xdata SubDir[128]     	  _at_ 0x9800;  //0x9800~0xA7FF (8 sector *512 Byte)
//   UCHAR xdata ConfigFileTxt[512]			_at_ 0xA800;	// 0xA800~0xA9FF Data buffer to store read data 
//                                                 
// //  DIR xdata RootDir[512]			  _at_ 0x8800;  //0x8800~0xC7FF	//Root Dir  //512 * 32 byte=16K byte
// 																							//0xD000~0xffff (~64K)
// 																							//0xB000~0xDFFF  XDATA START ADDRESS
// 	data UBYTE BeginSector			;	
// 	data UBYTE EndSector				;
// 	data UBYTE BeginHead				;
//   data UBYTE EndHead					;
// 	data WORD EndCylinder				;	
// 	data WORD BeginCylinder			;
// 	data UNION32 NumberSectors	;
// 	data UNION32 NumberSectorsOffset	;
// 	data UNION32 MBRNumberSectors			;
//   
// 	ULONG xdata Root_Sector;	// Root Sector address (RTA) //
// 	ULONG xdata RootDirSectors;
// 	ULONG xdata FirstData_Sector;	// First Data Sector address (RTA) //FirstData_Sector
// 	ULONG xdata OffsetData_Sector;
// 	ULONG xdata LBA_Sector;	// Sector address (LBA) //
// 	ULONG xdata CurrentDir_Sector;	// Sector address (LBA) //
// 	ULONG xdata CurrentFile_Sector;	// Sector address (LBA) //
// 	BYTE xdata count;		// Number of sectors to read (1..255) //
// 	//MBR xdata MBRdata ;
//   //MBR xdata *PXUMBR;
// 	
//   ULONG xdata FindFileSector;
// 	ULINT xdata dirFirstCluster;
// 	ULINT xdata FindCluster;
// 	ULONG xdata FileSize;
// #define Type_RootDir  1
// #define Type_SubDir   2
// #define Type_RootFile 3
// #define Type_SubDirFile 4
// #define Type_DirXX_File 5
// UCHAR SearchFileEntry(CHAR name[12],UCHAR CheckLen, UCHAR type ,ULONG Dir_Sector)
// {
// 	
// 	UCHAR data res=0,CheckRes=0;
// 	ULONG xdata havenex=0;	
// 	UWORD data iw ;
// 	ULONG i;
// 	
// 	
// 	
// 	//RootDirSectors = ((BPB_RootEntCnt * 32) + (BPB_BytsPerSec -1)) / BPB_BytsPerSec;
// 	/*
// 			If(BPB_FATSz16 != 0)
// 				FATSz = BPB_FATSz16;
// 			Else
// 				FATSz = BPB_FATSz32; 

// 		FirstDataSector = BPB_ResvdSecCnt + (BPB_NumFATs * FATSz) + RootDirSectors;

// 		FirstSectorofCluster = ((N - 2) * BPB_SecPerClus) + FirstDataSector;
// 	
// 		If(BPB_FATSz16 != 0)
// 			FATSz = BPB_FATSz16;
// 		Else
// 			FATSz = BPB_FATSz32;  

// 		If(BPB_TotSec16 != 0)
// 			TotSec = BPB_TotSec16;
// 		Else
// 			TotSec = BPB_TotSec32;

// 		DataSec = TotSec -(BPB_ResvdSecCnt + (BPB_NumFATs * FATSz) + RootDirSectors);
// 		
// 		CountofClusters = DataSec / BPB_SecPerClus;
// 		If(CountofClusters < 4085) {
// 			// Volume is FAT12 
// 			} else if(CountofClusters < 65525) {
// 					// Volume is FAT16 
// 			} else {
// 					// Volume is FAT32 
// 			}
// 			
// 			If(BPB_FATSz16 != 0)
// 					 FATSz = BPB_FATSz16;
// 			 Else
// 					FATSz = BPB_FATSz32;  

// 			If(FATType == FAT16)
// 					FATOffset = N * 2;
// 			Else if (FATType == FAT32)
// 					FATOffset = N * 4;

// 			ThisFATSecNum = BPB_ResvdSecCnt + (FATOffset / BPB_BytsPerSec);
// 			ThisFATEntOffset = REM(FATOffset / BPB_BytsPerSec);
// 			
// 			
// 			If(FATType == FAT16)
// 					FAT16ClusEntryVal = *((WORD *) &SecBuff[ThisFATEntOffset]);
// 			Else
// 					FAT32ClusEntryVal = (*((DWORD *) &SecBuff[ThisFATEntOffset])) & 0x0FFFFFFF;

// 			Fetches the contents of that cluster. To set the contents of this same cluster you do the following:

// 			If(FATType == FAT16)
// 					*((WORD *) &SecBuff[ThisFATEntOffset]) = FAT16ClusEntryVal;
// 			Else {
// 					 FAT32ClusEntryVal = FAT32ClusEntryVal & 0x0FFFFFFF;
// 					*((DWORD *) &SecBuff[ThisFATEntOffset]) =
// 							(*((DWORD *) &SecBuff[ThisFATEntOffset])) & 0xF0000000;
// 					*((DWORD *) &SecBuff[ThisFATEntOffset]) = 
// 							(*((DWORD *) &SecBuff[ThisFATEntOffset])) | FAT32ClusEntryVal;
// 							
// 				if (FATType == FAT12)
//         FATOffset = N + (N / 2);    
// 				// Multiply by 1.5 without using floating point, the divide by 2 rounds DOWN 
//     
// 				ThisFATSecNum = BPB_ResvdSecCnt + (FATOffset / BPB_BytsPerSec);
// 				ThisFATEntOffset = REM(FATOffset / BPB_BytsPerSec);
// 			
// 							
// }
// 			
// 	*/
// 	count=1;
// 	
// 	if(type==Type_RootDir)
// 	{
// 		LBA_Sector=0;
// 		
// 		res=SD_ReadDisk(LBA_Buff,LBA_Sector,count);	
// 	
// 		for(iw=0;iw<512;iw++)		  //copy LBA BUFFER buffer to decode MBR(0x8600)
// 		{
// 			XBYTE[0x8600+iw]=LBA_Buff[iw];  
// 		}
// 		/*
// 		//RootDirSectors = ((BPB_RootEntCnt * 32) + (BPB_BytsPerSec -1)) / BPB_BytsPerSec;
// 	
// 			If(BPB_FATSz16 != 0)
// 				FATSz = BPB_FATSz16;
// 			Else
// 				FATSz = BPB_FATSz32; 

// 		FirstDataSector = BPB_ResvdSecCnt + (BPB_NumFATs * FATSz) + RootDirSectors;
// 		FirstSectorofCluster = ((N - 2) * BPB_SecPerClus) + FirstDataSector;
// 	*/
// 		
// 		
// 		
// 		Root_Sector=BootSector.bpbNumberOfFATs * 																				//caculate Root Dir Sector Address
// 		((BootSector.bpbSectorsPerFAT.le.h8<<8)|(BootSector.bpbSectorsPerFAT.le.l8)) +
// 		((BootSector.bpbReservedSectors.le.h8<<8)|(BootSector.bpbReservedSectors.le.l8))+
// 		((BootSector.bpbHiddenSectors.le.h8<<24)|(BootSector.bpbHiddenSectors.le.mh8<<16)|
// 		(BootSector.bpbHiddenSectors.le.ml8<<8)|(BootSector.bpbHiddenSectors.le.l8));
// 		
// 		//RootDirSectors = ((BPB_RootEntCnt * 32) + (BPB_BytsPerSec -1)) / BPB_BytsPerSec;
// 		//Root_Sector=((BootSector.bpbRootEntries.UI *32)+(BootSector.bpbBytesPerSector.UI-1))/BootSector.bpbBytesPerSector.UI;
// 		
// 		
// 		
// 		
// 	}
// 	switch(type)
// 	{
// 		case Type_RootDir:			

// 			LBA_Sector=Root_Sector;count=1;
// 			for(i=0;i<32;i++) // root dir have 512 entry, 512*32=16K,=32 sector
// 			{									// root dir have 512 entry, 512*32=16K,=32 sector
// 					res=SD_ReadDisk(LBA_Buff,LBA_Sector,count);//

// 					for(iw=0;iw<512;iw++)
// 					{
// 						XBYTE[0x8800+iw]=LBA_Buff[iw];  //copy DMA(EPD) BUFFER buffer to RootDir BUFFER(0x8800)
// 					}			
// 					for(iw=0;iw<16;iw++)
// 					{
// 						if(
// 								RootDir[iw].dirFilename[0]==name[0] && 
// 								RootDir[iw].dirFilename[1]==name[1] &&
// 								RootDir[iw].dirFilename[2]==name[2] &&
// 								RootDir[iw].dirFilename[3]==name[3] && 
// 								RootDir[iw].dirFilename[4]==name[4] &&
// 								RootDir[iw].dirFilename[5]==name[5] &&
// 								RootDir[iw].dirFilename[6]==name[6] && 
// 								RootDir[iw].dirFilename[7]==name[7] 
// 								
// 						) 
// 						{ 
// 							
// 							FindCluster.be.h8=RootDir[iw].dirFirstCluster.le.h8 ;
// 							FindCluster.be.l8=RootDir[iw].dirFirstCluster.le.l8 ;
// 						#ifdef SD1G	
// 							//LBA_Sector=Root_Sector+32;
// 							LBA_Sector=((FindCluster.UI) * BootSector.bpbSectorsPerCluster) +(2048+448);//1G CARD
// 							//LBA_Sector=((FindCluster.UI) * BootSector.bpbSectorsPerCluster) +
// 							//              BootSector.bpbReservedSectors.UI+
// 							//              BootSector.bpbNumberOfFATs*BootSector.bpbSectorsPerFAT.be.h8+
// 							//              32;
// 							//Root_Sector=0x9e0=2528
// 							//2528-2048-448=32
// 							//(1024+238*2+448);//1G CARD
// 							//2048+448
// 							//hidden+FAT_RESV+FAT*2+FAT16root
// 						#else
// 							//LBA_Sector=((FindCluster.UI) * BootSector.bpbSectorsPerCluster) +(512+3);//2G CARD
// 							
// 							
// 							//=(5-2)* 64 + 2*235 + 2 + 32 =696 +137 = 833
// 							
// 							LBA_Sector=(((FindCluster.UI-2) * BootSector.bpbSectorsPerCluster) +
// 							(BootSector.bpbNumberOfFATs*((BootSector.bpbSectorsPerFAT.le.h8<<8)|(BootSector.bpbSectorsPerFAT.le.l8)))+
// 							((BootSector.bpbReservedSectors.le.h8<<8)|(BootSector.bpbReservedSectors.le.l8))+
// 							32)+
// 							((BootSector.bpbHiddenSectors.le.h8<<24)|(BootSector.bpbHiddenSectors.le.mh8<<16)|
// 		           (BootSector.bpbHiddenSectors.le.ml8<<8)|(BootSector.bpbHiddenSectors.le.l8));


// 							#endif
// /*		
// logical_sector=( cluster-2)*sectors_per_cluster+sector_of_file_area_offset;
// FAT12/16
// 							Logical sector =0 Logical sector=1(Floppy disk=1~9) 
// 							Logical sector=1+sectors_per_FAT(Floppydisk=10~18) 
// 							Logical sector=1+sectors_per_FAT*2(Floppy disk=19~32) 
// 							Logical sector=1+sectors_per_FAT*2+sectors_of_rootdirectories(Floppy disk=33~)
// 							DOS Boot Sector FAT1 FAT2 ROOT Directory Data area(where files and subdirectories 
// 							are stored)FAT32Usually 32 sectors 
// 							Logical sector =0032h Logical sector =0032h+ 2*sectors_per_FAT
// 							DOS Boot Recore 3 Sectors Reserved sectors Copy of record Reserve sectors FAT1 FAT2 Data area
// 							(where files and all bdirectories are stored)		


// 							Root_Sector=BootSector.bpbNumberOfFATs * 																				//caculate Root Dir Sector Address
// 		((BootSector.bpbSectorsPerFAT.le.h8<<8)|(BootSector.bpbSectorsPerFAT.le.l8)) +
// 		((BootSector.bpbReservedSectors.le.h8<<8)|(BootSector.bpbReservedSectors.le.l8))+
// 		((BootSector.bpbHiddenSectors.le.h8<<24)|(BootSector.bpbHiddenSectors.le.mh8<<16)|
// 		(BootSector.bpbHiddenSectors.le.ml8<<8)|(BootSector.bpbHiddenSectors.le.l8));
// */							
// 							
// 							
// 							CurrentDir_Sector=LBA_Sector;
// 							FileSize=RootDir[iw].dirFileSize.UL;
// 							
// 							return 1;//search OK
// 							
// 						}
// 						
// 					}	
// 					LBA_Sector++;
// 				}
// 			break;
// 		case Type_RootFile:
// 			LBA_Sector=Root_Sector;count=1;
// 		  
// 		for(i=0;i<32;i++)// root dir have 512 entry, 512*32=16K,=32 sector
// 		{
// 			res=SD_ReadDisk(LBA_Buff,LBA_Sector,count);//

// 			for(iw=0;iw<512;iw++)
// 			{
// 				XBYTE[0x8800+iw]=LBA_Buff[iw];  //copy DMA(EPD) BUFFER buffer to RootDir BUFFER(0x8800)
// 			}	
// 			for(iw=0;iw<128;iw++)//  one enter per 128 byte
// 			{
// 				if(
// 						RootDir[iw].dirFilename[0]==name[0] && 
// 						RootDir[iw].dirFilename[1]==name[1] &&
// 						RootDir[iw].dirFilename[2]==name[2] &&
// 				    RootDir[iw].dirFilename[3]==name[3] && 
// 						RootDir[iw].dirFilename[4]==name[4] &&
// 						RootDir[iw].dirFilename[5]==name[5] &&
// 				    RootDir[iw].dirFilename[6]==name[6] && 
// 						RootDir[iw].dirFilename[7]==name[7] 
// 						
// 				) 
// 				{ 
// 					FindCluster.be.h8=RootDir[iw].dirFirstCluster.le.h8 ;
//      			FindCluster.be.l8=RootDir[iw].dirFirstCluster.le.l8 ;
// 					//CurrentDir_Sector=LBA_Sector;
// 					  #ifdef SD1G	
// 					//		LBA_Sector=((FindCluster.UI) * BootSector.bpbSectorsPerCluster) +(2048+448);//1G CARD
// 					//LBA_Sector=((FindCluster.UI) * BootSector.bpbSectorsPerCluster)+Root_Sector-32;////1G CARD
// 					//LBA_Sector=((FindCluster.UI-2) * BootSector.bpbSectorsPerCluster)+Root_Sector+32;////1G CARD  OK
// 					//LBA_Sector=((FindCluster.UI) * BootSector.bpbSectorsPerCluster)+Root_Sector-96;////2G CARD
// 					LBA_Sector=((FindCluster.UI-2) * BootSector.bpbSectorsPerCluster)+Root_Sector+RootDirSectors;////2G CARD  OK//RootDirSectors=32L
// 					
// 					   //LBA_Sector=(((FindCluster.UI) * BootSector.bpbSectorsPerCluster) +2048+448);//1G CARD
// 					   //LBA_Sector=Root_Sector+32;
// 			/*				LBA_Sector=((FindCluster.UI) * BootSector.bpbSectorsPerCluster)+                 //768
// 					     BootSector.bpbNumberOfFATs * 																				
// 							((BootSector.bpbSectorsPerFAT.le.h8<<8)|(BootSector.bpbSectorsPerFAT.le.l8)) +   //238
// 							((BootSector.bpbReservedSectors.le.h8<<8)|(BootSector.bpbReservedSectors.le.l8))+//  4
// 							((BootSector.bpbHiddenSectors.le.h8<<24)|(BootSector.bpbHiddenSectors.le.mh8<<16)|// 0
// 							(BootSector.bpbHiddenSectors.le.ml8<<8)|(BootSector.bpbHiddenSectors.le.l8))+//   2048
// 					     32;																																							//32																																					
// 					*/    //                          
// 					
// 					
// 					
// 						#else
// 							LBA_Sector=((FindCluster.UI) * BootSector.bpbSectorsPerCluster) +(515);//2G CARD //?????
// 						#endif
// 					FileSize=RootDir[iw].dirFileSize.le.h8;
// 					FileSize <<= 8;
// 					FileSize +=RootDir[iw].dirFileSize.le.mh8;
// 					FileSize <<= 8;
// 					FileSize +=RootDir[iw].dirFileSize.le.ml8;
// 					FileSize <<= 8;
// 					FileSize +=RootDir[iw].dirFileSize.le.l8;
// 					
// 					
// 					
// 					return 1;//search OK
// 					
// 				}
// 				LBA_Sector++;
// 			}
// 			}			
// 			break;
// 			
// 		case Type_SubDir:
// 			LBA_Sector=Dir_Sector;count=1;
// 			res=SD_ReadDisk(LBA_Buff,LBA_Sector,count);//

// 			for(iw=0;iw<512;iw++)
// 			{
// 				XBYTE[0x9800+iw]=LBA_Buff[iw];  //copy DMA(EPD) BUFFER buffer to SubDir BUFFER(0x9800)
//  
// 			}
// 			break;
// 		
// 		case Type_SubDirFile:
// 			//need check next clustor
// 		
// 			LBA_Sector=Dir_Sector;
// 		  count=1;//LBA_Sector
// 		 havenex=1;
//      while(havenex) 
// 		 { 
// 			res=SD_ReadDisk(LBA_Buff,LBA_Sector,count);//

// 			for(iw=0;iw<512;iw++)
// 			{
// 				XBYTE[0x9800+iw]=LBA_Buff[iw];  //copy DMA(EPD) BUFFER buffer to SubDir BUFFER(0x9800)
// 			}		
//       for(iw=0;iw<32;iw++)
// 			{
// 				if(
// 						SubDir[iw].dirFilename[0]==name[0] && 
// 						SubDir[iw].dirFilename[1]==name[1] &&
// 						SubDir[iw].dirFilename[2]==name[2] &&
// 				    SubDir[iw].dirFilename[3]==name[3] && 
// 						SubDir[iw].dirFilename[4]==name[4] &&
// 						SubDir[iw].dirFilename[5]==name[5] &&
// 				    SubDir[iw].dirFilename[6]==name[6] && 
// 						SubDir[iw].dirFilename[7]==name[7] 
// 						
// 				) 
// 				{ 
// 					FindCluster.be.h8=SubDir[iw].dirFirstCluster.le.h8 ;
//      			FindCluster.be.l8=SubDir[iw].dirFirstCluster.le.l8 ;
// 					
// 					#ifdef SD1G	
// 							LBA_Sector=((FindCluster.UI) * BootSector.bpbSectorsPerCluster) +(2048+448);//1G CARD
// 						#else
// 							//LBA_Sector=((FindCluster.UI) * BootSector.bpbSectorsPerCluster) +(512);//2G CARD
// 					
// 					
// 					//=(5-2)* 64 + 2*235 + 2 + 32 =696 +137 = 833
// 							
// 							LBA_Sector=(((FindCluster.UI-2) * BootSector.bpbSectorsPerCluster) +
// 							(BootSector.bpbNumberOfFATs*((BootSector.bpbSectorsPerFAT.le.h8<<8)|(BootSector.bpbSectorsPerFAT.le.l8)))+
// 							((BootSector.bpbReservedSectors.le.h8<<8)|(BootSector.bpbReservedSectors.le.l8))+
// 							32)+
// 							((BootSector.bpbHiddenSectors.le.h8<<24)|(BootSector.bpbHiddenSectors.le.mh8<<16)|
// 		           (BootSector.bpbHiddenSectors.le.ml8<<8)|(BootSector.bpbHiddenSectors.le.l8));
// 					
// 						#endif
// 					
// 					FileSize=SubDir[iw].dirFileSize.le.h8;
// 					FileSize <<= 8;
// 					FileSize +=SubDir[iw].dirFileSize.le.mh8;
// 					FileSize <<= 8;
// 					FileSize +=SubDir[iw].dirFileSize.le.ml8;
// 					FileSize <<= 8;
// 					FileSize +=SubDir[iw].dirFileSize.le.l8;
// 			
// // 					FileSize=(SubDir[uwItmp0].dirFileSize.le.l8);
// // 					FileSize+=(SubDir[uwItmp0].dirFileSize.le.ml8)<<8;
// // 					FileSize+=(SubDir[uwItmp0].dirFileSize.le.mh8)<<16;
// // 					FileSize+=(SubDir[uwItmp0].dirFileSize.le.h8)<<24;
// 					
// 			/*		FileSize=((SubDir[uwItmp0].dirFileSize.le.l8<<24)  |
// 					         (SubDir[uwItmp0].dirFileSize.le.ml8<<16) |
// 					         (SubDir[uwItmp0].dirFileSize.le.mh8<<8)  |
// 									 (SubDir[uwItmp0].dirFileSize.le.h8))	;
// 					*/
// 					havenex=0;
// 					return 1;
// 					
// 				}
// 			}
// 			LBA_Sector++;
// 		}
// 			break;
// 		case Type_DirXX_File:
// 			//need check next clustor
// 		
// 			LBA_Sector=Dir_Sector;
// 		  count=1;//LBA_Sector
// 		 havenex=0x40;
// 		 FileSize=0;
//      while(havenex--) 
// 		 {
// 			res=SD_ReadDisk(LBA_Buff,LBA_Sector,count);//
//       
// 			for(iw=0;iw<512;iw++)
// 			{
// 				XBYTE[0x9800+iw]=LBA_Buff[iw];  //copy DMA(EPD) BUFFER buffer to SubDir BUFFER(0x9800)
// 			}		
//       for(iw=0;iw<32;iw++)
// 			{
// 				if(CheckLen==2)
// 				{
// 					  CheckRes=	SubDir[iw].dirFilename[0]==name[0] && 
// 											SubDir[iw].dirFilename[1]==name[1] ;
// 											   
// 				}
// 				if(CheckLen==3)
// 				{
// 					  CheckRes= SubDir[iw].dirFilename[0]==name[0] && 
// 											SubDir[iw].dirFilename[1]==name[1] &&
// 											SubDir[iw].dirFilename[2]==name[2] ;   
// 					
// 				}
// 				if( CheckRes ) 
// 				{ 
// 					FindCluster.be.h8=SubDir[iw].dirFirstCluster.le.h8 ;
//      			FindCluster.be.l8=SubDir[iw].dirFirstCluster.le.l8 ;
// 					
// 					#ifdef SD1G	
// 							LBA_Sector=((FindCluster.UI) * BootSector.bpbSectorsPerCluster) +(2048+448);//1G CARD
// 						#else
// 							LBA_Sector=((FindCluster.UI) * BootSector.bpbSectorsPerCluster) +(515);//2G CARD //?????
// 						#endif
// 					
// 					FileSize=SubDir[iw].dirFileSize.le.h8;
// 					FileSize <<= 8;
// 					FileSize +=SubDir[iw].dirFileSize.le.mh8;
// 					FileSize <<= 8;
// 					FileSize +=SubDir[iw].dirFileSize.le.ml8;
// 					FileSize <<= 8;
// 					FileSize +=SubDir[iw].dirFileSize.le.l8;
// 			
// 					if(FileSize==0)
// 					{
// 						havenex=0;
// 						return 1;
// 					}
// 					
// // 					FileSize=(SubDir[uwItmp0].dirFileSize.le.l8);
// // 					FileSize+=(SubDir[uwItmp0].dirFileSize.le.ml8)<<8;
// // 					FileSize+=(SubDir[uwItmp0].dirFileSize.le.mh8)<<16;
// // 					FileSize+=(SubDir[uwItmp0].dirFileSize.le.h8)<<24;
// 					
// 			/*		FileSize=((SubDir[uwItmp0].dirFileSize.le.l8<<24)  |
// 					         (SubDir[uwItmp0].dirFileSize.le.ml8<<16) |
// 					         (SubDir[uwItmp0].dirFileSize.le.mh8<<8)  |
// 									 (SubDir[uwItmp0].dirFileSize.le.h8))	;
// 					*/
// 					havenex=0;
// 					return 1;
// 					
// 				}
// 			}
// 			LBA_Sector++;
// 			
// 		}
// 			break;
// 		
// 		default:
// 			
// 			break;
// 	}
// 		

// 	
// 	
// 	return 0;//not find
// }
//   
// 	


// void OpenConfigFileTxt(char *FilePath,char *FileName);
// UCHAR CDIR(char *Directory);
// UCHAR SearchFile(char *Filename);

// int CheckBit;




/*


			CheckBit=0;	
//1.设定更新串口速率
    //if(!(UartCmdSetUpdateType(CONFIG_UPDATE_TYPE,0x00,15)))    //Update bandrate set to 921600bps
		if(!(UartCmdSetUpdateType(CONFIG_UPDATE_TYPE,0x00,7)))    //Update bandrate set to 115200bps
		{
			UCHAR Update_Dirs;
			
			for(Update_Dirs=0;Update_Dirs<2;Update_Dirs++)
			{
			for(loop99=0;loop99<50;loop99++)
			{
				if(Update_Dirs==0)
				{
					 res=CDIR("ACF     ");
					 SearchFileEntry("ACF     ",8,Type_RootDir ,0);//search BMP in Root DIR
				}
				else if(Update_Dirs==1)
				{
					 res=CDIR("FONTLIB ");
					 SearchFileEntry("FONTLIB ",8,Type_RootDir ,0);//search FONT in Root DIR

				}
			 #ifdef SD1G	
							LBA_Sector=((FindCluster.UI) * BootSector.bpbSectorsPerCluster) +(2048+448);//1G CARD
			#else
				
							//LBA_Sector+=3;//((FindCluster.UI) * BootSector.bpbSectorsPerCluster) +(512+3);//2G CARD
			#endif
				
			
//send bufer to uart  //  FileSize  /512
				if(loop99<10)
				{
					str99[0]='0'+(loop99);
					str99[1]='_';
					str99[2]=0;
					str99[3]=0;
				}
				else
				{
					str99[0]='0'+(loop99/10);
					str99[1]='0'+(loop99%10);
					str99[2]='_';
					str99[3]=0;
				}
				
			if(SearchFileEntry(str99,loop99<10?2:3 , Type_DirXX_File ,LBA_Sector)==1)//search BMP in Root DIR
			{	
				#ifdef SD1G	
							LBA_Sector=((FindCluster.UI) * BootSector.bpbSectorsPerCluster) +(2048+448);//1G CARD
				#else
							//LBA_Sector=((FindCluster.UI) * BootSector.bpbSectorsPerCluster) +(512+3);//2G CARD 512+3
				
				//=(6-2)* 64 + 2*235 + 2 + 32 =696 +137 = 897
							
							LBA_Sector=(((FindCluster.UI-2) * BootSector.bpbSectorsPerCluster) +
							(BootSector.bpbNumberOfFATs*((BootSector.bpbSectorsPerFAT.le.h8<<8)|(BootSector.bpbSectorsPerFAT.le.l8)))+
							((BootSector.bpbReservedSectors.le.h8<<8)|(BootSector.bpbReservedSectors.le.l8))+
							32)+
							((BootSector.bpbHiddenSectors.le.h8<<24)|(BootSector.bpbHiddenSectors.le.mh8<<16)|
		           (BootSector.bpbHiddenSectors.le.ml8<<8)|(BootSector.bpbHiddenSectors.le.l8));
				
				
				
				#endif
				CheckBit=0;	
			
			

          
      //2.设定更新类型
			if(Update_Dirs==0)
				UPDATE_TYPEa=PICTURE_UPDATE_TYPE;
			if(Update_Dirs==1)
				UPDATE_TYPEa=FONTLIB_UPDATE_TYPE;
      				
				
      if(!(UartCmdSetUpdateType(UPDATE_TYPEa,0x00,loop99)))  //Update Pic0
      {
				for(uwItmp0=0;uwItmp0<(FileSize/512);uwItmp0++)
				{		 
					
					res=SD_ReadDisk(LBA_Buff,LBA_Sector,count);//
					if(res)
					{
						char error;
						error=1;
						while(1)
						{							
						   res=SD_ReadDisk(LBA_Buff,LBA_Sector,count);//
							 if(res!=0xff)
								 break;
							 else
							 {
									char error;
									error=1;
							 }
						}
					
					}
					
						//4.发送数据
					while(GetBufferReadyFlagStatus());
					
					//memset(LBA_Buff,0xf0,512);
					
					UartCmdSendUpdateData(LBA_Buff,512);
					//Uart0SendBuffer(LBA_Buff, 512);
					
					LBA_Sector++;
					//FindCluster.be.h8=RootDir[iw].dirFirstCluster.le.h8 ;
					//FindCluster.be.l8=RootDir[iw].dirFirstCluster.le.l8 ;
					//LBA_Sector=(FindCluster.UI * BootSector.bpbSectorsPerCluster )+2048L+448L;   count=1;  //get file info "0_PIC"
					//LBA_Sector=((FindCluster.UI) * BootSector.bpbSectorsPerCluster) +(512);//2G CARD
					
				}
				if(FileSize % 512)
				{
					res=SD_ReadDisk(LBA_Buff,LBA_Sector,count);//
					
				}
				UartCmdSendUpdateData(LBA_Buff,FileSize % 512);
					//5.发送最后一个包,最后一个包的长度是0也要发送,用来终结一幅图或一个字库更新
				        
			}
      
      
    }
		else
		{
			//not find.
			CheckBit=1;
		}
		
	}
}
}
UartCmdUpdateEnd();
    while(1);
			
	}
*/	




// UCHAR CDIR_Root(char *Directory)
// {
//   UCHAR data res=0;
// 	
// 	
// 	
// 	res=SearchFileEntry(Directory,8, Type_RootDir ,0);//search DIRECTORY in Root DIR
// 	if(res==1)
// 	{
// 		  
// 			return 1;
// 	}
// 							/*  return 1 ,when serach Find and set cluster in FindCluster.
// 	                //FindCluster.be.h8=RootDir[uwItmp0].dirFirstCluster.le.h8 ;
// 									//FindCluster.be.l8=RootDir[uwItmp0].dirFirstCluster.le.l8 ;
// 							*/
// 	else
// 		  return 0;
// 	
// }
// UCHAR CDIR(char *Directory)
// {
//   UCHAR data res=0;
// 	
// 	
// 	
// 	res=SearchFileEntry(Directory,8, Type_RootDir ,CurrentDir_Sector);//search DIRECTORY in Root DIR
// 	if(res==1)
// 			return 1;
// 							/*  return 1 ,when serach Find and set cluster in FindCluster.
// 	                //FindCluster.be.h8=RootDir[uwItmp0].dirFirstCluster.le.h8 ;
// 									//FindCluster.be.l8=RootDir[uwItmp0].dirFirstCluster.le.l8 ;
// 							*/
// 	else
// 		  return 0;
// 	
// }
// UCHAR SearchFile(char *Filename)
// {
//   UCHAR data res=0;
// 	
// 	
// 	
// 	res=SearchFileEntry(Filename,8, Type_SubDirFile ,LBA_Sector);//search DIRECTORY in DIR
// 	if(res==1)
// 			return 1;
// 							/*  return 1 ,when serach Find and set cluster in FindCluster.
// 	                //FindCluster.be.h8=RootDir[uwItmp0].dirFirstCluster.le.h8 ;
// 									//FindCluster.be.l8=RootDir[uwItmp0].dirFirstCluster.le.l8 ;
// 							*/
// 	else
// 		  return 0;
// 	
// }


//#include <string.h>

//char xdata PIC_UPDATE[10][32];

//char xdata FONT_UPDATE[10][32];

//char xdata UART_BANDRATE[4];

// unsigned int ConfigFileBmpPos;
// unsigned int ConfigFileFontPos;

// void OpenConfigFileTxt(char *FilePath,char *FileName)
// {
// 	extern unsigned int ConfigFileBmpPos;
//   extern unsigned int ConfigFileFontPos;	
// 	
// 	UCHAR data res=0;
// 	int kpos;
// 	int retunX;
// 	char check_str[3]="1_";
// 	res=CDIR("CONFIG  ");

// 	res=SearchFile("CONFIG  ");
// 	
// 			
// 	#ifdef SD1G	
// 							LBA_Sector=((FindCluster.UI) * BootSector.bpbSectorsPerCluster) +(2048+448);//1G CARD
// 	#else
// 							LBA_Sector=((FindCluster.UI) * BootSector.bpbSectorsPerCluster) +(512);//2G CARD
// 	#endif
// 	res=SD_ReadDisk(ConfigFileTxt,LBA_Sector,count);
// 	
// 	kpos=0;
// 	
// 	
// 			retunX=strstr(ConfigFileTxt,"UART_BANDRATE:");
//       retunX-=0xA800;
// 			retunX+=strlen("UART_BANDRATE:");
// 			UART_BANDRATE[0]=ConfigFileTxt[retunX];
// 			UART_BANDRATE[1]=ConfigFileTxt[retunX+1];
// 	
// 			retunX=strstr(ConfigFileTxt,"BMP:");
//       retunX-=0xA800;
// 			retunX+=strlen("BMP:");
// 			ConfigFileBmpPos=retunX;
// 			
// 			retunX=strstr(ConfigFileTxt,"FONTLIB:");
//       retunX-=0xA800;
// 			retunX+=strlen("FONTLIB:");
// 			ConfigFileFontPos=retunX;
// 			
// 	

// // 	//check BMP
// // 	for(y=0;y<10;y++)
// // 	{
// // 			check_str[0]=y+0x31;
// // 			
// // 			retunX=strstr(LBA_Buff,check_str);
// //       retunX-=0x8200;
// // 			
// // 			PIC_UPDATE[y][0]=y+'1';//'1'=0x31
// // 			PIC_UPDATE[y][1]=LBA_Buff[retunX+1];
// // 			PIC_UPDATE[y][2]=LBA_Buff[retunX+2];
// // 			PIC_UPDATE[y][3]=LBA_Buff[retunX+3];
// // 			PIC_UPDATE[y][4]=LBA_Buff[retunX+4];
// // 			PIC_UPDATE[y][5]=LBA_Buff[retunX+5];
// // 			PIC_UPDATE[y][6]=LBA_Buff[retunX+6];
// // 			PIC_UPDATE[y][7]=LBA_Buff[retunX+7];
// // 			PIC_UPDATE[y][8]="";					
// // 	}
// // 	//check FONT
// // 	
// // 						
// // 			retunX=strstr(LBA_Buff,"27_");
// //       retunX-=0x8200;
// // 			
// // 			FONT_UPDATE[y][0]='2';
// // 			FONT_UPDATE[y][1]='7';
// // 			FONT_UPDATE[y][2]='_';
// // 			FONT_UPDATE[y][3]=LBA_Buff[retunX+3];
// // 			FONT_UPDATE[y][4]=LBA_Buff[retunX+4];
// // 			FONT_UPDATE[y][5]=LBA_Buff[retunX+5];
// // 			FONT_UPDATE[y][6]=LBA_Buff[retunX+6];
// // 			FONT_UPDATE[y][7]=LBA_Buff[retunX+7];
// // 			FONT_UPDATE[y][8]="";					
// 		

// }

