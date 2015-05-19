

//#ifndef _GLOBAL_H_
//#define _GLOBAL_H_


//------------------------------------------------------
//                                                     |
//                      DEFINITION                     |
//                                                     |
//------------------------------------------------------
#define SBYTE           SINT8                           //Define data types for backward compatibility ...
#define UBYTE           UINT8                           //... to uC/OS V1.xx.  Not actually needed for ...
#define SWORD           SINT16
#define UWORD           UINT16
#define SLONG           SINT32
#define ULONG           UINT32
/*
#ifndef NULL
#define NULL            0
#endif
*/
#ifndef null
#define null            0
#endif
#ifndef TRUE
#define TRUE            1
#endif
#ifndef true
#define true            1
#endif
#ifndef FALSE
#define FALSE           0
#endif
#ifndef false
#define false           0
#endif


// ====================
// Identify Information
// ====================
//Word Address	Default Value	Total Bytes	Data Field Type Information
//=======================================================================
//0 				848Ah 			2 			General configuration - signature for the CompactFlash Storage Card
//					0XXX 			2 			General configuration �V Bit Significant with ATA-4 definitions.
//1 				XXXXh 			2 			Default number of cylinders
//2 				0000h 			2 			Reserved
//3 				00XXh 			2 			Default number of heads
//4 				0000h 			2 			Obsolete
//5 				0000h 			2 			Obsolete
//6 				XXXXh 			2 			Default number of sectors per track
//7-8 				XXXXh 			4 			Number of sectors per card (Word 7 = MSW, Word 8 = LSW)
//9 				XXXXh 			2 			Obsolete
//10-19 			aaaa 			20 			Serial number in ASCII (Right Justified)
//20 				0000h 			2 			Obsolete
//21 				0000h 			2 			Obsolete
//22 				0004h 			2 			Number of ECC bytes passed on Read/Write Long Commands
//23-26 			aaaa 			8 			Firmware revision in ASCII. Big Endian Byte Order in Word
//27-46 			aaaa 			40 			Model number in ASCII (Left Justified) Big Endian Byte Order in Word
//47 				XXXXh 			2 			Maximum number of sectors on Read/Write Multiple command
//48 				0000h 			2 			Reserved
//
//
//=====================
typedef struct {
	unsigned int signature;		//0 				848Ah 			2 			General configuration - signature for the CompactFlash Storage Card
	//unsigned int Significant;	//					0XXX 			2 			General configuration �V Bit Significant with ATA-4 definitions.
	WORD cylinders;				//1 				XXXXh 			2 			Default number of cylinders
	WORD Reserved1;				//2 				0000h 			2 			Reserved
	WORD heads;					//3 				00XXh 			2 			Default number of heads
	WORD Obsolete1;				//4 				0000h 			2 			Obsolete
	WORD Obsolete2;				//5 				0000h 			2 			Obsolete
	WORD SectorsPerTrack;		//6 				XXXXh 			2 			Default number of sectors per track
	DWORD SectorsPerCard;		//7-8 				XXXXh 			4 			Number of sectors per card (Word 7 = MSW, Word 8 = LSW)
	WORD Obsolete3;				//9 				XXXXh 			2 			Obsolete
	UBYTE SerialNumber[20]; 	//10-19 			aaaa 			20 			Serial number in ASCII (Right Justified)
	WORD Obsolete4;				//20 				0000h 			2 			Obsolete
	WORD Obsolete5;				//21 				0000h 			2 			Obsolete
	WORD ECC_bytes;				//22 				0004h 			2 			Number of ECC bytes passed on Read/Write Long Commands
	UBYTE FirmwareRevision[8];	//23-26 			aaaa 			8 			Firmware revision in ASCII. Big Endian Byte Order in Word
	UBYTE Model_number[40];		//27-46 			aaaa 			40 			Model number in ASCII (Left Justified) Big Endian Byte Order in Word
	WORD MultipleSectors;		//47 				XXXXh 			2 			Maximum number of sectors on Read/Write Multiple command
	WORD Reserved2;				//48 				0000h 			2 			Reserved  	
} IdentifyDeviceInformation;

//IdentifyDeviceInformation xdata HD_ident _at_ 0xFE0a;



#define DOS_FAT_12_bits                                 0x01// 
#define XENIX_root                                      0x02// 
#define XENIX_usr                                       0x03// 
#define DOS_FAT_16_bits_in_32M                          0x04// 
#define Extended                                        0x05// 
#define DOS_FAT_16_bits_over_32M                        0x06// 
#define HPFS_NTFS                                       0x07// 
#define AIX                                             0x08// 
#define AIX_bootable                                    0x09// 
#define OS2_Boot_Manager                                0x0A// 
#define DOS_FAT_32_bits				        			0x0B// 
#define DOS_FAT_Cylinder_over_1024						0x0C// 
#define DOS_FAT_System				        			0x0E// 
#define DOS_BigExtended				        			0x0F// 
#define SPF_Boot_manager                                0x20// 
#define Venix_80286                                     0x40// 
#define PPC_PReP_Boot                                   0x41// 
#define Novell                                          0x51// 
#define Microport                                       0x52// 
#define GNU_HURD                                        0x63// 
#define Novell_Netware                                  0x64// 
//#define Novell_Netware                                  0x65// 
#define PC_IX                                           0x75// 
#define Old_MINIX                                       0x80// 
#define Linux_MINIX                                     0x81// 
#define Linux_swap                                      0x82// 
#define Linux_native                                    0x83// 
#define Linux_extended                                  0x85// 
#define Amoeba                                          0x93// 
#define Amoeba_BBT                                      0x94// 
#define FreeBSD                                         0xA5// 
#define Open_BSD                                        0xA6// 
#define NETSTEP                                         0xA7// 
#define NetBSD                                          0xA9// 
#define BSDI_fs                                         0xB7// 
#define BSDI_swap                                       0xB8// 
#define Syrinx                                          0xC7// 
#define CP_M                                            0xDB// 
#define DOS_access                                      0xE1// 
#define DOS_R/O                                         0xE3// 
#define BeOS_fs                                         0xEB// 
#define DOS_secondary                                   0xF2// 
#define BBT                                             0xFF// 

 

//Partition Entry (Part of MBR)
typedef struct
{
	BYTE State; 							// 0 Current State of Partition (00h=Inactive, 80h=Active)
	BYTE BeginHead; 						// 1 Beginning of Partition - Head
//	WORD BeginCylinderSector; 				// 2-3 Beginning of Partition - Cylinder/Sector (See Below)
	BYTE BeginSector; 				// 2-3 Beginning of Partition - Cylinder/Sector (See Below)
	BYTE BeginCylinder; 				// 2-3 Beginning of Partition - Cylinder/Sector (See Below)
	BYTE Type; 								// 4 Type of Partition (See List Below)
	BYTE EndHead; 							// 5 End of Partition - Head
//	WORD EndCylinderSector; 				// 6-7 End of Partition - Cylinder/Sector
	BYTE EndSector; 				// 2-3 Beginning of Partition - Cylinder/Sector (See Below)
	BYTE EndCylinder; 				// 2-3 Beginning of Partition - Cylinder/Sector (See Below)

//	DWORD NumberSectorsOffset; 				// 8-11 Number of Sectors Between the MBR and the First Sector in the Partition
	UNION32 NumberSectorsOffset; 				// 8-11 Number of Sectors Between the MBR and the First Sector in the Partition
//	DWORD NumberSectors; 					// 12-15 Number of Sectors in the Partition
	UNION32 NumberSectors; 					// 12-15 Number of Sectors in the Partition
}MBREntry_t;

//Partition Type Listing
//There are more than just these shown, but I've only included that ones relevant to MS Operating Systems.
//==================================================
//Value Description
//00h Unknown or Nothing 
//01h 12-bit FAT 
//04h 16-bit FAT (Partition Smaller than 32MB) 
//05h Extended MS-DOS Partition 
//06h 16-bit FAT (Partition Larger than 32MB) 
//07h NTFS
//0Bh 32-bit FAT (Partition Up to 2048GB) 
//0Ch Same as 0BH, but uses LBA1 13h Extensions 
//0Eh Same as 06H, but uses LBA1 13h Extensions 
//0Fh Same as 05H, but uses LBA1 13h Extensions 


union uPartion
{
		BYTE PartitionEntryst[16];	// Partition Entry
		MBREntry_t MBREntry;
};

typedef struct
{
		BYTE ExecutableCode[446] ; 	// 0 Executable Code (Boots Computer)
		union uPartion Entry[4];
		WORD  Signature;
		/*
		union uPartion Entry1;
		union uPartion Entry2;
		union uPartion Entry3;
		union uPartion Entry4;
		*/
		//BYTE PartitionEntry1st[16];	//1st Partition Entry
	    //BYTE PartitionEntry2st[16];	//2st Partition Entry
	    //BYTE PartitionEntry3st[16];	//3st Partition Entry
	    //BYTE PartitionEntry4st[16];	//4st Partition Entry
	
}MasterBootRecord_t;




unsigned char xdata MBR_Type[44]=	{
								0x00,
								0x01,
								0x02,
								0x03,
								0x04,
								0x05,
								0x06,
								0x07,
								0x08,
								0x09,
								0x0A,
								0x0B,
								0x0C,
								0x0E,
								0x0F,
								0x20,
								0x40,
								0x41,
								0x51,
								0x52,
								0x63,
								0x64,
								0x65,
								0x75,
								0x80,
								0x81,
								0x82,
								0x83,
								0x85,
								0x93,
								0x94,
								0xA5,
								0xA6,
								0xA7,
								0xA9,
								0xB7,
								0xB8,
								0xC7,
								0xDB,
								0xE1,
								0xE3,
								0xEB,
								0xF2,
								0xFF
								};








 /*
----------------------------  <-- �첾�� 00H (0 Bytes)
|                          |
|                          |
| Boot Partition Loader    |
| �o�@�p�q�{���ΨӱN�i�Ұ� |
| ���@�~�t�Τ��ΰ����J     |
|                          |
|                          |
|                     -----|  <-- �첾�� 1BEh (446 Bytes)
|---------------------|    |
| Partition Table          |
| �w�Ф��Ϊ�          -----|
|                     |55AA|
----------------------------  <-- �첾�� 200H (512 Bytes)
1. �Ĥ@�Ӱϰ�O�{���ϡA�٬� Boot Partition Loader�A �]���H�٬� Pre-Loader �� Pre-Boot�C�o�@�q�p�{���ΨӱN�i�Ұʪ��@�~�t�Τ��ΰ����J (���ӻ����J�i�Ұʧ@�~�t�Τ��ΰϪ��Ұʺϰ� Boot Sector)�A�ñN�����v�浹�ҰʺϰϡC��d��q 000h �� 1BDh�A�@ 446 Bytes�C
�]���o�q�{���ϬO���F BIOS ���~�̥��Q�q�����J���檺�ϰ� (���Ҽ{�n��)�A�ҥH���O�h���}���޲z�{���B�}�����f�r�B�n�馡�w�бK�X�굥�{���A�j�h���O�Q�γo�Ӱ�Ϧb�u�@�C

2. �ĤG�Ӱϰ�O��ưϡA�Y�w�Ф��Ϊ�Ҧb�ϰ�C��d��q 1BEh �� 1FDh�A�@ 64 Bytes�C
�o 64 Bytes �S�������|�Ӱϰ�A�N�� 4 �ӵw�Ф��Ϊ�A��d����O��

�첾�� 01BE ~ 01CD  <-- �Ĥ@���Ϊ�
�첾�� 01CE ~ 01DD  <-- �ĤG���Ϊ�
�첾�� 01DE ~ 01ED  <-- �ĤT���Ϊ�
�첾�� 01EE ~ 01FD  <-- �ĥ|���Ϊ�

----------------------------------------------------------------------------
|�첾��|�j�p | ����                                                        |
+------+-------------------------------------------------------------------+
|  00  |Byte | BOOT ID - �Y���i�}�������ΰϫh�� 80h ~ FFh, �_�h�� 00h�C    |
|      |     | 80h = C, 81h = D, 82h = E ... �H������                      |
|      |     | �H fdisk �ӻ�,�Y�Ĥ@���w�Ъ����ΰϳ]�� Active �h ID = 80h�C |
|      |     | 4 �Ӥ��Ϊ�, �u�঳�@�ӳQ�]���i�}��, �_�h�N�|�o�Ϳ��~�C    |
+------+-----+-------------------------------------------------------------+
|  01h |Byte | �����ζ}�l�����Y�s��                                        |
+------+-----+-------------------------------------------------------------+
|  02h |Byte | �����ζ}�l���ϰϽs�� (6 bits)                               |
|      |     | �̰��� 2 �� bits(bit6-7), ���ϬW�s���� bit8-9 	           |
+------+-----+-------------------------------------------------------------+
|  03h |Byte | �����ζ}�l���ϬW�s�� (10 bits)                              |
|      |     | bit8-9 ��b�첾�� 02h �� bit 6-7                            |
+------+-----+-------------------------------------------------------------+
|  04h |Byte | �@�~�t���ѧO�X                                              |
|      |     |   00 None                                                   |
|      |     |   01 DOS FAT-12 bits                                        |
|      |     |   02 XENIX root                                             |
|      |     |   03 XENIX usr                                              |
|      |     |   04 DOS FAT-16 bits < 32M                                  |
|      |     |   05 Extended                                               |
|      |     |   06 DOS FAT-16 bits > 32M                                  |
|      |     |   07 HPFS/NTFS                                              |
|      |     |   08 AIX                                                    |
|      |     |   09 AIX bootable                                           |
|      |     |   0A OS/2 Boot Manager                                      |
|      |     |   0B DOS FAT-32 bits (Int 13h extensions)                    |
|      |     |   0C DOS FAT Cylinder > 1024 (Int 13h extensions)            |
|      |     |   0E DOS FAT System (Int 13h extensions)                     |
|      |     |   0F DOS BigExtended (Int 13h extensions)                    |
|      |     |   20 SPF Boot manager                                       |
|      |     |   40 Venix 80286                                            |
|      |     |   41 PPC PReP Boot                                          |
|      |     |   51 Novell                                                 |
|      |     |   52 Microport                                              |
|      |     |   63 GNU HURD                                               |
|      |     |   64 Novell Netware                                         |
|      |     |   65 Novell Netware                                         |
|      |     |   75 PC/IX                                                  |
|      |     |   80 Old MINIX                                              |
|      |     |   81 Linux/MINIX                                            |
|      |     |   82 Linux swap                                             |
|      |     |   83 Linux native                                           |
|      |     |   85 Linux extended                                         |
|      |     |   93 Amoeba                                                 |
|      |     |   94 Amoeba BBT                                             |
|      |     |   A5 FreeBSD                                                |
|      |     |   A6 Open BSD                                               |
|      |     |   A7 NETSTEP                                                |
|      |     |   A9 NetBSD                                                 |
|      |     |   B7 BSDI fs                                                |
|      |     |   B8 BSDI swap                                              |
|      |     |   C7 Syrinx                                                 |
|      |     |   DB CP/M                                                   |
|      |     |   E1 DOS access                                             |
|      |     |   E3 DOS R/O                                                |
|      |     |   EB BeOS fs                                                |
|      |     |   F2 DOS secondary                                          |
|      |     |   FF BBT                                                    |
+------+-----+-------------------------------------------------------------+
|  05h |Byte | �����ε��������Y�s��                                        |
+------+-----+-------------------------------------------------------------+
|  06h |Byte | �����ε������ϰϽs�� (6 bits)                               |
|      |     | �̰��� 2 �� bits(bit6-7), ���ϬW�s���� bit8-9 	           |
+------+-----+-------------------------------------------------------------+
|  07h |Byte | �����ε������ϬW�s�� (10 bits)                              |
|      |     | bit8-9 ��b�첾�� 06h �� bit 6-7                            |
+------+-----+-------------------------------------------------------------+
|  08h |DWord| �����ΰϫe���ϰ��`��                                        |
+------+-----+-------------------------------------------------------------+
|  12h |DWord| �����Τ��ϰ��`��                                            |
+------+-----+-------------------------------------------------------------+


 */



//����W�runicode + �ͤ� ASCII
// 12 byte        +    4 byte


//�d�v�N 640129	//5433 6CBB 6770   
//�i�x�� 621211 //5F35 8A8C 9E9F 
//�i�ӹF 611009 //5F35 654F 9054 
//�G�O�L 610312	//912D 4FDD 590F 

unsigned char xdata UnicodeKey[5][16]={
			{'5','4','3','3','6','C','B','B','6','7','7','0','0','1','2','9'},
			{'5','F','3','5','8','A','8','C','9','E','9','F','1','2','1','1'},
			{'5','F','3','5','6','5','4','F','9','0','5','4','1','0','0','9'},
			{'9','1','2','D','4','F','D','D','5','9','0','F','0','3','1','2'},
			{0x8f,0x0f,0x66,0xc4,0x4f,0x17,0xf0,0x7a,0x3c,0x26,0x1e,0x26,0x51,0xe2,0x32,0x99}

		};
 

	#define READ 		1
	#define WRITE 		0

	
	#define ENCRYPT 	0
	#define NONENCRYPT 	1
	#define MBR_EMPT    2


#define DOS_FAT12     0x01
#define DOS_FAT16     0x04
#define DOS_EXTENDED  0x05
#define DOS_FAT16_BIG 0x06     // 16-bit FAT >= 32M
#define DOS_FAT32     0x0B

#define BOOT_SECTOR_SIGNATURE  0x55AA


//
// BPB ( BIOS Parameter Block )
//
typedef struct _BPB {

    ULINT  bpbBytesPerSector;          //
    UCHAR  bpbSectorsPerCluster;       //
    ULINT  bpbReservedSectors;         //
    UCHAR  bpbNumberOfFATs;            //
    ULINT  bpbRootEntries;             //
    ULINT  bpbTotalSectors;            //
    UCHAR  bpbMedia;                   //
    ULINT  bpbSectorsPerFAT;           //
    ULINT  bpbSectorsPerTrack;         //
    ULINT  bpbHeadsPerCylinder;        //
    ULLONG bpbHiddenSectors;           //
    ULLONG bpb32TotalSectors;          //

} BPB;

typedef struct _BPB32 {

    ULINT  bpbBytesPerSector;
    UCHAR  bpbSectorsPerCluster;
    ULINT  bpbReservedSectors;
    UCHAR  bpbNumberOfFATs;
    ULINT  bpbRootEntries;
    ULINT  bpbTotalSectors;
    UCHAR  bpbMedia;
    ULINT  bpbSectorsPerFAT;
    ULINT  bpbSectorsPerTrack;
    ULINT  bpbHeadsPerCylinder;
    ULLONG bpbHiddenSectors;
    ULLONG bpb32TotalSectors;
    ULLONG bpb32SectorsPerFAT;

//  ULINT  bpb32ExtFlags;
//  ULINT  bpb32FSVer;
//  ULLONG bpb32RootCluster;
//  ULINT  bpb32InfoSector;
//  ULINT  bpb32BootBackupStart;
//  UCHAR  bpb32Reserved[12];

} BPB32;

typedef struct _BPB32_EXT {

    UCHAR  bpbExtFlagsL;
    UCHAR  bpbExtFlagsH;
    ULINT  bpb32FSVer;                 // 02Ah
    ULLONG bpb32RootCluster;           // 02Ch
    ULINT  bpb32InfoSector;            // 030h
    ULINT  bpb32BootBackupStart;       // 032h

} BPB32_EXT;

//
// Partition Boot Sector
//
typedef struct _PBS {

    UCHAR  pbsJumpCommand[3];          // 000h
    UCHAR  pbsManufacturerName[8];     // 003h

    ULINT  bpbBytesPerSector;          // 00Bh
    UCHAR  bpbSectorsPerCluster;       // 00Dh
    ULINT  bpbReservedSectors;         // 00Eh
    UCHAR  bpbNumberOfFATs;            // 010h
    ULINT  bpbRootEntries;             // 011h FAT12/FAT16, FAT32 is 0
    ULINT  bpbTotalSectors;            // 013h
    UCHAR  bpbMedia;                   // 015h
    ULINT  bpbSectorsPerFAT;           // 016h FAT12/FAT16, FAT32 is 0
    ULINT  bpbSectorsPerTrack;         // 018h
    ULINT  bpbHeadsPerCylinder;        // 01Ah
    ULLONG bpbHiddenSectors;           // 01Ch
    ULLONG bpb32TotalSectors;          // 020h
    ULLONG bpb32SectorsPerFAT;         // 024h ---

    ULINT  bpb32ExtFlags;              // 028h
    ULINT  bpb32FSVer;                 // 02Ah
    ULLONG bpb32RootCluster;           // 02Ch
    ULINT  bpb32InfoSector;            // 030h
    ULINT  bpb32BootBackupStart;       // 032h
    UCHAR  bpb32Reserved[12];          // 034h

    UCHAR  pbsReserved[0x1BE];         // 040h

    UINT   pbsSignature;               // 1FEh = 0x55AA

} PBS;


//
// File/Directory Entry
//
// Value of
// FirstByte   Meaning
// --------------------------------------------------------------------------
//  00h        Entry has never been used; no further entries follow this one.
//
//  05h        First character of the file name is actually E5h
//
//  2Eh        Entry is an alias for the current directory. If the next byte
//             is 2Eh, the directory entry's disFirstCluster contains the
//             cluster number of the parent of the current directory.
//
//  E5h        File erased
//
typedef struct _DIR {

    UCHAR  dirFilename[8];             // Value of First byte : see below
    UCHAR  dirExtension[3];
    UCHAR  dirAttributes;              // Bit 0: Read-only
                                       //     1: Hidden file
                                       //     2: System file
                                       //     3: Volume label
                                       //     4: Subdirectory
                                       //     5: Archive bit
    UCHAR  dirReserved;
    UCHAR  dirCreateTime[3];
    UCHAR  dirCreateDate[2];
    UCHAR  dirAccessDate[2];
    ULINT  dirFirstClusterH;           // Little-Endian
    UCHAR  dirUpdateTime[2];
    UCHAR  dirUpdateDate[2];
    ULINT  dirFirstCluster;            // Little-Endian
    ULLONG dirFileSize;                // Little-Endian

}DIR;




//
// Long Directory Entry Structure
//
//     Long entries always immediately precede and are physically contiguious
//     with, the short entry they are associated with.
//
typedef struct _LONG_DIR {

    UCHAR  ldirOrder;          // The order of this entry in the sequence of
                               //     long dir entries.
    UCHAR  ldirName1[10];      // Characters 1-5 of the long-name
                               //     sub-component in this dir entry.
    UCHAR  ldirAttributes;     // Must be ATTR_LONG_NAME (0Fh)
    UCHAR  ldirType;           // If 0, sub-component of a long name.
    UCHAR  ldirChecksum;       // Checksum of name in the short dir entry at
                               //     the end of the long dir entry
    UCHAR  ldirName2[12];      // Characters 6-11 of the long-name
                               //     sub-component in this dir entry
    ULINT  ldirFirstClusterL;  // Must be ZERO.
    UCHAR  ldirName3[4];       // Characters 12-13 of the long-name
                               //     sub-component in this dir entry
} LONG_DIR;

#define ATTR_READ_ONLY         0x01
#define ATTR_HIDDEN            0x02
#define ATTR_SYSTEM_FILE       0x04
#define ATTR_VOLUME_LABEL      0x08
#define ATTR_SUBDIRECTORY      0x10
#define ATTR_ARCHIVE           0x20
#define ATTR_LONG_NAME         (ATTR_READ_ONLY | ATTR_HIDDEN | ATTR_SYSTEM_FILE | ATTR_VOLUME_LABEL)
#define ATTR_LONG_NAME_MASK    0x3F

#define LAST_LONG_ENTRY        0x40

#define LONG_NAME1_LENGTH      10
#define LONG_NAME2_LENGTH      12
#define LONG_NAME3_LENGTH      4

//
// Filename Data Structure
//
typedef struct _FILE_NAME {

    UCHAR fnMaster[8];         // Master of 8.3 Filename
    UCHAR fnExtension[3];      // Extension of 8.3 Filename
    UCHAR fnCharacterSet;      // 1: ISO 8859 Character Set
    UCHAR fnReserved[2];       //
    UCHAR fnLFNBytes;          // Actual Long filename bytes are copied ????
    UCHAR fnLFBLength;         // Length of Long Filename Buffer
    UCHAR fnLongFilename;      // Long Filename Buffer

} FILE_NAME;


//-----------------------------------------------------------------------------
//
// FAT Constants
//
#define FAT12_FREE_ENTRY       0x0000
#define FAT16_FREE_ENTRY       0x0000
#define FAT32_FREE_ENTRY       0x00000000
#define FAT32_CLUSTER_MASK     0xFFFFFF0F        // little-endian


// End Of Clusterchain
//
#define FAT12_EOC              0x0FFF
#define FAT16_EOC              0xFFFF
#define FAT32_EOC              0x0FFFFFFF

// BAD CLUSTER
//
#define FAT12_BAD_CLUSTER      0x0FF7
#define FAT16_BAD_CLUSTER      0xFFF7
#define FAT32_BAD_CLUSTER      0x0FFFFFF7


//
// Return Codes of FsRecorder
//
#define FS_RECORDER_ERROR      0x00
#define FS_RECORDER_SUCCESS    0x01
#define FS_RECORDER_FULL       0xFF





