module demo_sd_to_lcd_ipc_adder_8(CA, CI, CO, DX, SUM);
  input [7:0] CA;
  input CI;
  output CO;
  input [7:0] DX;
  output [7:0] SUM;

    wire \MUXCO_0|COUT_net ;
    wire \MUXCO_1|COUT_net ;
    wire \MUXCO_2|COUT_net ;
    wire \MUXCO_3|COUT_net ;
    wire \MUXCO_4|COUT_net ;
    wire \MUXCO_5|COUT_net ;
    wire \MUXCO_6|COUT_net ;

    CS_MUXCO_PRIM MUXCO_0 ( .AIN(CA[0]), .CIN(CI), .COUT(\MUXCO_0|COUT_net ), 
        .CSEL(DX[0]) );
    CS_MUXCO_PRIM MUXCO_1 ( .AIN(CA[1]), .CIN(\MUXCO_0|COUT_net ), .COUT(
        \MUXCO_1|COUT_net ), .CSEL(DX[1]) );
    CS_MUXCO_PRIM MUXCO_2 ( .AIN(CA[2]), .CIN(\MUXCO_1|COUT_net ), .COUT(
        \MUXCO_2|COUT_net ), .CSEL(DX[2]) );
    CS_MUXCO_PRIM MUXCO_3 ( .AIN(CA[3]), .CIN(\MUXCO_2|COUT_net ), .COUT(
        \MUXCO_3|COUT_net ), .CSEL(DX[3]) );
    CS_MUXCO_PRIM MUXCO_4 ( .AIN(CA[4]), .CIN(\MUXCO_3|COUT_net ), .COUT(
        \MUXCO_4|COUT_net ), .CSEL(DX[4]) );
    CS_MUXCO_PRIM MUXCO_5 ( .AIN(CA[5]), .CIN(\MUXCO_4|COUT_net ), .COUT(
        \MUXCO_5|COUT_net ), .CSEL(DX[5]) );
    CS_MUXCO_PRIM MUXCO_6 ( .AIN(CA[6]), .CIN(\MUXCO_5|COUT_net ), .COUT(
        \MUXCO_6|COUT_net ), .CSEL(DX[6]) );
    CS_MUXCO_PRIM MUXCO_7 ( .AIN(CA[7]), .CIN(\MUXCO_6|COUT_net ), .COUT(CO), 
        .CSEL(DX[7]) );
    CS_XORCI_PRIM XORCI_0 ( .CIN(CI), .DIN(DX[0]), .SUM(SUM[0]) );
    CS_XORCI_PRIM XORCI_1 ( .CIN(\MUXCO_0|COUT_net ), .DIN(DX[1]), .SUM(SUM[1]) );
    CS_XORCI_PRIM XORCI_2 ( .CIN(\MUXCO_1|COUT_net ), .DIN(DX[2]), .SUM(SUM[2]) );
    CS_XORCI_PRIM XORCI_3 ( .CIN(\MUXCO_2|COUT_net ), .DIN(DX[3]), .SUM(SUM[3]) );
    CS_XORCI_PRIM XORCI_4 ( .CIN(\MUXCO_3|COUT_net ), .DIN(DX[4]), .SUM(SUM[4]) );
    CS_XORCI_PRIM XORCI_5 ( .CIN(\MUXCO_4|COUT_net ), .DIN(DX[5]), .SUM(SUM[5]) );
    CS_XORCI_PRIM XORCI_6 ( .CIN(\MUXCO_5|COUT_net ), .DIN(DX[6]), .SUM(SUM[6]) );
    CS_XORCI_PRIM XORCI_7 ( .CIN(\MUXCO_6|COUT_net ), .DIN(DX[7]), .SUM(SUM[7]) );
endmodule


module demo_sd_to_lcd ( PAD0_u_lvds_u_lvds_tx_0, PAD0_u_lvds_u_lvds_tx_1,
           PAD0_u_lvds_u_lvds_tx_2, PAD0_u_lvds_u_lvds_tx_3, PAD0_u_lvds_u_lvds_tx_clk,
           PAD1_u_lvds_u_lvds_tx_0, PAD1_u_lvds_u_lvds_tx_1, PAD1_u_lvds_u_lvds_tx_2,
           PAD1_u_lvds_u_lvds_tx_3, PAD1_u_lvds_u_lvds_tx_clk, \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ,
           \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 , \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 ,
           \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 , \aa[0]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 ,
           \aa[0]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 , \aa[0]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 ,
           \aa[0]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 , \aa[10]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ,
           \aa[10]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 , \aa[10]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 ,
           \aa[10]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 , \aa[10]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 ,
           \aa[10]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 , \aa[10]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 ,
           \aa[10]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 , \aa[11]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ,
           \aa[11]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 , \aa[11]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 ,
           \aa[11]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 , \aa[11]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 ,
           \aa[11]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 , \aa[11]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 ,
           \aa[11]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 , \aa[1]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ,
           \aa[1]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 , \aa[1]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 ,
           \aa[1]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 , \aa[1]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 ,
           \aa[1]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 , \aa[1]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 ,
           \aa[1]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 , \aa[2]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ,
           \aa[2]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 , \aa[2]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 ,
           \aa[2]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 , \aa[2]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 ,
           \aa[2]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 , \aa[2]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 ,
           \aa[2]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 , \aa[3]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ,
           \aa[3]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 , \aa[3]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 ,
           \aa[3]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 , \aa[3]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 ,
           \aa[3]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 , \aa[3]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 ,
           \aa[3]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 , \aa[4]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ,
           \aa[4]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 , \aa[4]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 ,
           \aa[4]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 , \aa[4]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 ,
           \aa[4]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 , \aa[4]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 ,
           \aa[4]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 , \aa[5]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ,
           \aa[5]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 , \aa[5]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 ,
           \aa[5]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 , \aa[5]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 ,
           \aa[5]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 , \aa[5]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 ,
           \aa[5]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 , \aa[6]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ,
           \aa[6]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 , \aa[6]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 ,
           \aa[6]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 , \aa[6]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 ,
           \aa[6]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 , \aa[6]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 ,
           \aa[6]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 , \aa[7]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ,
           \aa[7]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 , \aa[7]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 ,
           \aa[7]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 , \aa[7]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 ,
           \aa[7]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 , \aa[7]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 ,
           \aa[7]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 , \aa[8]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ,
           \aa[8]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 , \aa[8]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 ,
           \aa[8]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 , \aa[8]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 ,
           \aa[8]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 , \aa[8]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 ,
           \aa[8]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 , \aa[9]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ,
           \aa[9]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 , \aa[9]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 ,
           \aa[9]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 , \aa[9]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 ,
           \aa[9]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 , \aa[9]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 ,
           \aa[9]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 , \ab[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ,
           \ab[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 , \ab[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 ,
           \ab[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 , \ab[0]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 ,
           \ab[0]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 , \ab[0]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 ,
           \ab[0]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 , \ab[10]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ,
           \ab[10]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 , \ab[10]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 ,
           \ab[10]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 , \ab[10]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 ,
           \ab[10]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 , \ab[10]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 ,
           \ab[10]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 , \ab[11]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ,
           \ab[11]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 , \ab[11]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 ,
           \ab[11]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 , \ab[11]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 ,
           \ab[11]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 , \ab[11]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 ,
           \ab[11]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 , \ab[1]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ,
           \ab[1]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 , \ab[1]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 ,
           \ab[1]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 , \ab[1]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 ,
           \ab[1]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 , \ab[1]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 ,
           \ab[1]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 , \ab[2]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ,
           \ab[2]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 , \ab[2]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 ,
           \ab[2]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 , \ab[2]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 ,
           \ab[2]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 , \ab[2]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 ,
           \ab[2]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 , \ab[3]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ,
           \ab[3]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 , \ab[3]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 ,
           \ab[3]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 , \ab[3]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 ,
           \ab[3]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 , \ab[3]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 ,
           \ab[3]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 , \ab[4]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ,
           \ab[4]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 , \ab[4]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 ,
           \ab[4]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 , \ab[4]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 ,
           \ab[4]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 , \ab[4]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 ,
           \ab[4]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 , \ab[5]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ,
           \ab[5]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 , \ab[5]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 ,
           \ab[5]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 , \ab[5]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 ,
           \ab[5]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 , \ab[5]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 ,
           \ab[5]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 , \ab[6]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ,
           \ab[6]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 , \ab[6]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 ,
           \ab[6]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 , \ab[6]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 ,
           \ab[6]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 , \ab[6]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 ,
           \ab[6]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 , \ab[7]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ,
           \ab[7]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 , \ab[7]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 ,
           \ab[7]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 , \ab[7]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 ,
           \ab[7]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 , \ab[7]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 ,
           \ab[7]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 , \ab[8]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ,
           \ab[8]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 , \ab[8]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 ,
           \ab[8]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 , \ab[8]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 ,
           \ab[8]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 , \ab[8]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 ,
           \ab[8]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 , \ab[9]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ,
           \ab[9]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 , \ab[9]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 ,
           \ab[9]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 , \ab[9]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 ,
           \ab[9]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 , \ab[9]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 ,
           \ab[9]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 , align_rstn_u_lvds_u_lvds_tx_0,
           align_rstn_u_lvds_u_lvds_tx_1, align_rstn_u_lvds_u_lvds_tx_2, align_rstn_u_lvds_u_lvds_tx_3,
           align_rstn_u_lvds_u_lvds_tx_clk, alignwd_u_lvds_u_lvds_tx_clk,
           buttonIn2, buttonIn3, buttonIn4, c2r1_dll_clk_u_arm_u_soc, cea_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0,
           cea_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1, cea_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2,
           cea_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3, cea_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0,
           cea_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1, cea_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2,
           cea_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3, ceb_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0,
           ceb_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1, ceb_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2,
           ceb_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3, ceb_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0,
           ceb_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1, ceb_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2,
           ceb_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3, clk_0_u_lvds_u_lvds_tx_0,
           clk_0_u_lvds_u_lvds_tx_1, clk_0_u_lvds_u_lvds_tx_2, clk_0_u_lvds_u_lvds_tx_3,
           clk_0_u_lvds_u_lvds_tx_clk, clk_1_u_lvds_u_lvds_tx_0, clk_1_u_lvds_u_lvds_tx_1,
           clk_1_u_lvds_u_lvds_tx_2, clk_1_u_lvds_u_lvds_tx_3, clk_1_u_lvds_u_lvds_tx_clk,
           clk_ahb_fp0_u_arm_u_soc, clk_i, clk_out_n, clk_out_p, clka_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0,
           clka_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1, clka_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2,
           clka_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3, clka_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0,
           clka_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1, clka_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2,
           clka_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3, clkb_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0,
           clkb_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1, clkb_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2,
           clkb_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3, clkb_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0,
           clkb_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1, clkb_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2,
           clkb_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3, clkin0_u_lvds_pll_u0,
           clkin0_u_pll_pll_u0, clkin_u_arm_dll_u0, clkout0_u_arm_dll_u0,
           clkout0_u_lvds_pll_u0, clkout0_u_pll_pll_u0, clkout1_u_lvds_pll_u0,
           clkout1_u_pll_pll_u0, \db[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ,
           \db[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 , \db[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 ,
           \db[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 , \db[0]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 ,
           \db[0]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 , \db[0]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 ,
           \db[0]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 , \db[10]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ,
           \db[10]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 , \db[10]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 ,
           \db[10]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 , \db[10]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 ,
           \db[10]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 , \db[10]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 ,
           \db[10]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 , \db[11]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ,
           \db[11]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 , \db[11]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 ,
           \db[11]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 , \db[11]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 ,
           \db[11]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 , \db[11]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 ,
           \db[11]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 , \db[12]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ,
           \db[12]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 , \db[12]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 ,
           \db[12]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 , \db[12]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 ,
           \db[12]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 , \db[12]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 ,
           \db[12]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 , \db[13]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ,
           \db[13]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 , \db[13]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 ,
           \db[13]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 , \db[13]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 ,
           \db[13]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 , \db[13]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 ,
           \db[13]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 , \db[14]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ,
           \db[14]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 , \db[14]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 ,
           \db[14]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 , \db[14]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 ,
           \db[14]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 , \db[14]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 ,
           \db[14]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 , \db[15]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ,
           \db[15]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 , \db[15]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 ,
           \db[15]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 , \db[15]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 ,
           \db[15]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 , \db[15]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 ,
           \db[15]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 , \db[16]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ,
           \db[16]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 , \db[16]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 ,
           \db[16]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 , \db[16]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 ,
           \db[16]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 , \db[16]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 ,
           \db[16]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 , \db[17]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ,
           \db[17]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 , \db[17]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 ,
           \db[17]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 , \db[17]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 ,
           \db[17]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 , \db[17]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 ,
           \db[17]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 , \db[1]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ,
           \db[1]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 , \db[1]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 ,
           \db[1]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 , \db[1]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 ,
           \db[1]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 , \db[1]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 ,
           \db[1]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 , \db[2]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ,
           \db[2]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 , \db[2]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 ,
           \db[2]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 , \db[2]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 ,
           \db[2]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 , \db[2]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 ,
           \db[2]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 , \db[3]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ,
           \db[3]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 , \db[3]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 ,
           \db[3]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 , \db[3]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 ,
           \db[3]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 , \db[3]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 ,
           \db[3]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 , \db[4]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ,
           \db[4]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 , \db[4]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 ,
           \db[4]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 , \db[4]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 ,
           \db[4]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 , \db[4]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 ,
           \db[4]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 , \db[5]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ,
           \db[5]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 , \db[5]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 ,
           \db[5]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 , \db[5]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 ,
           \db[5]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 , \db[5]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 ,
           \db[5]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 , \db[6]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ,
           \db[6]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 , \db[6]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 ,
           \db[6]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 , \db[6]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 ,
           \db[6]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 , \db[6]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 ,
           \db[6]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 , \db[7]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ,
           \db[7]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 , \db[7]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 ,
           \db[7]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 , \db[7]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 ,
           \db[7]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 , \db[7]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 ,
           \db[7]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 , \db[8]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ,
           \db[8]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 , \db[8]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 ,
           \db[8]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 , \db[8]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 ,
           \db[8]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 , \db[8]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 ,
           \db[8]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 , \db[9]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ,
           \db[9]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 , \db[9]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 ,
           \db[9]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 , \db[9]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 ,
           \db[9]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 , \db[9]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 ,
           \db[9]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 , display_sel, \fp0_m_ahb_addr[0]_u_arm_u_soc ,
           \fp0_m_ahb_addr[10]_u_arm_u_soc , \fp0_m_ahb_addr[11]_u_arm_u_soc ,
           \fp0_m_ahb_addr[12]_u_arm_u_soc , \fp0_m_ahb_addr[13]_u_arm_u_soc ,
           \fp0_m_ahb_addr[14]_u_arm_u_soc , \fp0_m_ahb_addr[15]_u_arm_u_soc ,
           \fp0_m_ahb_addr[16]_u_arm_u_soc , \fp0_m_ahb_addr[17]_u_arm_u_soc ,
           \fp0_m_ahb_addr[18]_u_arm_u_soc , \fp0_m_ahb_addr[19]_u_arm_u_soc ,
           \fp0_m_ahb_addr[1]_u_arm_u_soc , \fp0_m_ahb_addr[20]_u_arm_u_soc ,
           \fp0_m_ahb_addr[21]_u_arm_u_soc , \fp0_m_ahb_addr[22]_u_arm_u_soc ,
           \fp0_m_ahb_addr[23]_u_arm_u_soc , \fp0_m_ahb_addr[24]_u_arm_u_soc ,
           \fp0_m_ahb_addr[25]_u_arm_u_soc , \fp0_m_ahb_addr[26]_u_arm_u_soc ,
           \fp0_m_ahb_addr[27]_u_arm_u_soc , \fp0_m_ahb_addr[28]_u_arm_u_soc ,
           \fp0_m_ahb_addr[29]_u_arm_u_soc , \fp0_m_ahb_addr[2]_u_arm_u_soc ,
           \fp0_m_ahb_addr[30]_u_arm_u_soc , \fp0_m_ahb_addr[31]_u_arm_u_soc ,
           \fp0_m_ahb_addr[3]_u_arm_u_soc , \fp0_m_ahb_addr[4]_u_arm_u_soc ,
           \fp0_m_ahb_addr[5]_u_arm_u_soc , \fp0_m_ahb_addr[6]_u_arm_u_soc ,
           \fp0_m_ahb_addr[7]_u_arm_u_soc , \fp0_m_ahb_addr[8]_u_arm_u_soc ,
           \fp0_m_ahb_addr[9]_u_arm_u_soc , \fp0_m_ahb_burst[0]_u_arm_u_soc ,
           \fp0_m_ahb_burst[1]_u_arm_u_soc , \fp0_m_ahb_burst[2]_u_arm_u_soc ,
           fp0_m_ahb_mastlock_u_arm_u_soc, \fp0_m_ahb_prot[0]_u_arm_u_soc ,
           \fp0_m_ahb_prot[1]_u_arm_u_soc , \fp0_m_ahb_prot[2]_u_arm_u_soc ,
           \fp0_m_ahb_prot[3]_u_arm_u_soc , \fp0_m_ahb_rdata[0]_u_arm_u_soc ,
           \fp0_m_ahb_rdata[10]_u_arm_u_soc , \fp0_m_ahb_rdata[11]_u_arm_u_soc ,
           \fp0_m_ahb_rdata[12]_u_arm_u_soc , \fp0_m_ahb_rdata[13]_u_arm_u_soc ,
           \fp0_m_ahb_rdata[14]_u_arm_u_soc , \fp0_m_ahb_rdata[15]_u_arm_u_soc ,
           \fp0_m_ahb_rdata[16]_u_arm_u_soc , \fp0_m_ahb_rdata[17]_u_arm_u_soc ,
           \fp0_m_ahb_rdata[18]_u_arm_u_soc , \fp0_m_ahb_rdata[19]_u_arm_u_soc ,
           \fp0_m_ahb_rdata[1]_u_arm_u_soc , \fp0_m_ahb_rdata[20]_u_arm_u_soc ,
           \fp0_m_ahb_rdata[21]_u_arm_u_soc , \fp0_m_ahb_rdata[22]_u_arm_u_soc ,
           \fp0_m_ahb_rdata[23]_u_arm_u_soc , \fp0_m_ahb_rdata[24]_u_arm_u_soc ,
           \fp0_m_ahb_rdata[25]_u_arm_u_soc , \fp0_m_ahb_rdata[26]_u_arm_u_soc ,
           \fp0_m_ahb_rdata[27]_u_arm_u_soc , \fp0_m_ahb_rdata[28]_u_arm_u_soc ,
           \fp0_m_ahb_rdata[29]_u_arm_u_soc , \fp0_m_ahb_rdata[2]_u_arm_u_soc ,
           \fp0_m_ahb_rdata[30]_u_arm_u_soc , \fp0_m_ahb_rdata[31]_u_arm_u_soc ,
           \fp0_m_ahb_rdata[3]_u_arm_u_soc , \fp0_m_ahb_rdata[4]_u_arm_u_soc ,
           \fp0_m_ahb_rdata[5]_u_arm_u_soc , \fp0_m_ahb_rdata[6]_u_arm_u_soc ,
           \fp0_m_ahb_rdata[7]_u_arm_u_soc , \fp0_m_ahb_rdata[8]_u_arm_u_soc ,
           \fp0_m_ahb_rdata[9]_u_arm_u_soc , fp0_m_ahb_ready_u_arm_u_soc,
           fp0_m_ahb_resp_u_arm_u_soc, \fp0_m_ahb_size[0]_u_arm_u_soc , \fp0_m_ahb_size[1]_u_arm_u_soc ,
           \fp0_m_ahb_size[2]_u_arm_u_soc , \fp0_m_ahb_trans[0]_u_arm_u_soc ,
           \fp0_m_ahb_trans[1]_u_arm_u_soc , \fp0_m_ahb_wdata[0]_u_arm_u_soc ,
           \fp0_m_ahb_wdata[10]_u_arm_u_soc , \fp0_m_ahb_wdata[11]_u_arm_u_soc ,
           \fp0_m_ahb_wdata[12]_u_arm_u_soc , \fp0_m_ahb_wdata[13]_u_arm_u_soc ,
           \fp0_m_ahb_wdata[14]_u_arm_u_soc , \fp0_m_ahb_wdata[15]_u_arm_u_soc ,
           \fp0_m_ahb_wdata[16]_u_arm_u_soc , \fp0_m_ahb_wdata[17]_u_arm_u_soc ,
           \fp0_m_ahb_wdata[18]_u_arm_u_soc , \fp0_m_ahb_wdata[19]_u_arm_u_soc ,
           \fp0_m_ahb_wdata[1]_u_arm_u_soc , \fp0_m_ahb_wdata[20]_u_arm_u_soc ,
           \fp0_m_ahb_wdata[21]_u_arm_u_soc , \fp0_m_ahb_wdata[22]_u_arm_u_soc ,
           \fp0_m_ahb_wdata[23]_u_arm_u_soc , \fp0_m_ahb_wdata[24]_u_arm_u_soc ,
           \fp0_m_ahb_wdata[25]_u_arm_u_soc , \fp0_m_ahb_wdata[26]_u_arm_u_soc ,
           \fp0_m_ahb_wdata[27]_u_arm_u_soc , \fp0_m_ahb_wdata[28]_u_arm_u_soc ,
           \fp0_m_ahb_wdata[29]_u_arm_u_soc , \fp0_m_ahb_wdata[2]_u_arm_u_soc ,
           \fp0_m_ahb_wdata[30]_u_arm_u_soc , \fp0_m_ahb_wdata[31]_u_arm_u_soc ,
           \fp0_m_ahb_wdata[3]_u_arm_u_soc , \fp0_m_ahb_wdata[4]_u_arm_u_soc ,
           \fp0_m_ahb_wdata[5]_u_arm_u_soc , \fp0_m_ahb_wdata[6]_u_arm_u_soc ,
           \fp0_m_ahb_wdata[7]_u_arm_u_soc , \fp0_m_ahb_wdata[8]_u_arm_u_soc ,
           \fp0_m_ahb_wdata[9]_u_arm_u_soc , fp0_m_ahb_write_u_arm_u_soc,
           fp2soc_rst_n_u_arm_u_soc, fp_clk_arm_u_arm_u_soc, fp_clk_sys_u_arm_u_soc,
           geclk_u_lvds_u_lvds_tx_0, geclk_u_lvds_u_lvds_tx_1, geclk_u_lvds_u_lvds_tx_2,
           geclk_u_lvds_u_lvds_tx_3, geclk_u_lvds_u_lvds_tx_clk, \gpio_0_out_o[0]_u_arm_u_soc ,
           \gpio_0_out_o[1]_u_arm_u_soc , locked_u_pll_pll_u0, \od_d_0[0]_u_lvds_u_lvds_tx_0 ,
           \od_d_0[0]_u_lvds_u_lvds_tx_1 , \od_d_0[0]_u_lvds_u_lvds_tx_2 ,
           \od_d_0[0]_u_lvds_u_lvds_tx_3 , \od_d_0[1]_u_lvds_u_lvds_tx_0 ,
           \od_d_0[1]_u_lvds_u_lvds_tx_1 , \od_d_0[1]_u_lvds_u_lvds_tx_2 ,
           \od_d_0[1]_u_lvds_u_lvds_tx_3 , \od_d_0[2]_u_lvds_u_lvds_tx_0 ,
           \od_d_0[2]_u_lvds_u_lvds_tx_1 , \od_d_0[2]_u_lvds_u_lvds_tx_2 ,
           \od_d_0[2]_u_lvds_u_lvds_tx_3 , \od_d_0[3]_u_lvds_u_lvds_tx_0 ,
           \od_d_0[3]_u_lvds_u_lvds_tx_1 , \od_d_0[3]_u_lvds_u_lvds_tx_2 ,
           \od_d_0[3]_u_lvds_u_lvds_tx_3 , \od_d_1[0]_u_lvds_u_lvds_tx_0 ,
           \od_d_1[0]_u_lvds_u_lvds_tx_1 , \od_d_1[0]_u_lvds_u_lvds_tx_2 ,
           \od_d_1[0]_u_lvds_u_lvds_tx_3 , \od_d_1[1]_u_lvds_u_lvds_tx_0 ,
           \od_d_1[1]_u_lvds_u_lvds_tx_1 , \od_d_1[1]_u_lvds_u_lvds_tx_2 ,
           \od_d_1[1]_u_lvds_u_lvds_tx_3 , \od_d_1[2]_u_lvds_u_lvds_tx_0 ,
           \od_d_1[2]_u_lvds_u_lvds_tx_1 , \od_d_1[2]_u_lvds_u_lvds_tx_2 ,
           \od_d_1[2]_u_lvds_u_lvds_tx_3 , \od_d_1[3]_u_lvds_u_lvds_tx_0 ,
           \od_d_1[3]_u_lvds_u_lvds_tx_1 , \od_d_1[3]_u_lvds_u_lvds_tx_2 ,
           \od_d_1[3]_u_lvds_u_lvds_tx_3 , \q[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ,
           \q[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 , \q[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 ,
           \q[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 , \q[0]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 ,
           \q[0]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 , \q[0]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 ,
           \q[0]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 , \q[1]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ,
           \q[1]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 , \q[1]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 ,
           \q[1]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 , \q[1]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 ,
           \q[1]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 , \q[1]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 ,
           \q[1]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 , \q[2]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ,
           \q[2]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 , \q[2]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 ,
           \q[2]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 , \q[2]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 ,
           \q[2]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 , \q[2]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 ,
           \q[2]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 , \q[3]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ,
           \q[3]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 , \q[3]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 ,
           \q[3]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 , \q[3]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 ,
           \q[3]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 , \q[3]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 ,
           \q[3]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 , rst_ahb_fp0_n_u_arm_u_soc,
           rstn_i, rstna_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0, rstna_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1,
           rstna_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2, rstna_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3,
           rstna_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0, rstna_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1,
           rstna_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2, rstna_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3,
           rstnb_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0, rstnb_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1,
           rstnb_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2, rstnb_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3,
           rstnb_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0, rstnb_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1,
           rstnb_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2, rstnb_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3,
           spi0_miso_u_arm_u_soc, spi0_mosi_u_arm_u_soc, spi0_sck_u_arm_u_soc,
           spi0_ssn_u_arm_u_soc, spi_miso, spi_mosi, spi_sck, spi_ssn, tx_out_n,
           tx_out_p, wea_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0, wea_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1,
           wea_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2, wea_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3,
           wea_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0, wea_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1,
           wea_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2, wea_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3,
           web_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0, web_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1,
           web_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2, web_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3,
           web_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0, web_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1,
           web_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2, web_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 );

    input  PAD0_u_lvds_u_lvds_tx_0, PAD0_u_lvds_u_lvds_tx_1, PAD0_u_lvds_u_lvds_tx_2,
       PAD0_u_lvds_u_lvds_tx_3, PAD0_u_lvds_u_lvds_tx_clk, PAD1_u_lvds_u_lvds_tx_0,
       PAD1_u_lvds_u_lvds_tx_1, PAD1_u_lvds_u_lvds_tx_2, PAD1_u_lvds_u_lvds_tx_3,
       PAD1_u_lvds_u_lvds_tx_clk;
    output \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 , \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 ,
       \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 , \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 ,
       \aa[0]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 , \aa[0]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 ,
       \aa[0]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 , \aa[0]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 ,
       \aa[10]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 , \aa[10]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 ,
       \aa[10]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 , \aa[10]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 ,
       \aa[10]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 , \aa[10]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 ,
       \aa[10]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 , \aa[10]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 ,
       \aa[11]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 , \aa[11]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 ,
       \aa[11]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 , \aa[11]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 ,
       \aa[11]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 , \aa[11]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 ,
       \aa[11]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 , \aa[11]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 ,
       \aa[1]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 , \aa[1]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 ,
       \aa[1]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 , \aa[1]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 ,
       \aa[1]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 , \aa[1]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 ,
       \aa[1]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 , \aa[1]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 ,
       \aa[2]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 , \aa[2]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 ,
       \aa[2]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 , \aa[2]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 ,
       \aa[2]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 , \aa[2]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 ,
       \aa[2]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 , \aa[2]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 ,
       \aa[3]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 , \aa[3]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 ,
       \aa[3]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 , \aa[3]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 ,
       \aa[3]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 , \aa[3]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 ,
       \aa[3]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 , \aa[3]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 ,
       \aa[4]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 , \aa[4]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 ,
       \aa[4]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 , \aa[4]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 ,
       \aa[4]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 , \aa[4]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 ,
       \aa[4]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 , \aa[4]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 ,
       \aa[5]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 , \aa[5]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 ,
       \aa[5]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 , \aa[5]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 ,
       \aa[5]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 , \aa[5]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 ,
       \aa[5]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 , \aa[5]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 ,
       \aa[6]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 , \aa[6]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 ,
       \aa[6]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 , \aa[6]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 ,
       \aa[6]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 , \aa[6]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 ,
       \aa[6]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 , \aa[6]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 ,
       \aa[7]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 , \aa[7]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 ,
       \aa[7]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 , \aa[7]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 ,
       \aa[7]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 , \aa[7]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 ,
       \aa[7]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 , \aa[7]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 ,
       \aa[8]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 , \aa[8]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 ,
       \aa[8]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 , \aa[8]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 ,
       \aa[8]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 , \aa[8]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 ,
       \aa[8]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 , \aa[8]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 ,
       \aa[9]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 , \aa[9]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 ,
       \aa[9]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 , \aa[9]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 ,
       \aa[9]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 , \aa[9]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 ,
       \aa[9]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 , \aa[9]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 ,
       \ab[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 , \ab[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 ,
       \ab[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 , \ab[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 ,
       \ab[0]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 , \ab[0]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 ,
       \ab[0]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 , \ab[0]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 ,
       \ab[10]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 , \ab[10]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 ,
       \ab[10]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 , \ab[10]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 ,
       \ab[10]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 , \ab[10]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 ,
       \ab[10]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 , \ab[10]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 ,
       \ab[11]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 , \ab[11]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 ,
       \ab[11]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 , \ab[11]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 ,
       \ab[11]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 , \ab[11]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 ,
       \ab[11]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 , \ab[11]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 ,
       \ab[1]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 , \ab[1]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 ,
       \ab[1]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 , \ab[1]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 ,
       \ab[1]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 , \ab[1]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 ,
       \ab[1]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 , \ab[1]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 ,
       \ab[2]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 , \ab[2]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 ,
       \ab[2]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 , \ab[2]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 ,
       \ab[2]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 , \ab[2]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 ,
       \ab[2]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 , \ab[2]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 ,
       \ab[3]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 , \ab[3]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 ,
       \ab[3]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 , \ab[3]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 ,
       \ab[3]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 , \ab[3]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 ,
       \ab[3]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 , \ab[3]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 ,
       \ab[4]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 , \ab[4]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 ,
       \ab[4]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 , \ab[4]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 ,
       \ab[4]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 , \ab[4]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 ,
       \ab[4]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 , \ab[4]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 ,
       \ab[5]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 , \ab[5]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 ,
       \ab[5]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 , \ab[5]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 ,
       \ab[5]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 , \ab[5]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 ,
       \ab[5]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 , \ab[5]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 ,
       \ab[6]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 , \ab[6]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 ,
       \ab[6]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 , \ab[6]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 ,
       \ab[6]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 , \ab[6]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 ,
       \ab[6]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 , \ab[6]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 ,
       \ab[7]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 , \ab[7]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 ,
       \ab[7]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 , \ab[7]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 ,
       \ab[7]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 , \ab[7]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 ,
       \ab[7]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 , \ab[7]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 ,
       \ab[8]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 , \ab[8]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 ,
       \ab[8]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 , \ab[8]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 ,
       \ab[8]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 , \ab[8]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 ,
       \ab[8]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 , \ab[8]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 ,
       \ab[9]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 , \ab[9]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 ,
       \ab[9]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 , \ab[9]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 ,
       \ab[9]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 , \ab[9]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 ,
       \ab[9]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 , \ab[9]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 ,
       align_rstn_u_lvds_u_lvds_tx_0, align_rstn_u_lvds_u_lvds_tx_1, align_rstn_u_lvds_u_lvds_tx_2,
       align_rstn_u_lvds_u_lvds_tx_3, align_rstn_u_lvds_u_lvds_tx_clk, alignwd_u_lvds_u_lvds_tx_clk;
    input  buttonIn2, buttonIn3, buttonIn4;
    output c2r1_dll_clk_u_arm_u_soc, cea_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0,
       cea_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1, cea_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2,
       cea_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3, cea_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0,
       cea_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1, cea_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2,
       cea_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3, ceb_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0,
       ceb_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1, ceb_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2,
       ceb_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3, ceb_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0,
       ceb_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1, ceb_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2,
       ceb_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3, clk_0_u_lvds_u_lvds_tx_0, clk_0_u_lvds_u_lvds_tx_1,
       clk_0_u_lvds_u_lvds_tx_2, clk_0_u_lvds_u_lvds_tx_3, clk_0_u_lvds_u_lvds_tx_clk,
       clk_1_u_lvds_u_lvds_tx_0, clk_1_u_lvds_u_lvds_tx_1, clk_1_u_lvds_u_lvds_tx_2,
       clk_1_u_lvds_u_lvds_tx_3, clk_1_u_lvds_u_lvds_tx_clk, clk_ahb_fp0_u_arm_u_soc;
    input  clk_i;
    output clk_out_n, clk_out_p, clka_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0, clka_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1,
       clka_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2, clka_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3,
       clka_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0, clka_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1,
       clka_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2, clka_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3,
       clkb_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0, clkb_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1,
       clkb_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2, clkb_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3,
       clkb_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0, clkb_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1,
       clkb_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2, clkb_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3,
       clkin0_u_lvds_pll_u0, clkin0_u_pll_pll_u0, clkin_u_arm_dll_u0;
    input  clkout0_u_arm_dll_u0, clkout0_u_lvds_pll_u0, clkout0_u_pll_pll_u0,
       clkout1_u_lvds_pll_u0, clkout1_u_pll_pll_u0;
    output \db[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 , \db[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 ,
       \db[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 , \db[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 ,
       \db[0]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 , \db[0]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 ,
       \db[0]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 , \db[0]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 ,
       \db[10]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 , \db[10]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 ,
       \db[10]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 , \db[10]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 ,
       \db[10]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 , \db[10]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 ,
       \db[10]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 , \db[10]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 ,
       \db[11]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 , \db[11]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 ,
       \db[11]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 , \db[11]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 ,
       \db[11]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 , \db[11]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 ,
       \db[11]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 , \db[11]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 ,
       \db[12]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 , \db[12]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 ,
       \db[12]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 , \db[12]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 ,
       \db[12]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 , \db[12]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 ,
       \db[12]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 , \db[12]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 ,
       \db[13]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 , \db[13]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 ,
       \db[13]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 , \db[13]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 ,
       \db[13]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 , \db[13]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 ,
       \db[13]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 , \db[13]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 ,
       \db[14]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 , \db[14]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 ,
       \db[14]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 , \db[14]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 ,
       \db[14]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 , \db[14]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 ,
       \db[14]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 , \db[14]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 ,
       \db[15]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 , \db[15]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 ,
       \db[15]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 , \db[15]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 ,
       \db[15]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 , \db[15]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 ,
       \db[15]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 , \db[15]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 ,
       \db[16]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 , \db[16]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 ,
       \db[16]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 , \db[16]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 ,
       \db[16]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 , \db[16]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 ,
       \db[16]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 , \db[16]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 ,
       \db[17]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 , \db[17]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 ,
       \db[17]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 , \db[17]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 ,
       \db[17]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 , \db[17]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 ,
       \db[17]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 , \db[17]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 ,
       \db[1]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 , \db[1]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 ,
       \db[1]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 , \db[1]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 ,
       \db[1]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 , \db[1]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 ,
       \db[1]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 , \db[1]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 ,
       \db[2]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 , \db[2]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 ,
       \db[2]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 , \db[2]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 ,
       \db[2]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 , \db[2]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 ,
       \db[2]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 , \db[2]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 ,
       \db[3]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 , \db[3]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 ,
       \db[3]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 , \db[3]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 ,
       \db[3]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 , \db[3]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 ,
       \db[3]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 , \db[3]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 ,
       \db[4]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 , \db[4]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 ,
       \db[4]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 , \db[4]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 ,
       \db[4]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 , \db[4]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 ,
       \db[4]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 , \db[4]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 ,
       \db[5]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 , \db[5]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 ,
       \db[5]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 , \db[5]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 ,
       \db[5]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 , \db[5]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 ,
       \db[5]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 , \db[5]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 ,
       \db[6]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 , \db[6]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 ,
       \db[6]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 , \db[6]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 ,
       \db[6]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 , \db[6]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 ,
       \db[6]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 , \db[6]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 ,
       \db[7]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 , \db[7]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 ,
       \db[7]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 , \db[7]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 ,
       \db[7]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 , \db[7]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 ,
       \db[7]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 , \db[7]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 ,
       \db[8]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 , \db[8]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 ,
       \db[8]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 , \db[8]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 ,
       \db[8]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 , \db[8]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 ,
       \db[8]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 , \db[8]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 ,
       \db[9]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 , \db[9]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 ,
       \db[9]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 , \db[9]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 ,
       \db[9]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 , \db[9]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 ,
       \db[9]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 , \db[9]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 ;
    input  display_sel;
    output \fp0_m_ahb_addr[0]_u_arm_u_soc , \fp0_m_ahb_addr[10]_u_arm_u_soc ,
       \fp0_m_ahb_addr[11]_u_arm_u_soc , \fp0_m_ahb_addr[12]_u_arm_u_soc , \fp0_m_ahb_addr[13]_u_arm_u_soc ,
       \fp0_m_ahb_addr[14]_u_arm_u_soc , \fp0_m_ahb_addr[15]_u_arm_u_soc , \fp0_m_ahb_addr[16]_u_arm_u_soc ,
       \fp0_m_ahb_addr[17]_u_arm_u_soc , \fp0_m_ahb_addr[18]_u_arm_u_soc , \fp0_m_ahb_addr[19]_u_arm_u_soc ,
       \fp0_m_ahb_addr[1]_u_arm_u_soc , \fp0_m_ahb_addr[20]_u_arm_u_soc , \fp0_m_ahb_addr[21]_u_arm_u_soc ,
       \fp0_m_ahb_addr[22]_u_arm_u_soc , \fp0_m_ahb_addr[23]_u_arm_u_soc , \fp0_m_ahb_addr[24]_u_arm_u_soc ,
       \fp0_m_ahb_addr[25]_u_arm_u_soc , \fp0_m_ahb_addr[26]_u_arm_u_soc , \fp0_m_ahb_addr[27]_u_arm_u_soc ,
       \fp0_m_ahb_addr[28]_u_arm_u_soc , \fp0_m_ahb_addr[29]_u_arm_u_soc , \fp0_m_ahb_addr[2]_u_arm_u_soc ,
       \fp0_m_ahb_addr[30]_u_arm_u_soc , \fp0_m_ahb_addr[31]_u_arm_u_soc , \fp0_m_ahb_addr[3]_u_arm_u_soc ,
       \fp0_m_ahb_addr[4]_u_arm_u_soc , \fp0_m_ahb_addr[5]_u_arm_u_soc , \fp0_m_ahb_addr[6]_u_arm_u_soc ,
       \fp0_m_ahb_addr[7]_u_arm_u_soc , \fp0_m_ahb_addr[8]_u_arm_u_soc , \fp0_m_ahb_addr[9]_u_arm_u_soc ,
       \fp0_m_ahb_burst[0]_u_arm_u_soc , \fp0_m_ahb_burst[1]_u_arm_u_soc , \fp0_m_ahb_burst[2]_u_arm_u_soc ,
       fp0_m_ahb_mastlock_u_arm_u_soc, \fp0_m_ahb_prot[0]_u_arm_u_soc , \fp0_m_ahb_prot[1]_u_arm_u_soc ,
       \fp0_m_ahb_prot[2]_u_arm_u_soc , \fp0_m_ahb_prot[3]_u_arm_u_soc ;
    input  \fp0_m_ahb_rdata[0]_u_arm_u_soc , \fp0_m_ahb_rdata[10]_u_arm_u_soc ,
       \fp0_m_ahb_rdata[11]_u_arm_u_soc , \fp0_m_ahb_rdata[12]_u_arm_u_soc ,
       \fp0_m_ahb_rdata[13]_u_arm_u_soc , \fp0_m_ahb_rdata[14]_u_arm_u_soc ,
       \fp0_m_ahb_rdata[15]_u_arm_u_soc , \fp0_m_ahb_rdata[16]_u_arm_u_soc ,
       \fp0_m_ahb_rdata[17]_u_arm_u_soc , \fp0_m_ahb_rdata[18]_u_arm_u_soc ,
       \fp0_m_ahb_rdata[19]_u_arm_u_soc , \fp0_m_ahb_rdata[1]_u_arm_u_soc , \fp0_m_ahb_rdata[20]_u_arm_u_soc ,
       \fp0_m_ahb_rdata[21]_u_arm_u_soc , \fp0_m_ahb_rdata[22]_u_arm_u_soc ,
       \fp0_m_ahb_rdata[23]_u_arm_u_soc , \fp0_m_ahb_rdata[24]_u_arm_u_soc ,
       \fp0_m_ahb_rdata[25]_u_arm_u_soc , \fp0_m_ahb_rdata[26]_u_arm_u_soc ,
       \fp0_m_ahb_rdata[27]_u_arm_u_soc , \fp0_m_ahb_rdata[28]_u_arm_u_soc ,
       \fp0_m_ahb_rdata[29]_u_arm_u_soc , \fp0_m_ahb_rdata[2]_u_arm_u_soc , \fp0_m_ahb_rdata[30]_u_arm_u_soc ,
       \fp0_m_ahb_rdata[31]_u_arm_u_soc , \fp0_m_ahb_rdata[3]_u_arm_u_soc , \fp0_m_ahb_rdata[4]_u_arm_u_soc ,
       \fp0_m_ahb_rdata[5]_u_arm_u_soc , \fp0_m_ahb_rdata[6]_u_arm_u_soc , \fp0_m_ahb_rdata[7]_u_arm_u_soc ,
       \fp0_m_ahb_rdata[8]_u_arm_u_soc , \fp0_m_ahb_rdata[9]_u_arm_u_soc , fp0_m_ahb_ready_u_arm_u_soc,
       fp0_m_ahb_resp_u_arm_u_soc;
    output \fp0_m_ahb_size[0]_u_arm_u_soc , \fp0_m_ahb_size[1]_u_arm_u_soc ,
       \fp0_m_ahb_size[2]_u_arm_u_soc , \fp0_m_ahb_trans[0]_u_arm_u_soc , \fp0_m_ahb_trans[1]_u_arm_u_soc ,
       \fp0_m_ahb_wdata[0]_u_arm_u_soc , \fp0_m_ahb_wdata[10]_u_arm_u_soc , \fp0_m_ahb_wdata[11]_u_arm_u_soc ,
       \fp0_m_ahb_wdata[12]_u_arm_u_soc , \fp0_m_ahb_wdata[13]_u_arm_u_soc ,
       \fp0_m_ahb_wdata[14]_u_arm_u_soc , \fp0_m_ahb_wdata[15]_u_arm_u_soc ,
       \fp0_m_ahb_wdata[16]_u_arm_u_soc , \fp0_m_ahb_wdata[17]_u_arm_u_soc ,
       \fp0_m_ahb_wdata[18]_u_arm_u_soc , \fp0_m_ahb_wdata[19]_u_arm_u_soc ,
       \fp0_m_ahb_wdata[1]_u_arm_u_soc , \fp0_m_ahb_wdata[20]_u_arm_u_soc , \fp0_m_ahb_wdata[21]_u_arm_u_soc ,
       \fp0_m_ahb_wdata[22]_u_arm_u_soc , \fp0_m_ahb_wdata[23]_u_arm_u_soc ,
       \fp0_m_ahb_wdata[24]_u_arm_u_soc , \fp0_m_ahb_wdata[25]_u_arm_u_soc ,
       \fp0_m_ahb_wdata[26]_u_arm_u_soc , \fp0_m_ahb_wdata[27]_u_arm_u_soc ,
       \fp0_m_ahb_wdata[28]_u_arm_u_soc , \fp0_m_ahb_wdata[29]_u_arm_u_soc ,
       \fp0_m_ahb_wdata[2]_u_arm_u_soc , \fp0_m_ahb_wdata[30]_u_arm_u_soc , \fp0_m_ahb_wdata[31]_u_arm_u_soc ,
       \fp0_m_ahb_wdata[3]_u_arm_u_soc , \fp0_m_ahb_wdata[4]_u_arm_u_soc , \fp0_m_ahb_wdata[5]_u_arm_u_soc ,
       \fp0_m_ahb_wdata[6]_u_arm_u_soc , \fp0_m_ahb_wdata[7]_u_arm_u_soc , \fp0_m_ahb_wdata[8]_u_arm_u_soc ,
       \fp0_m_ahb_wdata[9]_u_arm_u_soc , fp0_m_ahb_write_u_arm_u_soc, fp2soc_rst_n_u_arm_u_soc,
       fp_clk_arm_u_arm_u_soc, fp_clk_sys_u_arm_u_soc, geclk_u_lvds_u_lvds_tx_0,
       geclk_u_lvds_u_lvds_tx_1, geclk_u_lvds_u_lvds_tx_2, geclk_u_lvds_u_lvds_tx_3,
       geclk_u_lvds_u_lvds_tx_clk;
    input  \gpio_0_out_o[0]_u_arm_u_soc , \gpio_0_out_o[1]_u_arm_u_soc , locked_u_pll_pll_u0;
    output \od_d_0[0]_u_lvds_u_lvds_tx_0 , \od_d_0[0]_u_lvds_u_lvds_tx_1 ,
       \od_d_0[0]_u_lvds_u_lvds_tx_2 , \od_d_0[0]_u_lvds_u_lvds_tx_3 , \od_d_0[1]_u_lvds_u_lvds_tx_0 ,
       \od_d_0[1]_u_lvds_u_lvds_tx_1 , \od_d_0[1]_u_lvds_u_lvds_tx_2 , \od_d_0[1]_u_lvds_u_lvds_tx_3 ,
       \od_d_0[2]_u_lvds_u_lvds_tx_0 , \od_d_0[2]_u_lvds_u_lvds_tx_1 , \od_d_0[2]_u_lvds_u_lvds_tx_2 ,
       \od_d_0[2]_u_lvds_u_lvds_tx_3 , \od_d_0[3]_u_lvds_u_lvds_tx_0 , \od_d_0[3]_u_lvds_u_lvds_tx_1 ,
       \od_d_0[3]_u_lvds_u_lvds_tx_2 , \od_d_0[3]_u_lvds_u_lvds_tx_3 , \od_d_1[0]_u_lvds_u_lvds_tx_0 ,
       \od_d_1[0]_u_lvds_u_lvds_tx_1 , \od_d_1[0]_u_lvds_u_lvds_tx_2 , \od_d_1[0]_u_lvds_u_lvds_tx_3 ,
       \od_d_1[1]_u_lvds_u_lvds_tx_0 , \od_d_1[1]_u_lvds_u_lvds_tx_1 , \od_d_1[1]_u_lvds_u_lvds_tx_2 ,
       \od_d_1[1]_u_lvds_u_lvds_tx_3 , \od_d_1[2]_u_lvds_u_lvds_tx_0 , \od_d_1[2]_u_lvds_u_lvds_tx_1 ,
       \od_d_1[2]_u_lvds_u_lvds_tx_2 , \od_d_1[2]_u_lvds_u_lvds_tx_3 , \od_d_1[3]_u_lvds_u_lvds_tx_0 ,
       \od_d_1[3]_u_lvds_u_lvds_tx_1 , \od_d_1[3]_u_lvds_u_lvds_tx_2 , \od_d_1[3]_u_lvds_u_lvds_tx_3 ;
    input  \q[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 , \q[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 ,
       \q[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 , \q[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 ,
       \q[0]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 , \q[0]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 ,
       \q[0]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 , \q[0]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 ,
       \q[1]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 , \q[1]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 ,
       \q[1]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 , \q[1]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 ,
       \q[1]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 , \q[1]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 ,
       \q[1]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 , \q[1]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 ,
       \q[2]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 , \q[2]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 ,
       \q[2]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 , \q[2]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 ,
       \q[2]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 , \q[2]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 ,
       \q[2]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 , \q[2]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 ,
       \q[3]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 , \q[3]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 ,
       \q[3]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 , \q[3]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 ,
       \q[3]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 , \q[3]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 ,
       \q[3]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 , \q[3]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 ;
    output rst_ahb_fp0_n_u_arm_u_soc;
    input  rstn_i;
    output rstna_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0, rstna_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1,
       rstna_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2, rstna_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3,
       rstna_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0, rstna_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1,
       rstna_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2, rstna_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3,
       rstnb_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0, rstnb_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1,
       rstnb_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2, rstnb_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3,
       rstnb_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0, rstnb_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1,
       rstnb_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2, rstnb_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3,
       spi0_miso_u_arm_u_soc;
    input  spi0_mosi_u_arm_u_soc, spi0_sck_u_arm_u_soc, spi0_ssn_u_arm_u_soc,
       spi_miso;
    output spi_mosi, spi_sck, spi_ssn;
    output [3:0] tx_out_n;
    output [3:0] tx_out_p;
    output wea_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0, wea_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1,
       wea_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2, wea_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3,
       wea_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0, wea_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1,
       wea_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2, wea_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3,
       web_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0, web_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1,
       web_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2, web_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3,
       web_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0, web_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1,
       web_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2, web_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3;
    wire   \rstn_final__reg|Q_net , \u_colorgen_h_cnt__reg[0]|Q_net , \u_colorgen_h_cnt__reg[10]|Q_net ,
       \u_colorgen_h_cnt__reg[1]|Q_net , \u_colorgen_h_cnt__reg[2]|Q_net , \u_colorgen_h_cnt__reg[3]|Q_net ,
       \u_colorgen_h_cnt__reg[4]|Q_net , \u_colorgen_h_cnt__reg[5]|Q_net , \u_colorgen_h_cnt__reg[6]|Q_net ,
       \u_colorgen_h_cnt__reg[7]|Q_net , \u_colorgen_h_cnt__reg[8]|Q_net , \u_colorgen_h_cnt__reg[9]|Q_net ,
       \u_colorgen_h_valid__reg|Q_net , \u_colorgen_v_cnt__reg[0]|Q_net , \u_colorgen_v_cnt__reg[1]|Q_net ,
       \u_colorgen_v_cnt__reg[2]|Q_net , \u_colorgen_v_cnt__reg[3]|Q_net , \u_colorgen_v_cnt__reg[4]|Q_net ,
       \u_colorgen_v_cnt__reg[5]|Q_net , \u_colorgen_v_cnt__reg[6]|Q_net , \u_colorgen_v_cnt__reg[7]|Q_net ,
       \u_colorgen_v_cnt__reg[8]|Q_net , \u_colorgen_v_cnt__reg[9]|Q_net , \u_colorgen_v_valid__reg|Q_net ,
       \u_sdram_to_RGB_addr_cnt__reg[0]|Q_net , \u_sdram_to_RGB_addr_cnt__reg[10]|Q_net ,
       \u_sdram_to_RGB_addr_cnt__reg[1]|Q_net , \u_sdram_to_RGB_addr_cnt__reg[2]|Q_net ,
       \u_sdram_to_RGB_addr_cnt__reg[3]|Q_net , \u_sdram_to_RGB_addr_cnt__reg[4]|Q_net ,
       \u_sdram_to_RGB_addr_cnt__reg[5]|Q_net , \u_sdram_to_RGB_addr_cnt__reg[6]|Q_net ,
       \u_sdram_to_RGB_addr_cnt__reg[7]|Q_net , \u_sdram_to_RGB_addr_cnt__reg[8]|Q_net ,
       \u_sdram_to_RGB_addr_cnt__reg[9]|Q_net , \u_sdram_to_RGB_ahm_rdata_push_wr0__reg|Q_net ,
       \u_sdram_to_RGB_ahm_rdata_push_wr1__reg|Q_net , \u_sdram_to_RGB_ahm_rdata_r__reg[0]|Q_net ,
       \u_sdram_to_RGB_ahm_rdata_r__reg[10]|Q_net , \u_sdram_to_RGB_ahm_rdata_r__reg[11]|Q_net ,
       \u_sdram_to_RGB_ahm_rdata_r__reg[12]|Q_net , \u_sdram_to_RGB_ahm_rdata_r__reg[13]|Q_net ,
       \u_sdram_to_RGB_ahm_rdata_r__reg[14]|Q_net , \u_sdram_to_RGB_ahm_rdata_r__reg[15]|Q_net ,
       \u_sdram_to_RGB_ahm_rdata_r__reg[16]|Q_net , \u_sdram_to_RGB_ahm_rdata_r__reg[17]|Q_net ,
       \u_sdram_to_RGB_ahm_rdata_r__reg[18]|Q_net , \u_sdram_to_RGB_ahm_rdata_r__reg[19]|Q_net ,
       \u_sdram_to_RGB_ahm_rdata_r__reg[1]|Q_net , \u_sdram_to_RGB_ahm_rdata_r__reg[20]|Q_net ,
       \u_sdram_to_RGB_ahm_rdata_r__reg[21]|Q_net , \u_sdram_to_RGB_ahm_rdata_r__reg[22]|Q_net ,
       \u_sdram_to_RGB_ahm_rdata_r__reg[23]|Q_net , \u_sdram_to_RGB_ahm_rdata_r__reg[24]|Q_net ,
       \u_sdram_to_RGB_ahm_rdata_r__reg[25]|Q_net , \u_sdram_to_RGB_ahm_rdata_r__reg[26]|Q_net ,
       \u_sdram_to_RGB_ahm_rdata_r__reg[27]|Q_net , \u_sdram_to_RGB_ahm_rdata_r__reg[28]|Q_net ,
       \u_sdram_to_RGB_ahm_rdata_r__reg[29]|Q_net , \u_sdram_to_RGB_ahm_rdata_r__reg[2]|Q_net ,
       \u_sdram_to_RGB_ahm_rdata_r__reg[30]|Q_net , \u_sdram_to_RGB_ahm_rdata_r__reg[31]|Q_net ,
       \u_sdram_to_RGB_ahm_rdata_r__reg[3]|Q_net , \u_sdram_to_RGB_ahm_rdata_r__reg[4]|Q_net ,
       \u_sdram_to_RGB_ahm_rdata_r__reg[5]|Q_net , \u_sdram_to_RGB_ahm_rdata_r__reg[6]|Q_net ,
       \u_sdram_to_RGB_ahm_rdata_r__reg[7]|Q_net , \u_sdram_to_RGB_ahm_rdata_r__reg[8]|Q_net ,
       \u_sdram_to_RGB_ahm_rdata_r__reg[9]|Q_net , \u_sdram_to_RGB_bmp_fig_chg__reg[0]|Q_net ,
       \u_sdram_to_RGB_bmp_fig_chg__reg[1]|Q_net , \u_sdram_to_RGB_bmp_fig_cnt__reg[0]|Q_net ,
       \u_sdram_to_RGB_bmp_fig_cnt__reg[1]|Q_net , \u_sdram_to_RGB_bmp_fig_cnt__reg[2]|Q_net ,
       \u_sdram_to_RGB_bmp_fig_cnt__reg[3]|Q_net , \u_sdram_to_RGB_buffer_rd_sel__reg|Q_net ,
       \u_sdram_to_RGB_buffer_rd_sel_r__reg[0]|Q_net , \u_sdram_to_RGB_buffer_rd_sel_r__reg[1]|Q_net ,
       \u_sdram_to_RGB_buffer_wr_sel__reg|Q_net , \u_sdram_to_RGB_de_i_r__reg[0]|Q_net ,
       \u_sdram_to_RGB_de_i_r__reg[1]|Q_net , \u_sdram_to_RGB_de_i_r_sclk__reg[0]|Q_net ,
       \u_sdram_to_RGB_de_i_r_sclk__reg[1]|Q_net , \u_sdram_to_RGB_de_i_r_sclk__reg[2]|Q_net ,
       \u_sdram_to_RGB_de_i_r_sclk__reg[3]|Q_net , \u_sdram_to_RGB_de_i_start_pulse__reg|Q_net ,
       \u_sdram_to_RGB_de_o__reg|Q_net , \u_sdram_to_RGB_display_before_bmp__reg|Q_net ,
       \u_sdram_to_RGB_display_period_align__reg|Q_net , \u_sdram_to_RGB_dma_addr__reg[10]|Q_net ,
       \u_sdram_to_RGB_dma_addr__reg[11]|Q_net , \u_sdram_to_RGB_dma_addr__reg[12]|Q_net ,
       \u_sdram_to_RGB_dma_addr__reg[13]|Q_net , \u_sdram_to_RGB_dma_addr__reg[14]|Q_net ,
       \u_sdram_to_RGB_dma_addr__reg[15]|Q_net , \u_sdram_to_RGB_dma_addr__reg[16]|Q_net ,
       \u_sdram_to_RGB_dma_addr__reg[17]|Q_net , \u_sdram_to_RGB_dma_addr__reg[18]|Q_net ,
       \u_sdram_to_RGB_dma_addr__reg[19]|Q_net , \u_sdram_to_RGB_dma_addr__reg[20]|Q_net ,
       \u_sdram_to_RGB_dma_addr__reg[21]|Q_net , \u_sdram_to_RGB_dma_addr__reg[22]|Q_net ,
       \u_sdram_to_RGB_dma_addr__reg[23]|Q_net , \u_sdram_to_RGB_dma_addr__reg[24]|Q_net ,
       \u_sdram_to_RGB_dma_addr__reg[25]|Q_net , \u_sdram_to_RGB_dma_addr__reg[26]|Q_net ,
       \u_sdram_to_RGB_dma_addr__reg[27]|Q_net , \u_sdram_to_RGB_dma_addr__reg[28]|Q_net ,
       \u_sdram_to_RGB_dma_addr__reg[29]|Q_net , \u_sdram_to_RGB_dma_addr__reg[2]|Q_net ,
       \u_sdram_to_RGB_dma_addr__reg[30]|Q_net , \u_sdram_to_RGB_dma_addr__reg[31]|Q_net ,
       \u_sdram_to_RGB_dma_addr__reg[3]|Q_net , \u_sdram_to_RGB_dma_addr__reg[4]|Q_net ,
       \u_sdram_to_RGB_dma_addr__reg[5]|Q_net , \u_sdram_to_RGB_dma_addr__reg[6]|Q_net ,
       \u_sdram_to_RGB_dma_addr__reg[7]|Q_net , \u_sdram_to_RGB_dma_addr__reg[8]|Q_net ,
       \u_sdram_to_RGB_dma_addr__reg[9]|Q_net , \u_sdram_to_RGB_dma_start_xfer__reg|Q_net ,
       \u_sdram_to_RGB_dma_start_xfer_prev__reg|Q_net , \u_sdram_to_RGB_emb_addr_rd__reg[0]|Q_net ,
       \u_sdram_to_RGB_emb_addr_rd__reg[1]|Q_net , \u_sdram_to_RGB_emb_addr_rd__reg[2]|Q_net ,
       \u_sdram_to_RGB_emb_addr_rd__reg[3]|Q_net , \u_sdram_to_RGB_emb_addr_rd__reg[4]|Q_net ,
       \u_sdram_to_RGB_emb_addr_rd__reg[5]|Q_net , \u_sdram_to_RGB_emb_addr_rd__reg[6]|Q_net ,
       \u_sdram_to_RGB_emb_addr_rd__reg[7]|Q_net , \u_sdram_to_RGB_emb_addr_rd__reg[8]|Q_net ,
       \u_sdram_to_RGB_emb_addr_rd__reg[9]|Q_net , \u_sdram_to_RGB_emb_addr_wr__reg[0]|Q_net ,
       \u_sdram_to_RGB_emb_addr_wr__reg[1]|Q_net , \u_sdram_to_RGB_emb_addr_wr__reg[2]|Q_net ,
       \u_sdram_to_RGB_emb_addr_wr__reg[3]|Q_net , \u_sdram_to_RGB_emb_addr_wr__reg[4]|Q_net ,
       \u_sdram_to_RGB_emb_addr_wr__reg[5]|Q_net , \u_sdram_to_RGB_emb_addr_wr__reg[6]|Q_net ,
       \u_sdram_to_RGB_emb_addr_wr__reg[7]|Q_net , \u_sdram_to_RGB_emb_addr_wr__reg[8]|Q_net ,
       \u_sdram_to_RGB_emb_addr_wr_r__reg[0]|Q_net , \u_sdram_to_RGB_emb_addr_wr_r__reg[1]|Q_net ,
       \u_sdram_to_RGB_emb_addr_wr_r__reg[2]|Q_net , \u_sdram_to_RGB_emb_addr_wr_r__reg[3]|Q_net ,
       \u_sdram_to_RGB_emb_addr_wr_r__reg[4]|Q_net , \u_sdram_to_RGB_emb_addr_wr_r__reg[5]|Q_net ,
       \u_sdram_to_RGB_emb_addr_wr_r__reg[6]|Q_net , \u_sdram_to_RGB_emb_addr_wr_r__reg[7]|Q_net ,
       \u_sdram_to_RGB_emb_addr_wr_r__reg[8]|Q_net , \u_sdram_to_RGB_emb_rdata_0_r__reg[0]|Q_net ,
       \u_sdram_to_RGB_emb_rdata_0_r__reg[10]|Q_net , \u_sdram_to_RGB_emb_rdata_0_r__reg[11]|Q_net ,
       \u_sdram_to_RGB_emb_rdata_0_r__reg[12]|Q_net , \u_sdram_to_RGB_emb_rdata_0_r__reg[13]|Q_net ,
       \u_sdram_to_RGB_emb_rdata_0_r__reg[14]|Q_net , \u_sdram_to_RGB_emb_rdata_0_r__reg[15]|Q_net ,
       \u_sdram_to_RGB_emb_rdata_0_r__reg[1]|Q_net , \u_sdram_to_RGB_emb_rdata_0_r__reg[2]|Q_net ,
       \u_sdram_to_RGB_emb_rdata_0_r__reg[3]|Q_net , \u_sdram_to_RGB_emb_rdata_0_r__reg[4]|Q_net ,
       \u_sdram_to_RGB_emb_rdata_0_r__reg[5]|Q_net , \u_sdram_to_RGB_emb_rdata_0_r__reg[6]|Q_net ,
       \u_sdram_to_RGB_emb_rdata_0_r__reg[7]|Q_net , \u_sdram_to_RGB_emb_rdata_0_r__reg[8]|Q_net ,
       \u_sdram_to_RGB_emb_rdata_0_r__reg[9]|Q_net , \u_sdram_to_RGB_emb_rdata_1_r__reg[0]|Q_net ,
       \u_sdram_to_RGB_emb_rdata_1_r__reg[10]|Q_net , \u_sdram_to_RGB_emb_rdata_1_r__reg[11]|Q_net ,
       \u_sdram_to_RGB_emb_rdata_1_r__reg[12]|Q_net , \u_sdram_to_RGB_emb_rdata_1_r__reg[13]|Q_net ,
       \u_sdram_to_RGB_emb_rdata_1_r__reg[14]|Q_net , \u_sdram_to_RGB_emb_rdata_1_r__reg[15]|Q_net ,
       \u_sdram_to_RGB_emb_rdata_1_r__reg[1]|Q_net , \u_sdram_to_RGB_emb_rdata_1_r__reg[2]|Q_net ,
       \u_sdram_to_RGB_emb_rdata_1_r__reg[3]|Q_net , \u_sdram_to_RGB_emb_rdata_1_r__reg[4]|Q_net ,
       \u_sdram_to_RGB_emb_rdata_1_r__reg[5]|Q_net , \u_sdram_to_RGB_emb_rdata_1_r__reg[6]|Q_net ,
       \u_sdram_to_RGB_emb_rdata_1_r__reg[7]|Q_net , \u_sdram_to_RGB_emb_rdata_1_r__reg[8]|Q_net ,
       \u_sdram_to_RGB_emb_rdata_1_r__reg[9]|Q_net , \u_sdram_to_RGB_emb_rdata_r__reg[0]|Q_net ,
       \u_sdram_to_RGB_emb_rdata_r__reg[10]|Q_net , \u_sdram_to_RGB_emb_rdata_r__reg[11]|Q_net ,
       \u_sdram_to_RGB_emb_rdata_r__reg[12]|Q_net , \u_sdram_to_RGB_emb_rdata_r__reg[13]|Q_net ,
       \u_sdram_to_RGB_emb_rdata_r__reg[14]|Q_net , \u_sdram_to_RGB_emb_rdata_r__reg[15]|Q_net ,
       \u_sdram_to_RGB_emb_rdata_r__reg[1]|Q_net , \u_sdram_to_RGB_emb_rdata_r__reg[2]|Q_net ,
       \u_sdram_to_RGB_emb_rdata_r__reg[3]|Q_net , \u_sdram_to_RGB_emb_rdata_r__reg[4]|Q_net ,
       \u_sdram_to_RGB_emb_rdata_r__reg[5]|Q_net , \u_sdram_to_RGB_emb_rdata_r__reg[6]|Q_net ,
       \u_sdram_to_RGB_emb_rdata_r__reg[7]|Q_net , \u_sdram_to_RGB_emb_rdata_r__reg[8]|Q_net ,
       \u_sdram_to_RGB_emb_rdata_r__reg[9]|Q_net , \u_sdram_to_RGB_other_1_beat_start_pulse__reg|Q_net ,
       \u_sdram_to_RGB_other_1_beat_valid__reg|Q_net , \u_sdram_to_RGB_text__reg[7]|Q_net ,
       \u_sdram_to_RGB_text__reg[8]|Q_net , \u_sdram_to_RGB_text__reg[9]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_addr_count__reg[0]|Q_net , \u_sdram_to_RGB_u_ahb_master_addr_count__reg[1]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_addr_count__reg[2]|Q_net , \u_sdram_to_RGB_u_ahb_master_addr_count__reg[3]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_addr_count__reg[4]|Q_net , \u_sdram_to_RGB_u_ahb_master_addr_count__reg[5]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_addr_count__reg[6]|Q_net , \u_sdram_to_RGB_u_ahb_master_addr_count__reg[7]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_ahb_cs__reg[0]|Q_net , \u_sdram_to_RGB_u_ahb_master_ahb_cs__reg[1]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_ahb_cs__reg[2]|Q_net , \u_sdram_to_RGB_u_ahb_master_ahm_rdata_push__reg|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[0]|Q_net , \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[10]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[11]|Q_net , \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[12]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[13]|Q_net , \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[14]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[15]|Q_net , \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[16]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[17]|Q_net , \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[18]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[19]|Q_net , \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[1]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[20]|Q_net , \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[21]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[22]|Q_net , \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[23]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[24]|Q_net , \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[25]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[26]|Q_net , \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[27]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[28]|Q_net , \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[29]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[2]|Q_net , \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[30]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[31]|Q_net , \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[3]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[4]|Q_net , \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[5]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[6]|Q_net , \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[7]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[8]|Q_net , \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[9]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_ahm_xfer_done__reg|Q_net , \u_sdram_to_RGB_u_ahb_master_dma_cs__reg[0]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_dma_cs__reg[1]|Q_net , \u_sdram_to_RGB_u_ahb_master_dma_eof_get__reg|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[0]|Q_net , \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[10]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[11]|Q_net , \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[12]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[13]|Q_net , \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[14]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[15]|Q_net , \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[16]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[17]|Q_net , \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[18]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[19]|Q_net , \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[1]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[20]|Q_net , \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[21]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[2]|Q_net , \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[3]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[4]|Q_net , \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[5]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[6]|Q_net , \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[7]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[8]|Q_net , \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[9]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[0]|Q_net , \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[1]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[2]|Q_net , \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[3]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[4]|Q_net , \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[5]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[6]|Q_net , \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[7]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_hburst_o__reg[0]|Q_net , \u_sdram_to_RGB_u_ahb_master_hburst_o__reg[1]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_hburst_o__reg[2]|Q_net , \u_sdram_to_RGB_u_ahb_master_htrans_o__reg[0]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_htrans_o__reg[1]|Q_net , \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[0]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[10]|Q_net , \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[11]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[12]|Q_net , \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[13]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[14]|Q_net , \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[15]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[16]|Q_net , \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[17]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[18]|Q_net , \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[19]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[1]|Q_net , \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[20]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[21]|Q_net , \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[22]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[23]|Q_net , \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[24]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[25]|Q_net , \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[26]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[27]|Q_net , \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[28]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[29]|Q_net , \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[2]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[30]|Q_net , \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[31]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[3]|Q_net , \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[4]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[5]|Q_net , \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[6]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[7]|Q_net , \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[8]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[9]|Q_net , \u_sdram_to_RGB_u_ahb_master_hwrite_o__reg|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[10]|Q_net , \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[11]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[12]|Q_net , \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[13]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[14]|Q_net , \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[15]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[16]|Q_net , \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[17]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[18]|Q_net , \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[19]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[20]|Q_net , \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[21]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[22]|Q_net , \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[23]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[24]|Q_net , \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[25]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[26]|Q_net , \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[27]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[28]|Q_net , \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[29]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[2]|Q_net , \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[30]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[31]|Q_net , \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[3]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[4]|Q_net , \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[5]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[6]|Q_net , \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[7]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[8]|Q_net , \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[9]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_mx_done_r__reg|Q_net , \u_sdram_to_RGB_u_ahb_master_u65_XORCI_0|SUM_net ,
       \u_sdram_to_RGB_u_ahb_master_u65_XORCI_1|SUM_net , \u_sdram_to_RGB_u_ahb_master_u65_XORCI_2|SUM_net ,
       \u_sdram_to_RGB_u_ahb_master_u65_XORCI_3|SUM_net , \u_sdram_to_RGB_u_ahb_master_u65_XORCI_4|SUM_net ,
       \u_sdram_to_RGB_u_ahb_master_u65_XORCI_5|SUM_net , \u_sdram_to_RGB_u_ahb_master_u65_XORCI_6|SUM_net ,
       \u_sdram_to_RGB_u_ahb_master_u65_XORCI_7|SUM_net , \u_sdram_to_RGB_u_ahb_master_xfer_count__reg[0]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_xfer_count__reg[1]|Q_net , \u_sdram_to_RGB_u_ahb_master_xfer_count__reg[2]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_xfer_count__reg[3]|Q_net , \u_sdram_to_RGB_u_ahb_master_xfer_count__reg[4]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_xfer_count__reg[5]|Q_net , \u_sdram_to_RGB_u_ahb_master_xfer_count__reg[6]|Q_net ,
       \u_sdram_to_RGB_u_ahb_master_xfer_count__reg[7]|Q_net , \u_sdram_to_RGB_v_valid_r__reg[0]|Q_net ,
       \u_sdram_to_RGB_v_valid_r__reg[1]|Q_net ;

    assign \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \aa[0]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \aa[0]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \aa[0]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \aa[0]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \aa[10]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  = \u_sdram_to_RGB_emb_addr_rd__reg[8]|Q_net ;
    assign \aa[10]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1  = \u_sdram_to_RGB_emb_addr_rd__reg[8]|Q_net ;
    assign \aa[10]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2  = \u_sdram_to_RGB_emb_addr_rd__reg[8]|Q_net ;
    assign \aa[10]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3  = \u_sdram_to_RGB_emb_addr_rd__reg[8]|Q_net ;
    assign \aa[10]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0  = \u_sdram_to_RGB_emb_addr_rd__reg[8]|Q_net ;
    assign \aa[10]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1  = \u_sdram_to_RGB_emb_addr_rd__reg[8]|Q_net ;
    assign \aa[10]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2  = \u_sdram_to_RGB_emb_addr_rd__reg[8]|Q_net ;
    assign \aa[10]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3  = \u_sdram_to_RGB_emb_addr_rd__reg[8]|Q_net ;
    assign \aa[11]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  = \u_sdram_to_RGB_emb_addr_rd__reg[9]|Q_net ;
    assign \aa[11]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1  = \u_sdram_to_RGB_emb_addr_rd__reg[9]|Q_net ;
    assign \aa[11]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2  = \u_sdram_to_RGB_emb_addr_rd__reg[9]|Q_net ;
    assign \aa[11]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3  = \u_sdram_to_RGB_emb_addr_rd__reg[9]|Q_net ;
    assign \aa[11]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0  = \u_sdram_to_RGB_emb_addr_rd__reg[9]|Q_net ;
    assign \aa[11]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1  = \u_sdram_to_RGB_emb_addr_rd__reg[9]|Q_net ;
    assign \aa[11]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2  = \u_sdram_to_RGB_emb_addr_rd__reg[9]|Q_net ;
    assign \aa[11]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3  = \u_sdram_to_RGB_emb_addr_rd__reg[9]|Q_net ;
    assign \aa[1]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \aa[1]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \aa[1]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \aa[1]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \aa[1]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \aa[1]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \aa[1]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \aa[1]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \aa[2]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  = \u_sdram_to_RGB_emb_addr_rd__reg[0]|Q_net ;
    assign \aa[2]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1  = \u_sdram_to_RGB_emb_addr_rd__reg[0]|Q_net ;
    assign \aa[2]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2  = \u_sdram_to_RGB_emb_addr_rd__reg[0]|Q_net ;
    assign \aa[2]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3  = \u_sdram_to_RGB_emb_addr_rd__reg[0]|Q_net ;
    assign \aa[2]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0  = \u_sdram_to_RGB_emb_addr_rd__reg[0]|Q_net ;
    assign \aa[2]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1  = \u_sdram_to_RGB_emb_addr_rd__reg[0]|Q_net ;
    assign \aa[2]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2  = \u_sdram_to_RGB_emb_addr_rd__reg[0]|Q_net ;
    assign \aa[2]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3  = \u_sdram_to_RGB_emb_addr_rd__reg[0]|Q_net ;
    assign \aa[3]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  = \u_sdram_to_RGB_emb_addr_rd__reg[1]|Q_net ;
    assign \aa[3]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1  = \u_sdram_to_RGB_emb_addr_rd__reg[1]|Q_net ;
    assign \aa[3]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2  = \u_sdram_to_RGB_emb_addr_rd__reg[1]|Q_net ;
    assign \aa[3]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3  = \u_sdram_to_RGB_emb_addr_rd__reg[1]|Q_net ;
    assign \aa[3]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0  = \u_sdram_to_RGB_emb_addr_rd__reg[1]|Q_net ;
    assign \aa[3]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1  = \u_sdram_to_RGB_emb_addr_rd__reg[1]|Q_net ;
    assign \aa[3]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2  = \u_sdram_to_RGB_emb_addr_rd__reg[1]|Q_net ;
    assign \aa[3]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3  = \u_sdram_to_RGB_emb_addr_rd__reg[1]|Q_net ;
    assign \aa[4]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  = \u_sdram_to_RGB_emb_addr_rd__reg[2]|Q_net ;
    assign \aa[4]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1  = \u_sdram_to_RGB_emb_addr_rd__reg[2]|Q_net ;
    assign \aa[4]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2  = \u_sdram_to_RGB_emb_addr_rd__reg[2]|Q_net ;
    assign \aa[4]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3  = \u_sdram_to_RGB_emb_addr_rd__reg[2]|Q_net ;
    assign \aa[4]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0  = \u_sdram_to_RGB_emb_addr_rd__reg[2]|Q_net ;
    assign \aa[4]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1  = \u_sdram_to_RGB_emb_addr_rd__reg[2]|Q_net ;
    assign \aa[4]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2  = \u_sdram_to_RGB_emb_addr_rd__reg[2]|Q_net ;
    assign \aa[4]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3  = \u_sdram_to_RGB_emb_addr_rd__reg[2]|Q_net ;
    assign \aa[5]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  = \u_sdram_to_RGB_emb_addr_rd__reg[3]|Q_net ;
    assign \aa[5]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1  = \u_sdram_to_RGB_emb_addr_rd__reg[3]|Q_net ;
    assign \aa[5]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2  = \u_sdram_to_RGB_emb_addr_rd__reg[3]|Q_net ;
    assign \aa[5]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3  = \u_sdram_to_RGB_emb_addr_rd__reg[3]|Q_net ;
    assign \aa[5]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0  = \u_sdram_to_RGB_emb_addr_rd__reg[3]|Q_net ;
    assign \aa[5]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1  = \u_sdram_to_RGB_emb_addr_rd__reg[3]|Q_net ;
    assign \aa[5]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2  = \u_sdram_to_RGB_emb_addr_rd__reg[3]|Q_net ;
    assign \aa[5]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3  = \u_sdram_to_RGB_emb_addr_rd__reg[3]|Q_net ;
    assign \aa[6]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  = \u_sdram_to_RGB_emb_addr_rd__reg[4]|Q_net ;
    assign \aa[6]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1  = \u_sdram_to_RGB_emb_addr_rd__reg[4]|Q_net ;
    assign \aa[6]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2  = \u_sdram_to_RGB_emb_addr_rd__reg[4]|Q_net ;
    assign \aa[6]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3  = \u_sdram_to_RGB_emb_addr_rd__reg[4]|Q_net ;
    assign \aa[6]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0  = \u_sdram_to_RGB_emb_addr_rd__reg[4]|Q_net ;
    assign \aa[6]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1  = \u_sdram_to_RGB_emb_addr_rd__reg[4]|Q_net ;
    assign \aa[6]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2  = \u_sdram_to_RGB_emb_addr_rd__reg[4]|Q_net ;
    assign \aa[6]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3  = \u_sdram_to_RGB_emb_addr_rd__reg[4]|Q_net ;
    assign \aa[7]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  = \u_sdram_to_RGB_emb_addr_rd__reg[5]|Q_net ;
    assign \aa[7]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1  = \u_sdram_to_RGB_emb_addr_rd__reg[5]|Q_net ;
    assign \aa[7]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2  = \u_sdram_to_RGB_emb_addr_rd__reg[5]|Q_net ;
    assign \aa[7]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3  = \u_sdram_to_RGB_emb_addr_rd__reg[5]|Q_net ;
    assign \aa[7]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0  = \u_sdram_to_RGB_emb_addr_rd__reg[5]|Q_net ;
    assign \aa[7]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1  = \u_sdram_to_RGB_emb_addr_rd__reg[5]|Q_net ;
    assign \aa[7]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2  = \u_sdram_to_RGB_emb_addr_rd__reg[5]|Q_net ;
    assign \aa[7]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3  = \u_sdram_to_RGB_emb_addr_rd__reg[5]|Q_net ;
    assign \aa[8]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  = \u_sdram_to_RGB_emb_addr_rd__reg[6]|Q_net ;
    assign \aa[8]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1  = \u_sdram_to_RGB_emb_addr_rd__reg[6]|Q_net ;
    assign \aa[8]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2  = \u_sdram_to_RGB_emb_addr_rd__reg[6]|Q_net ;
    assign \aa[8]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3  = \u_sdram_to_RGB_emb_addr_rd__reg[6]|Q_net ;
    assign \aa[8]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0  = \u_sdram_to_RGB_emb_addr_rd__reg[6]|Q_net ;
    assign \aa[8]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1  = \u_sdram_to_RGB_emb_addr_rd__reg[6]|Q_net ;
    assign \aa[8]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2  = \u_sdram_to_RGB_emb_addr_rd__reg[6]|Q_net ;
    assign \aa[8]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3  = \u_sdram_to_RGB_emb_addr_rd__reg[6]|Q_net ;
    assign \aa[9]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  = \u_sdram_to_RGB_emb_addr_rd__reg[7]|Q_net ;
    assign \aa[9]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1  = \u_sdram_to_RGB_emb_addr_rd__reg[7]|Q_net ;
    assign \aa[9]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2  = \u_sdram_to_RGB_emb_addr_rd__reg[7]|Q_net ;
    assign \aa[9]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3  = \u_sdram_to_RGB_emb_addr_rd__reg[7]|Q_net ;
    assign \aa[9]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0  = \u_sdram_to_RGB_emb_addr_rd__reg[7]|Q_net ;
    assign \aa[9]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1  = \u_sdram_to_RGB_emb_addr_rd__reg[7]|Q_net ;
    assign \aa[9]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2  = \u_sdram_to_RGB_emb_addr_rd__reg[7]|Q_net ;
    assign \aa[9]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3  = \u_sdram_to_RGB_emb_addr_rd__reg[7]|Q_net ;
    assign \ab[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \ab[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \ab[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \ab[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \ab[0]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \ab[0]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \ab[0]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \ab[0]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \ab[10]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  = \u_sdram_to_RGB_emb_addr_wr_r__reg[7]|Q_net ;
    assign \ab[10]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1  = \u_sdram_to_RGB_emb_addr_wr_r__reg[7]|Q_net ;
    assign \ab[10]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2  = \u_sdram_to_RGB_emb_addr_wr_r__reg[7]|Q_net ;
    assign \ab[10]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3  = \u_sdram_to_RGB_emb_addr_wr_r__reg[7]|Q_net ;
    assign \ab[10]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0  = \u_sdram_to_RGB_emb_addr_wr_r__reg[7]|Q_net ;
    assign \ab[10]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1  = \u_sdram_to_RGB_emb_addr_wr_r__reg[7]|Q_net ;
    assign \ab[10]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2  = \u_sdram_to_RGB_emb_addr_wr_r__reg[7]|Q_net ;
    assign \ab[10]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3  = \u_sdram_to_RGB_emb_addr_wr_r__reg[7]|Q_net ;
    assign \ab[11]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  = \u_sdram_to_RGB_emb_addr_wr_r__reg[8]|Q_net ;
    assign \ab[11]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1  = \u_sdram_to_RGB_emb_addr_wr_r__reg[8]|Q_net ;
    assign \ab[11]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2  = \u_sdram_to_RGB_emb_addr_wr_r__reg[8]|Q_net ;
    assign \ab[11]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3  = \u_sdram_to_RGB_emb_addr_wr_r__reg[8]|Q_net ;
    assign \ab[11]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0  = \u_sdram_to_RGB_emb_addr_wr_r__reg[8]|Q_net ;
    assign \ab[11]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1  = \u_sdram_to_RGB_emb_addr_wr_r__reg[8]|Q_net ;
    assign \ab[11]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2  = \u_sdram_to_RGB_emb_addr_wr_r__reg[8]|Q_net ;
    assign \ab[11]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3  = \u_sdram_to_RGB_emb_addr_wr_r__reg[8]|Q_net ;
    assign \ab[1]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \ab[1]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \ab[1]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \ab[1]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \ab[1]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \ab[1]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \ab[1]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \ab[1]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \ab[2]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \ab[2]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \ab[2]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \ab[2]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \ab[2]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \ab[2]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \ab[2]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \ab[2]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \ab[3]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  = \u_sdram_to_RGB_emb_addr_wr_r__reg[0]|Q_net ;
    assign \ab[3]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1  = \u_sdram_to_RGB_emb_addr_wr_r__reg[0]|Q_net ;
    assign \ab[3]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2  = \u_sdram_to_RGB_emb_addr_wr_r__reg[0]|Q_net ;
    assign \ab[3]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3  = \u_sdram_to_RGB_emb_addr_wr_r__reg[0]|Q_net ;
    assign \ab[3]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0  = \u_sdram_to_RGB_emb_addr_wr_r__reg[0]|Q_net ;
    assign \ab[3]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1  = \u_sdram_to_RGB_emb_addr_wr_r__reg[0]|Q_net ;
    assign \ab[3]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2  = \u_sdram_to_RGB_emb_addr_wr_r__reg[0]|Q_net ;
    assign \ab[3]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3  = \u_sdram_to_RGB_emb_addr_wr_r__reg[0]|Q_net ;
    assign \ab[4]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  = \u_sdram_to_RGB_emb_addr_wr_r__reg[1]|Q_net ;
    assign \ab[4]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1  = \u_sdram_to_RGB_emb_addr_wr_r__reg[1]|Q_net ;
    assign \ab[4]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2  = \u_sdram_to_RGB_emb_addr_wr_r__reg[1]|Q_net ;
    assign \ab[4]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3  = \u_sdram_to_RGB_emb_addr_wr_r__reg[1]|Q_net ;
    assign \ab[4]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0  = \u_sdram_to_RGB_emb_addr_wr_r__reg[1]|Q_net ;
    assign \ab[4]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1  = \u_sdram_to_RGB_emb_addr_wr_r__reg[1]|Q_net ;
    assign \ab[4]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2  = \u_sdram_to_RGB_emb_addr_wr_r__reg[1]|Q_net ;
    assign \ab[4]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3  = \u_sdram_to_RGB_emb_addr_wr_r__reg[1]|Q_net ;
    assign \ab[5]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  = \u_sdram_to_RGB_emb_addr_wr_r__reg[2]|Q_net ;
    assign \ab[5]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1  = \u_sdram_to_RGB_emb_addr_wr_r__reg[2]|Q_net ;
    assign \ab[5]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2  = \u_sdram_to_RGB_emb_addr_wr_r__reg[2]|Q_net ;
    assign \ab[5]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3  = \u_sdram_to_RGB_emb_addr_wr_r__reg[2]|Q_net ;
    assign \ab[5]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0  = \u_sdram_to_RGB_emb_addr_wr_r__reg[2]|Q_net ;
    assign \ab[5]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1  = \u_sdram_to_RGB_emb_addr_wr_r__reg[2]|Q_net ;
    assign \ab[5]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2  = \u_sdram_to_RGB_emb_addr_wr_r__reg[2]|Q_net ;
    assign \ab[5]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3  = \u_sdram_to_RGB_emb_addr_wr_r__reg[2]|Q_net ;
    assign \ab[6]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  = \u_sdram_to_RGB_emb_addr_wr_r__reg[3]|Q_net ;
    assign \ab[6]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1  = \u_sdram_to_RGB_emb_addr_wr_r__reg[3]|Q_net ;
    assign \ab[6]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2  = \u_sdram_to_RGB_emb_addr_wr_r__reg[3]|Q_net ;
    assign \ab[6]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3  = \u_sdram_to_RGB_emb_addr_wr_r__reg[3]|Q_net ;
    assign \ab[6]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0  = \u_sdram_to_RGB_emb_addr_wr_r__reg[3]|Q_net ;
    assign \ab[6]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1  = \u_sdram_to_RGB_emb_addr_wr_r__reg[3]|Q_net ;
    assign \ab[6]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2  = \u_sdram_to_RGB_emb_addr_wr_r__reg[3]|Q_net ;
    assign \ab[6]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3  = \u_sdram_to_RGB_emb_addr_wr_r__reg[3]|Q_net ;
    assign \ab[7]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  = \u_sdram_to_RGB_emb_addr_wr_r__reg[4]|Q_net ;
    assign \ab[7]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1  = \u_sdram_to_RGB_emb_addr_wr_r__reg[4]|Q_net ;
    assign \ab[7]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2  = \u_sdram_to_RGB_emb_addr_wr_r__reg[4]|Q_net ;
    assign \ab[7]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3  = \u_sdram_to_RGB_emb_addr_wr_r__reg[4]|Q_net ;
    assign \ab[7]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0  = \u_sdram_to_RGB_emb_addr_wr_r__reg[4]|Q_net ;
    assign \ab[7]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1  = \u_sdram_to_RGB_emb_addr_wr_r__reg[4]|Q_net ;
    assign \ab[7]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2  = \u_sdram_to_RGB_emb_addr_wr_r__reg[4]|Q_net ;
    assign \ab[7]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3  = \u_sdram_to_RGB_emb_addr_wr_r__reg[4]|Q_net ;
    assign \ab[8]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  = \u_sdram_to_RGB_emb_addr_wr_r__reg[5]|Q_net ;
    assign \ab[8]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1  = \u_sdram_to_RGB_emb_addr_wr_r__reg[5]|Q_net ;
    assign \ab[8]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2  = \u_sdram_to_RGB_emb_addr_wr_r__reg[5]|Q_net ;
    assign \ab[8]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3  = \u_sdram_to_RGB_emb_addr_wr_r__reg[5]|Q_net ;
    assign \ab[8]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0  = \u_sdram_to_RGB_emb_addr_wr_r__reg[5]|Q_net ;
    assign \ab[8]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1  = \u_sdram_to_RGB_emb_addr_wr_r__reg[5]|Q_net ;
    assign \ab[8]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2  = \u_sdram_to_RGB_emb_addr_wr_r__reg[5]|Q_net ;
    assign \ab[8]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3  = \u_sdram_to_RGB_emb_addr_wr_r__reg[5]|Q_net ;
    assign \ab[9]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  = \u_sdram_to_RGB_emb_addr_wr_r__reg[6]|Q_net ;
    assign \ab[9]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1  = \u_sdram_to_RGB_emb_addr_wr_r__reg[6]|Q_net ;
    assign \ab[9]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2  = \u_sdram_to_RGB_emb_addr_wr_r__reg[6]|Q_net ;
    assign \ab[9]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3  = \u_sdram_to_RGB_emb_addr_wr_r__reg[6]|Q_net ;
    assign \ab[9]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0  = \u_sdram_to_RGB_emb_addr_wr_r__reg[6]|Q_net ;
    assign \ab[9]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1  = \u_sdram_to_RGB_emb_addr_wr_r__reg[6]|Q_net ;
    assign \ab[9]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2  = \u_sdram_to_RGB_emb_addr_wr_r__reg[6]|Q_net ;
    assign \ab[9]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3  = \u_sdram_to_RGB_emb_addr_wr_r__reg[6]|Q_net ;
    assign align_rstn_u_lvds_u_lvds_tx_0 = \rstn_final__reg|Q_net ;
    assign align_rstn_u_lvds_u_lvds_tx_1 = \rstn_final__reg|Q_net ;
    assign align_rstn_u_lvds_u_lvds_tx_2 = \rstn_final__reg|Q_net ;
    assign align_rstn_u_lvds_u_lvds_tx_3 = \rstn_final__reg|Q_net ;
    assign align_rstn_u_lvds_u_lvds_tx_clk = \rstn_final__reg|Q_net ;
    assign alignwd_u_lvds_u_lvds_tx_clk = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign c2r1_dll_clk_u_arm_u_soc = clkout0_u_arm_dll_u0;
    assign cea_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 = cea_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0;
    assign cea_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 = cea_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0;
    assign cea_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 = cea_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0;
    assign cea_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 = cea_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0;
    assign cea_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 = cea_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0;
    assign cea_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 = cea_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0;
    assign ceb_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 = \u_sdram_to_RGB_ahm_rdata_push_wr0__reg|Q_net ;
    assign ceb_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 = \u_sdram_to_RGB_ahm_rdata_push_wr0__reg|Q_net ;
    assign ceb_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 = \u_sdram_to_RGB_ahm_rdata_push_wr0__reg|Q_net ;
    assign ceb_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 = \u_sdram_to_RGB_ahm_rdata_push_wr0__reg|Q_net ;
    assign ceb_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 = \u_sdram_to_RGB_ahm_rdata_push_wr1__reg|Q_net ;
    assign ceb_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 = \u_sdram_to_RGB_ahm_rdata_push_wr1__reg|Q_net ;
    assign ceb_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 = \u_sdram_to_RGB_ahm_rdata_push_wr1__reg|Q_net ;
    assign ceb_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 = \u_sdram_to_RGB_ahm_rdata_push_wr1__reg|Q_net ;
    assign clk_0_u_lvds_u_lvds_tx_0 = clkout0_u_lvds_pll_u0;
    assign clk_0_u_lvds_u_lvds_tx_1 = clkout0_u_lvds_pll_u0;
    assign clk_0_u_lvds_u_lvds_tx_2 = clkout0_u_lvds_pll_u0;
    assign clk_0_u_lvds_u_lvds_tx_3 = clkout0_u_lvds_pll_u0;
    assign clk_0_u_lvds_u_lvds_tx_clk = clkout0_u_lvds_pll_u0;
    assign clk_1_u_lvds_u_lvds_tx_0 = clkout0_u_lvds_pll_u0;
    assign clk_1_u_lvds_u_lvds_tx_1 = clkout0_u_lvds_pll_u0;
    assign clk_1_u_lvds_u_lvds_tx_2 = clkout0_u_lvds_pll_u0;
    assign clk_1_u_lvds_u_lvds_tx_3 = clkout0_u_lvds_pll_u0;
    assign clk_1_u_lvds_u_lvds_tx_clk = clkout0_u_lvds_pll_u0;
    assign clk_ahb_fp0_u_arm_u_soc = clkout1_u_pll_pll_u0;
    assign clk_out_n = PAD1_u_lvds_u_lvds_tx_clk;
    assign clk_out_p = PAD0_u_lvds_u_lvds_tx_clk;
    assign clka_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 = clkout0_u_lvds_pll_u0;
    assign clka_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 = clkout0_u_lvds_pll_u0;
    assign clka_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 = clkout0_u_lvds_pll_u0;
    assign clka_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 = clkout0_u_lvds_pll_u0;
    assign clka_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 = clkout0_u_lvds_pll_u0;
    assign clka_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 = clkout0_u_lvds_pll_u0;
    assign clka_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 = clkout0_u_lvds_pll_u0;
    assign clka_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 = clkout0_u_lvds_pll_u0;
    assign clkb_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 = clkout1_u_pll_pll_u0;
    assign clkb_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 = clkout1_u_pll_pll_u0;
    assign clkb_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 = clkout1_u_pll_pll_u0;
    assign clkb_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 = clkout1_u_pll_pll_u0;
    assign clkb_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 = clkout1_u_pll_pll_u0;
    assign clkb_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 = clkout1_u_pll_pll_u0;
    assign clkb_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 = clkout1_u_pll_pll_u0;
    assign clkb_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 = clkout1_u_pll_pll_u0;
    assign clkin0_u_lvds_pll_u0 = clk_i;
    assign clkin0_u_pll_pll_u0 = clk_i;
    assign clkin_u_arm_dll_u0 = clkout0_u_pll_pll_u0;
    assign \db[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  = \u_sdram_to_RGB_ahm_rdata_r__reg[0]|Q_net ;
    assign \db[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1  = \u_sdram_to_RGB_ahm_rdata_r__reg[1]|Q_net ;
    assign \db[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2  = \u_sdram_to_RGB_ahm_rdata_r__reg[2]|Q_net ;
    assign \db[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3  = \u_sdram_to_RGB_ahm_rdata_r__reg[3]|Q_net ;
    assign \db[0]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0  = \u_sdram_to_RGB_ahm_rdata_r__reg[0]|Q_net ;
    assign \db[0]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1  = \u_sdram_to_RGB_ahm_rdata_r__reg[1]|Q_net ;
    assign \db[0]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2  = \u_sdram_to_RGB_ahm_rdata_r__reg[2]|Q_net ;
    assign \db[0]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3  = \u_sdram_to_RGB_ahm_rdata_r__reg[3]|Q_net ;
    assign \db[10]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  = \u_sdram_to_RGB_ahm_rdata_r__reg[8]|Q_net ;
    assign \db[10]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1  = \u_sdram_to_RGB_ahm_rdata_r__reg[9]|Q_net ;
    assign \db[10]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2  = \u_sdram_to_RGB_ahm_rdata_r__reg[10]|Q_net ;
    assign \db[10]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3  = \u_sdram_to_RGB_ahm_rdata_r__reg[11]|Q_net ;
    assign \db[10]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0  = \u_sdram_to_RGB_ahm_rdata_r__reg[8]|Q_net ;
    assign \db[10]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1  = \u_sdram_to_RGB_ahm_rdata_r__reg[9]|Q_net ;
    assign \db[10]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2  = \u_sdram_to_RGB_ahm_rdata_r__reg[10]|Q_net ;
    assign \db[10]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3  = \u_sdram_to_RGB_ahm_rdata_r__reg[11]|Q_net ;
    assign \db[11]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  = \u_sdram_to_RGB_ahm_rdata_r__reg[12]|Q_net ;
    assign \db[11]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1  = \u_sdram_to_RGB_ahm_rdata_r__reg[13]|Q_net ;
    assign \db[11]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2  = \u_sdram_to_RGB_ahm_rdata_r__reg[14]|Q_net ;
    assign \db[11]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3  = \u_sdram_to_RGB_ahm_rdata_r__reg[15]|Q_net ;
    assign \db[11]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0  = \u_sdram_to_RGB_ahm_rdata_r__reg[12]|Q_net ;
    assign \db[11]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1  = \u_sdram_to_RGB_ahm_rdata_r__reg[13]|Q_net ;
    assign \db[11]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2  = \u_sdram_to_RGB_ahm_rdata_r__reg[14]|Q_net ;
    assign \db[11]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3  = \u_sdram_to_RGB_ahm_rdata_r__reg[15]|Q_net ;
    assign \db[12]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  = \u_sdram_to_RGB_ahm_rdata_r__reg[16]|Q_net ;
    assign \db[12]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1  = \u_sdram_to_RGB_ahm_rdata_r__reg[17]|Q_net ;
    assign \db[12]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2  = \u_sdram_to_RGB_ahm_rdata_r__reg[18]|Q_net ;
    assign \db[12]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3  = \u_sdram_to_RGB_ahm_rdata_r__reg[19]|Q_net ;
    assign \db[12]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0  = \u_sdram_to_RGB_ahm_rdata_r__reg[16]|Q_net ;
    assign \db[12]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1  = \u_sdram_to_RGB_ahm_rdata_r__reg[17]|Q_net ;
    assign \db[12]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2  = \u_sdram_to_RGB_ahm_rdata_r__reg[18]|Q_net ;
    assign \db[12]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3  = \u_sdram_to_RGB_ahm_rdata_r__reg[19]|Q_net ;
    assign \db[13]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  = \u_sdram_to_RGB_ahm_rdata_r__reg[20]|Q_net ;
    assign \db[13]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1  = \u_sdram_to_RGB_ahm_rdata_r__reg[21]|Q_net ;
    assign \db[13]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2  = \u_sdram_to_RGB_ahm_rdata_r__reg[22]|Q_net ;
    assign \db[13]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3  = \u_sdram_to_RGB_ahm_rdata_r__reg[23]|Q_net ;
    assign \db[13]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0  = \u_sdram_to_RGB_ahm_rdata_r__reg[20]|Q_net ;
    assign \db[13]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1  = \u_sdram_to_RGB_ahm_rdata_r__reg[21]|Q_net ;
    assign \db[13]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2  = \u_sdram_to_RGB_ahm_rdata_r__reg[22]|Q_net ;
    assign \db[13]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3  = \u_sdram_to_RGB_ahm_rdata_r__reg[23]|Q_net ;
    assign \db[14]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  = \u_sdram_to_RGB_ahm_rdata_r__reg[24]|Q_net ;
    assign \db[14]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1  = \u_sdram_to_RGB_ahm_rdata_r__reg[25]|Q_net ;
    assign \db[14]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2  = \u_sdram_to_RGB_ahm_rdata_r__reg[26]|Q_net ;
    assign \db[14]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3  = \u_sdram_to_RGB_ahm_rdata_r__reg[27]|Q_net ;
    assign \db[14]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0  = \u_sdram_to_RGB_ahm_rdata_r__reg[24]|Q_net ;
    assign \db[14]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1  = \u_sdram_to_RGB_ahm_rdata_r__reg[25]|Q_net ;
    assign \db[14]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2  = \u_sdram_to_RGB_ahm_rdata_r__reg[26]|Q_net ;
    assign \db[14]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3  = \u_sdram_to_RGB_ahm_rdata_r__reg[27]|Q_net ;
    assign \db[15]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  = \u_sdram_to_RGB_ahm_rdata_r__reg[28]|Q_net ;
    assign \db[15]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1  = \u_sdram_to_RGB_ahm_rdata_r__reg[29]|Q_net ;
    assign \db[15]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2  = \u_sdram_to_RGB_ahm_rdata_r__reg[30]|Q_net ;
    assign \db[15]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3  = \u_sdram_to_RGB_ahm_rdata_r__reg[31]|Q_net ;
    assign \db[15]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0  = \u_sdram_to_RGB_ahm_rdata_r__reg[28]|Q_net ;
    assign \db[15]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1  = \u_sdram_to_RGB_ahm_rdata_r__reg[29]|Q_net ;
    assign \db[15]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2  = \u_sdram_to_RGB_ahm_rdata_r__reg[30]|Q_net ;
    assign \db[15]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3  = \u_sdram_to_RGB_ahm_rdata_r__reg[31]|Q_net ;
    assign \db[16]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \db[16]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \db[16]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \db[16]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \db[16]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \db[16]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \db[16]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \db[16]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \db[17]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \db[17]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \db[17]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \db[17]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \db[17]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \db[17]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \db[17]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \db[17]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \db[1]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  = \u_sdram_to_RGB_ahm_rdata_r__reg[4]|Q_net ;
    assign \db[1]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1  = \u_sdram_to_RGB_ahm_rdata_r__reg[5]|Q_net ;
    assign \db[1]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2  = \u_sdram_to_RGB_ahm_rdata_r__reg[6]|Q_net ;
    assign \db[1]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3  = \u_sdram_to_RGB_ahm_rdata_r__reg[7]|Q_net ;
    assign \db[1]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0  = \u_sdram_to_RGB_ahm_rdata_r__reg[4]|Q_net ;
    assign \db[1]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1  = \u_sdram_to_RGB_ahm_rdata_r__reg[5]|Q_net ;
    assign \db[1]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2  = \u_sdram_to_RGB_ahm_rdata_r__reg[6]|Q_net ;
    assign \db[1]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3  = \u_sdram_to_RGB_ahm_rdata_r__reg[7]|Q_net ;
    assign \db[2]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  = \u_sdram_to_RGB_ahm_rdata_r__reg[8]|Q_net ;
    assign \db[2]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1  = \u_sdram_to_RGB_ahm_rdata_r__reg[9]|Q_net ;
    assign \db[2]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2  = \u_sdram_to_RGB_ahm_rdata_r__reg[10]|Q_net ;
    assign \db[2]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3  = \u_sdram_to_RGB_ahm_rdata_r__reg[11]|Q_net ;
    assign \db[2]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0  = \u_sdram_to_RGB_ahm_rdata_r__reg[8]|Q_net ;
    assign \db[2]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1  = \u_sdram_to_RGB_ahm_rdata_r__reg[9]|Q_net ;
    assign \db[2]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2  = \u_sdram_to_RGB_ahm_rdata_r__reg[10]|Q_net ;
    assign \db[2]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3  = \u_sdram_to_RGB_ahm_rdata_r__reg[11]|Q_net ;
    assign \db[3]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  = \u_sdram_to_RGB_ahm_rdata_r__reg[12]|Q_net ;
    assign \db[3]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1  = \u_sdram_to_RGB_ahm_rdata_r__reg[13]|Q_net ;
    assign \db[3]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2  = \u_sdram_to_RGB_ahm_rdata_r__reg[14]|Q_net ;
    assign \db[3]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3  = \u_sdram_to_RGB_ahm_rdata_r__reg[15]|Q_net ;
    assign \db[3]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0  = \u_sdram_to_RGB_ahm_rdata_r__reg[12]|Q_net ;
    assign \db[3]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1  = \u_sdram_to_RGB_ahm_rdata_r__reg[13]|Q_net ;
    assign \db[3]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2  = \u_sdram_to_RGB_ahm_rdata_r__reg[14]|Q_net ;
    assign \db[3]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3  = \u_sdram_to_RGB_ahm_rdata_r__reg[15]|Q_net ;
    assign \db[4]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  = \u_sdram_to_RGB_ahm_rdata_r__reg[16]|Q_net ;
    assign \db[4]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1  = \u_sdram_to_RGB_ahm_rdata_r__reg[17]|Q_net ;
    assign \db[4]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2  = \u_sdram_to_RGB_ahm_rdata_r__reg[18]|Q_net ;
    assign \db[4]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3  = \u_sdram_to_RGB_ahm_rdata_r__reg[19]|Q_net ;
    assign \db[4]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0  = \u_sdram_to_RGB_ahm_rdata_r__reg[16]|Q_net ;
    assign \db[4]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1  = \u_sdram_to_RGB_ahm_rdata_r__reg[17]|Q_net ;
    assign \db[4]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2  = \u_sdram_to_RGB_ahm_rdata_r__reg[18]|Q_net ;
    assign \db[4]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3  = \u_sdram_to_RGB_ahm_rdata_r__reg[19]|Q_net ;
    assign \db[5]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  = \u_sdram_to_RGB_ahm_rdata_r__reg[20]|Q_net ;
    assign \db[5]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1  = \u_sdram_to_RGB_ahm_rdata_r__reg[21]|Q_net ;
    assign \db[5]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2  = \u_sdram_to_RGB_ahm_rdata_r__reg[22]|Q_net ;
    assign \db[5]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3  = \u_sdram_to_RGB_ahm_rdata_r__reg[23]|Q_net ;
    assign \db[5]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0  = \u_sdram_to_RGB_ahm_rdata_r__reg[20]|Q_net ;
    assign \db[5]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1  = \u_sdram_to_RGB_ahm_rdata_r__reg[21]|Q_net ;
    assign \db[5]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2  = \u_sdram_to_RGB_ahm_rdata_r__reg[22]|Q_net ;
    assign \db[5]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3  = \u_sdram_to_RGB_ahm_rdata_r__reg[23]|Q_net ;
    assign \db[6]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  = \u_sdram_to_RGB_ahm_rdata_r__reg[24]|Q_net ;
    assign \db[6]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1  = \u_sdram_to_RGB_ahm_rdata_r__reg[25]|Q_net ;
    assign \db[6]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2  = \u_sdram_to_RGB_ahm_rdata_r__reg[26]|Q_net ;
    assign \db[6]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3  = \u_sdram_to_RGB_ahm_rdata_r__reg[27]|Q_net ;
    assign \db[6]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0  = \u_sdram_to_RGB_ahm_rdata_r__reg[24]|Q_net ;
    assign \db[6]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1  = \u_sdram_to_RGB_ahm_rdata_r__reg[25]|Q_net ;
    assign \db[6]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2  = \u_sdram_to_RGB_ahm_rdata_r__reg[26]|Q_net ;
    assign \db[6]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3  = \u_sdram_to_RGB_ahm_rdata_r__reg[27]|Q_net ;
    assign \db[7]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  = \u_sdram_to_RGB_ahm_rdata_r__reg[28]|Q_net ;
    assign \db[7]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1  = \u_sdram_to_RGB_ahm_rdata_r__reg[29]|Q_net ;
    assign \db[7]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2  = \u_sdram_to_RGB_ahm_rdata_r__reg[30]|Q_net ;
    assign \db[7]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3  = \u_sdram_to_RGB_ahm_rdata_r__reg[31]|Q_net ;
    assign \db[7]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0  = \u_sdram_to_RGB_ahm_rdata_r__reg[28]|Q_net ;
    assign \db[7]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1  = \u_sdram_to_RGB_ahm_rdata_r__reg[29]|Q_net ;
    assign \db[7]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2  = \u_sdram_to_RGB_ahm_rdata_r__reg[30]|Q_net ;
    assign \db[7]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3  = \u_sdram_to_RGB_ahm_rdata_r__reg[31]|Q_net ;
    assign \db[8]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  = \u_sdram_to_RGB_ahm_rdata_r__reg[0]|Q_net ;
    assign \db[8]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1  = \u_sdram_to_RGB_ahm_rdata_r__reg[1]|Q_net ;
    assign \db[8]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2  = \u_sdram_to_RGB_ahm_rdata_r__reg[2]|Q_net ;
    assign \db[8]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3  = \u_sdram_to_RGB_ahm_rdata_r__reg[3]|Q_net ;
    assign \db[8]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0  = \u_sdram_to_RGB_ahm_rdata_r__reg[0]|Q_net ;
    assign \db[8]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1  = \u_sdram_to_RGB_ahm_rdata_r__reg[1]|Q_net ;
    assign \db[8]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2  = \u_sdram_to_RGB_ahm_rdata_r__reg[2]|Q_net ;
    assign \db[8]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3  = \u_sdram_to_RGB_ahm_rdata_r__reg[3]|Q_net ;
    assign \db[9]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  = \u_sdram_to_RGB_ahm_rdata_r__reg[4]|Q_net ;
    assign \db[9]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1  = \u_sdram_to_RGB_ahm_rdata_r__reg[5]|Q_net ;
    assign \db[9]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2  = \u_sdram_to_RGB_ahm_rdata_r__reg[6]|Q_net ;
    assign \db[9]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3  = \u_sdram_to_RGB_ahm_rdata_r__reg[7]|Q_net ;
    assign \db[9]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0  = \u_sdram_to_RGB_ahm_rdata_r__reg[4]|Q_net ;
    assign \db[9]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1  = \u_sdram_to_RGB_ahm_rdata_r__reg[5]|Q_net ;
    assign \db[9]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2  = \u_sdram_to_RGB_ahm_rdata_r__reg[6]|Q_net ;
    assign \db[9]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3  = \u_sdram_to_RGB_ahm_rdata_r__reg[7]|Q_net ;
    assign \fp0_m_ahb_addr[0]_u_arm_u_soc  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \fp0_m_ahb_addr[10]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[0]|Q_net ;
    assign \fp0_m_ahb_addr[11]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[1]|Q_net ;
    assign \fp0_m_ahb_addr[12]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[2]|Q_net ;
    assign \fp0_m_ahb_addr[13]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[3]|Q_net ;
    assign \fp0_m_ahb_addr[14]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[4]|Q_net ;
    assign \fp0_m_ahb_addr[15]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[5]|Q_net ;
    assign \fp0_m_ahb_addr[16]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[6]|Q_net ;
    assign \fp0_m_ahb_addr[17]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[7]|Q_net ;
    assign \fp0_m_ahb_addr[18]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[8]|Q_net ;
    assign \fp0_m_ahb_addr[19]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[9]|Q_net ;
    assign \fp0_m_ahb_addr[1]_u_arm_u_soc  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \fp0_m_ahb_addr[20]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[10]|Q_net ;
    assign \fp0_m_ahb_addr[21]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[11]|Q_net ;
    assign \fp0_m_ahb_addr[22]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[12]|Q_net ;
    assign \fp0_m_ahb_addr[23]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[13]|Q_net ;
    assign \fp0_m_ahb_addr[24]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[14]|Q_net ;
    assign \fp0_m_ahb_addr[25]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[15]|Q_net ;
    assign \fp0_m_ahb_addr[26]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[16]|Q_net ;
    assign \fp0_m_ahb_addr[27]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[17]|Q_net ;
    assign \fp0_m_ahb_addr[28]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[18]|Q_net ;
    assign \fp0_m_ahb_addr[29]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[19]|Q_net ;
    assign \fp0_m_ahb_addr[2]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[0]|Q_net ;
    assign \fp0_m_ahb_addr[30]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[20]|Q_net ;
    assign \fp0_m_ahb_addr[31]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[21]|Q_net ;
    assign \fp0_m_ahb_addr[3]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[1]|Q_net ;
    assign \fp0_m_ahb_addr[4]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[2]|Q_net ;
    assign \fp0_m_ahb_addr[5]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[3]|Q_net ;
    assign \fp0_m_ahb_addr[6]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[4]|Q_net ;
    assign \fp0_m_ahb_addr[7]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[5]|Q_net ;
    assign \fp0_m_ahb_addr[8]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[6]|Q_net ;
    assign \fp0_m_ahb_addr[9]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[7]|Q_net ;
    assign \fp0_m_ahb_burst[0]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_hburst_o__reg[0]|Q_net ;
    assign \fp0_m_ahb_burst[1]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_hburst_o__reg[1]|Q_net ;
    assign \fp0_m_ahb_burst[2]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_hburst_o__reg[2]|Q_net ;
    assign fp0_m_ahb_mastlock_u_arm_u_soc = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \fp0_m_ahb_prot[1]_u_arm_u_soc  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \fp0_m_ahb_prot[2]_u_arm_u_soc  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \fp0_m_ahb_prot[3]_u_arm_u_soc  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \fp0_m_ahb_size[0]_u_arm_u_soc  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \fp0_m_ahb_size[1]_u_arm_u_soc  = \fp0_m_ahb_prot[0]_u_arm_u_soc ;
    assign \fp0_m_ahb_size[2]_u_arm_u_soc  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \fp0_m_ahb_trans[0]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_htrans_o__reg[0]|Q_net ;
    assign \fp0_m_ahb_trans[1]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_htrans_o__reg[1]|Q_net ;
    assign \fp0_m_ahb_wdata[0]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[0]|Q_net ;
    assign \fp0_m_ahb_wdata[10]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[10]|Q_net ;
    assign \fp0_m_ahb_wdata[11]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[11]|Q_net ;
    assign \fp0_m_ahb_wdata[12]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[12]|Q_net ;
    assign \fp0_m_ahb_wdata[13]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[13]|Q_net ;
    assign \fp0_m_ahb_wdata[14]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[14]|Q_net ;
    assign \fp0_m_ahb_wdata[15]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[15]|Q_net ;
    assign \fp0_m_ahb_wdata[16]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[16]|Q_net ;
    assign \fp0_m_ahb_wdata[17]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[17]|Q_net ;
    assign \fp0_m_ahb_wdata[18]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[18]|Q_net ;
    assign \fp0_m_ahb_wdata[19]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[19]|Q_net ;
    assign \fp0_m_ahb_wdata[1]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[1]|Q_net ;
    assign \fp0_m_ahb_wdata[20]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[20]|Q_net ;
    assign \fp0_m_ahb_wdata[21]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[21]|Q_net ;
    assign \fp0_m_ahb_wdata[22]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[22]|Q_net ;
    assign \fp0_m_ahb_wdata[23]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[23]|Q_net ;
    assign \fp0_m_ahb_wdata[24]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[24]|Q_net ;
    assign \fp0_m_ahb_wdata[25]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[25]|Q_net ;
    assign \fp0_m_ahb_wdata[26]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[26]|Q_net ;
    assign \fp0_m_ahb_wdata[27]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[27]|Q_net ;
    assign \fp0_m_ahb_wdata[28]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[28]|Q_net ;
    assign \fp0_m_ahb_wdata[29]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[29]|Q_net ;
    assign \fp0_m_ahb_wdata[2]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[2]|Q_net ;
    assign \fp0_m_ahb_wdata[30]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[30]|Q_net ;
    assign \fp0_m_ahb_wdata[31]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[31]|Q_net ;
    assign \fp0_m_ahb_wdata[3]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[3]|Q_net ;
    assign \fp0_m_ahb_wdata[4]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[4]|Q_net ;
    assign \fp0_m_ahb_wdata[5]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[5]|Q_net ;
    assign \fp0_m_ahb_wdata[6]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[6]|Q_net ;
    assign \fp0_m_ahb_wdata[7]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[7]|Q_net ;
    assign \fp0_m_ahb_wdata[8]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[8]|Q_net ;
    assign \fp0_m_ahb_wdata[9]_u_arm_u_soc  = \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[9]|Q_net ;
    assign fp0_m_ahb_write_u_arm_u_soc = \u_sdram_to_RGB_u_ahb_master_hwrite_o__reg|Q_net ;
    assign fp2soc_rst_n_u_arm_u_soc = \rstn_final__reg|Q_net ;
    assign fp_clk_arm_u_arm_u_soc = clkout0_u_pll_pll_u0;
    assign fp_clk_sys_u_arm_u_soc = clkout0_u_pll_pll_u0;
    assign geclk_u_lvds_u_lvds_tx_0 = clkout1_u_lvds_pll_u0;
    assign geclk_u_lvds_u_lvds_tx_1 = clkout1_u_lvds_pll_u0;
    assign geclk_u_lvds_u_lvds_tx_2 = clkout1_u_lvds_pll_u0;
    assign geclk_u_lvds_u_lvds_tx_3 = clkout1_u_lvds_pll_u0;
    assign geclk_u_lvds_u_lvds_tx_clk = clkout1_u_lvds_pll_u0;
    assign \od_d_0[0]_u_lvds_u_lvds_tx_0  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \od_d_0[0]_u_lvds_u_lvds_tx_1  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \od_d_0[0]_u_lvds_u_lvds_tx_2  = \u_sdram_to_RGB_de_o__reg|Q_net ;
    assign \od_d_0[0]_u_lvds_u_lvds_tx_3  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \od_d_0[1]_u_lvds_u_lvds_tx_0  = \u_sdram_to_RGB_emb_rdata_r__reg[13]|Q_net ;
    assign \od_d_0[1]_u_lvds_u_lvds_tx_1  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \od_d_0[1]_u_lvds_u_lvds_tx_2  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \od_d_0[1]_u_lvds_u_lvds_tx_3  = \u_sdram_to_RGB_emb_rdata_r__reg[4]|Q_net ;
    assign \od_d_0[2]_u_lvds_u_lvds_tx_0  = \u_sdram_to_RGB_emb_rdata_r__reg[12]|Q_net ;
    assign \od_d_0[2]_u_lvds_u_lvds_tx_1  = \u_sdram_to_RGB_emb_rdata_r__reg[8]|Q_net ;
    assign \od_d_0[2]_u_lvds_u_lvds_tx_2  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \od_d_0[2]_u_lvds_u_lvds_tx_3  = \u_sdram_to_RGB_emb_rdata_r__reg[3]|Q_net ;
    assign \od_d_0[3]_u_lvds_u_lvds_tx_0  = \u_sdram_to_RGB_emb_rdata_r__reg[11]|Q_net ;
    assign \od_d_0[3]_u_lvds_u_lvds_tx_1  = \u_sdram_to_RGB_emb_rdata_r__reg[7]|Q_net ;
    assign \od_d_0[3]_u_lvds_u_lvds_tx_2  = \u_sdram_to_RGB_emb_rdata_r__reg[2]|Q_net ;
    assign \od_d_0[3]_u_lvds_u_lvds_tx_3  = \u_sdram_to_RGB_emb_rdata_r__reg[10]|Q_net ;
    assign \od_d_1[0]_u_lvds_u_lvds_tx_0  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \od_d_1[0]_u_lvds_u_lvds_tx_1  = \u_sdram_to_RGB_emb_rdata_r__reg[6]|Q_net ;
    assign \od_d_1[0]_u_lvds_u_lvds_tx_2  = \u_sdram_to_RGB_emb_rdata_r__reg[1]|Q_net ;
    assign \od_d_1[0]_u_lvds_u_lvds_tx_3  = \u_sdram_to_RGB_emb_rdata_r__reg[9]|Q_net ;
    assign \od_d_1[1]_u_lvds_u_lvds_tx_0  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \od_d_1[1]_u_lvds_u_lvds_tx_1  = \u_sdram_to_RGB_emb_rdata_r__reg[5]|Q_net ;
    assign \od_d_1[1]_u_lvds_u_lvds_tx_2  = \u_sdram_to_RGB_emb_rdata_r__reg[0]|Q_net ;
    assign \od_d_1[1]_u_lvds_u_lvds_tx_3  = \u_sdram_to_RGB_emb_rdata_r__reg[15]|Q_net ;
    assign \od_d_1[2]_u_lvds_u_lvds_tx_0  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \od_d_1[2]_u_lvds_u_lvds_tx_1  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \od_d_1[2]_u_lvds_u_lvds_tx_2  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \od_d_1[2]_u_lvds_u_lvds_tx_3  = \u_sdram_to_RGB_emb_rdata_r__reg[14]|Q_net ;
    assign \od_d_1[3]_u_lvds_u_lvds_tx_0  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \od_d_1[3]_u_lvds_u_lvds_tx_1  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \od_d_1[3]_u_lvds_u_lvds_tx_2  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign \od_d_1[3]_u_lvds_u_lvds_tx_3  = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign rst_ahb_fp0_n_u_arm_u_soc = \rstn_final__reg|Q_net ;
    assign rstna_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 = \fp0_m_ahb_prot[0]_u_arm_u_soc ;
    assign rstna_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 = \fp0_m_ahb_prot[0]_u_arm_u_soc ;
    assign rstna_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 = \fp0_m_ahb_prot[0]_u_arm_u_soc ;
    assign rstna_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 = \fp0_m_ahb_prot[0]_u_arm_u_soc ;
    assign rstna_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 = \fp0_m_ahb_prot[0]_u_arm_u_soc ;
    assign rstna_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 = \fp0_m_ahb_prot[0]_u_arm_u_soc ;
    assign rstna_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 = \fp0_m_ahb_prot[0]_u_arm_u_soc ;
    assign rstna_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 = \fp0_m_ahb_prot[0]_u_arm_u_soc ;
    assign rstnb_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 = \fp0_m_ahb_prot[0]_u_arm_u_soc ;
    assign rstnb_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 = \fp0_m_ahb_prot[0]_u_arm_u_soc ;
    assign rstnb_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 = \fp0_m_ahb_prot[0]_u_arm_u_soc ;
    assign rstnb_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 = \fp0_m_ahb_prot[0]_u_arm_u_soc ;
    assign rstnb_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 = \fp0_m_ahb_prot[0]_u_arm_u_soc ;
    assign rstnb_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 = \fp0_m_ahb_prot[0]_u_arm_u_soc ;
    assign rstnb_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 = \fp0_m_ahb_prot[0]_u_arm_u_soc ;
    assign rstnb_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 = \fp0_m_ahb_prot[0]_u_arm_u_soc ;
    assign spi0_miso_u_arm_u_soc = spi_miso;
    assign spi_mosi = spi0_mosi_u_arm_u_soc;
    assign spi_sck = spi0_sck_u_arm_u_soc;
    assign spi_ssn = spi0_ssn_u_arm_u_soc;
    assign tx_out_n[0] = PAD1_u_lvds_u_lvds_tx_0;
    assign tx_out_n[1] = PAD1_u_lvds_u_lvds_tx_1;
    assign tx_out_n[2] = PAD1_u_lvds_u_lvds_tx_2;
    assign tx_out_n[3] = PAD1_u_lvds_u_lvds_tx_3;
    assign tx_out_p[0] = PAD0_u_lvds_u_lvds_tx_0;
    assign tx_out_p[1] = PAD0_u_lvds_u_lvds_tx_1;
    assign tx_out_p[2] = PAD0_u_lvds_u_lvds_tx_2;
    assign tx_out_p[3] = PAD0_u_lvds_u_lvds_tx_3;
    assign wea_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign wea_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign wea_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign wea_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign wea_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign wea_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign wea_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign wea_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 = \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ;
    assign web_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 = \fp0_m_ahb_prot[0]_u_arm_u_soc ;
    assign web_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1 = \fp0_m_ahb_prot[0]_u_arm_u_soc ;
    assign web_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2 = \fp0_m_ahb_prot[0]_u_arm_u_soc ;
    assign web_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3 = \fp0_m_ahb_prot[0]_u_arm_u_soc ;
    assign web_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0 = \fp0_m_ahb_prot[0]_u_arm_u_soc ;
    assign web_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1 = \fp0_m_ahb_prot[0]_u_arm_u_soc ;
    assign web_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2 = \fp0_m_ahb_prot[0]_u_arm_u_soc ;
    assign web_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3 = \fp0_m_ahb_prot[0]_u_arm_u_soc ;

    CS_LUT4_PRIM ii0454 ( .DX(\aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0 ), .F0(dummy_abc_1_), .F1(dummy_abc_2_), .F2(dummy_abc_3_), .F3(dummy_abc_4_) );
      defparam ii0454.CONFIG_DATA = 16'h0000;
      defparam ii0454.PLACE_LOCATION = "NONE";
      defparam ii0454.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0455 ( .DX(cea_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0), .F0(\u_sdram_to_RGB_buffer_rd_sel__reg|Q_net ), .F1(\u_sdram_to_RGB_de_i_r_sclk__reg[1]|Q_net ), .F2(dummy_abc_5_), .F3(dummy_abc_6_) );
      defparam ii0455.CONFIG_DATA = 16'h8888;
      defparam ii0455.PLACE_LOCATION = "NONE";
      defparam ii0455.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0456 ( .DX(cea_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0), .F0(\u_sdram_to_RGB_buffer_rd_sel__reg|Q_net ), .F1(\u_sdram_to_RGB_de_i_r_sclk__reg[1]|Q_net ), .F2(dummy_abc_7_), .F3(dummy_abc_8_) );
      defparam ii0456.CONFIG_DATA = 16'h4444;
      defparam ii0456.PLACE_LOCATION = "NONE";
      defparam ii0456.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0457 ( .DX(\fp0_m_ahb_prot[0]_u_arm_u_soc ), .F0(dummy_abc_9_), .F1(dummy_abc_10_), .F2(dummy_abc_11_), .F3(dummy_abc_12_) );
      defparam ii0457.CONFIG_DATA = 16'hFFFF;
      defparam ii0457.PLACE_LOCATION = "NONE";
      defparam ii0457.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0458 ( .DX(nn0458), .F0(locked_u_pll_pll_u0), .F1(rstn_i), .F2(dummy_abc_13_), .F3(dummy_abc_14_) );
      defparam ii0458.CONFIG_DATA = 16'h7777;
      defparam ii0458.PLACE_LOCATION = "NONE";
      defparam ii0458.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0459 ( .DX(nn0459), .F0(\u_colorgen_h_cnt__reg[6]|Q_net ), .F1(\u_colorgen_h_cnt__reg[7]|Q_net ), .F2(\u_colorgen_h_cnt__reg[9]|Q_net ), .F3(dummy_abc_15_) );
      defparam ii0459.CONFIG_DATA = 16'h0101;
      defparam ii0459.PLACE_LOCATION = "NONE";
      defparam ii0459.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0460 ( .DX(nn0460), .F0(\u_colorgen_h_cnt__reg[10]|Q_net ), .F1(\u_colorgen_h_cnt__reg[8]|Q_net ), .F2(\u_colorgen_h_cnt__reg[9]|Q_net ), .F3(nn0459) );
      defparam ii0460.CONFIG_DATA = 16'h00A8;
      defparam ii0460.PLACE_LOCATION = "NONE";
      defparam ii0460.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0461 ( .DX(nn0461), .F0(\u_colorgen_h_cnt__reg[0]|Q_net ), .F1(nn0460), .F2(dummy_abc_16_), .F3(dummy_abc_17_) );
      defparam ii0461.CONFIG_DATA = 16'h1111;
      defparam ii0461.PLACE_LOCATION = "NONE";
      defparam ii0461.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0462 ( .DX(nn0462), .F0(\rstn_final__reg|Q_net ), .F1(dummy_abc_18_), .F2(dummy_abc_19_), .F3(dummy_abc_20_) );
      defparam ii0462.CONFIG_DATA = 16'h5555;
      defparam ii0462.PLACE_LOCATION = "NONE";
      defparam ii0462.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0463 ( .DX(nn0463), .F0(\u_colorgen_h_cnt__reg[0]|Q_net ), .F1(\u_colorgen_h_cnt__reg[1]|Q_net ), .F2(\u_colorgen_h_cnt__reg[2]|Q_net ), .F3(dummy_abc_21_) );
      defparam ii0463.CONFIG_DATA = 16'h8080;
      defparam ii0463.PLACE_LOCATION = "NONE";
      defparam ii0463.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0464 ( .DX(nn0464), .F0(\u_colorgen_h_cnt__reg[3]|Q_net ), .F1(nn0463), .F2(dummy_abc_22_), .F3(dummy_abc_23_) );
      defparam ii0464.CONFIG_DATA = 16'h8888;
      defparam ii0464.PLACE_LOCATION = "NONE";
      defparam ii0464.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0465 ( .DX(nn0465), .F0(\u_colorgen_h_cnt__reg[4]|Q_net ), .F1(\u_colorgen_h_cnt__reg[5]|Q_net ), .F2(nn0464), .F3(dummy_abc_24_) );
      defparam ii0465.CONFIG_DATA = 16'h8080;
      defparam ii0465.PLACE_LOCATION = "NONE";
      defparam ii0465.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0466 ( .DX(nn0466), .F0(\u_colorgen_h_cnt__reg[6]|Q_net ), .F1(\u_colorgen_h_cnt__reg[7]|Q_net ), .F2(\u_colorgen_h_cnt__reg[8]|Q_net ), .F3(nn0465) );
      defparam ii0466.CONFIG_DATA = 16'h8000;
      defparam ii0466.PLACE_LOCATION = "NONE";
      defparam ii0466.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0467 ( .DX(nn0467), .F0(\u_colorgen_h_cnt__reg[10]|Q_net ), .F1(\u_colorgen_h_cnt__reg[9]|Q_net ), .F2(nn0460), .F3(nn0466) );
      defparam ii0467.CONFIG_DATA = 16'h0E0A;
      defparam ii0467.PLACE_LOCATION = "NONE";
      defparam ii0467.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0468 ( .DX(nn0468), .F0(\u_colorgen_h_cnt__reg[0]|Q_net ), .F1(\u_colorgen_h_cnt__reg[1]|Q_net ), .F2(nn0460), .F3(dummy_abc_25_) );
      defparam ii0468.CONFIG_DATA = 16'h0606;
      defparam ii0468.PLACE_LOCATION = "NONE";
      defparam ii0468.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0469 ( .DX(nn0469), .F0(\u_colorgen_h_cnt__reg[0]|Q_net ), .F1(\u_colorgen_h_cnt__reg[1]|Q_net ), .F2(\u_colorgen_h_cnt__reg[2]|Q_net ), .F3(dummy_abc_26_) );
      defparam ii0469.CONFIG_DATA = 16'h0707;
      defparam ii0469.PLACE_LOCATION = "NONE";
      defparam ii0469.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0470 ( .DX(nn0470), .F0(nn0460), .F1(nn0463), .F2(nn0469), .F3(dummy_abc_27_) );
      defparam ii0470.CONFIG_DATA = 16'h0101;
      defparam ii0470.PLACE_LOCATION = "NONE";
      defparam ii0470.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0471 ( .DX(nn0471), .F0(\u_colorgen_h_cnt__reg[3]|Q_net ), .F1(nn0460), .F2(nn0463), .F3(dummy_abc_28_) );
      defparam ii0471.CONFIG_DATA = 16'h1212;
      defparam ii0471.PLACE_LOCATION = "NONE";
      defparam ii0471.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0472 ( .DX(nn0472), .F0(\u_colorgen_h_cnt__reg[4]|Q_net ), .F1(nn0460), .F2(nn0464), .F3(dummy_abc_29_) );
      defparam ii0472.CONFIG_DATA = 16'h1212;
      defparam ii0472.PLACE_LOCATION = "NONE";
      defparam ii0472.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0473 ( .DX(nn0473), .F0(\u_colorgen_h_cnt__reg[4]|Q_net ), .F1(\u_colorgen_h_cnt__reg[5]|Q_net ), .F2(nn0460), .F3(nn0464) );
      defparam ii0473.CONFIG_DATA = 16'h060C;
      defparam ii0473.PLACE_LOCATION = "NONE";
      defparam ii0473.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0474 ( .DX(nn0474), .F0(\u_colorgen_h_cnt__reg[6]|Q_net ), .F1(nn0460), .F2(nn0465), .F3(dummy_abc_30_) );
      defparam ii0474.CONFIG_DATA = 16'h1212;
      defparam ii0474.PLACE_LOCATION = "NONE";
      defparam ii0474.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0475 ( .DX(nn0475), .F0(\u_colorgen_h_cnt__reg[6]|Q_net ), .F1(\u_colorgen_h_cnt__reg[7]|Q_net ), .F2(nn0460), .F3(nn0465) );
      defparam ii0475.CONFIG_DATA = 16'h060C;
      defparam ii0475.PLACE_LOCATION = "NONE";
      defparam ii0475.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0476 ( .DX(nn0476), .F0(\u_colorgen_h_cnt__reg[6]|Q_net ), .F1(\u_colorgen_h_cnt__reg[7]|Q_net ), .F2(\u_colorgen_h_cnt__reg[8]|Q_net ), .F3(nn0465) );
      defparam ii0476.CONFIG_DATA = 16'h78F0;
      defparam ii0476.PLACE_LOCATION = "NONE";
      defparam ii0476.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0477 ( .DX(nn0477), .F0(nn0460), .F1(nn0476), .F2(dummy_abc_31_), .F3(dummy_abc_32_) );
      defparam ii0477.CONFIG_DATA = 16'h4444;
      defparam ii0477.PLACE_LOCATION = "NONE";
      defparam ii0477.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0478 ( .DX(nn0478), .F0(\u_colorgen_h_cnt__reg[9]|Q_net ), .F1(nn0460), .F2(nn0466), .F3(dummy_abc_33_) );
      defparam ii0478.CONFIG_DATA = 16'h1212;
      defparam ii0478.PLACE_LOCATION = "NONE";
      defparam ii0478.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0479 ( .DX(nn0479), .F0(\u_colorgen_h_cnt__reg[4]|Q_net ), .F1(\u_colorgen_h_cnt__reg[5]|Q_net ), .F2(nn0459), .F3(nn0469) );
      defparam ii0479.CONFIG_DATA = 16'h1000;
      defparam ii0479.PLACE_LOCATION = "NONE";
      defparam ii0479.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0480 ( .DX(nn0480), .F0(\u_colorgen_h_cnt__reg[10]|Q_net ), .F1(\u_colorgen_h_cnt__reg[3]|Q_net ), .F2(\u_colorgen_h_cnt__reg[8]|Q_net ), .F3(nn0479) );
      defparam ii0480.CONFIG_DATA = 16'h5655;
      defparam ii0480.PLACE_LOCATION = "NONE";
      defparam ii0480.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0481 ( .DX(nn0481), .F0(\u_colorgen_v_cnt__reg[3]|Q_net ), .F1(\u_colorgen_v_cnt__reg[4]|Q_net ), .F2(\u_colorgen_v_cnt__reg[6]|Q_net ), .F3(\u_colorgen_v_cnt__reg[7]|Q_net ) );
      defparam ii0481.CONFIG_DATA = 16'h0001;
      defparam ii0481.PLACE_LOCATION = "NONE";
      defparam ii0481.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0482 ( .DX(nn0482), .F0(\u_colorgen_v_cnt__reg[8]|Q_net ), .F1(\u_colorgen_v_cnt__reg[9]|Q_net ), .F2(dummy_abc_34_), .F3(dummy_abc_35_) );
      defparam ii0482.CONFIG_DATA = 16'h8888;
      defparam ii0482.PLACE_LOCATION = "NONE";
      defparam ii0482.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0483 ( .DX(nn0483), .F0(\u_colorgen_v_cnt__reg[5]|Q_net ), .F1(\u_colorgen_v_cnt__reg[6]|Q_net ), .F2(\u_colorgen_v_cnt__reg[7]|Q_net ), .F3(nn0482) );
      defparam ii0483.CONFIG_DATA = 16'hFE00;
      defparam ii0483.PLACE_LOCATION = "NONE";
      defparam ii0483.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0484 ( .DX(nn0484), .F0(\u_colorgen_v_cnt__reg[1]|Q_net ), .F1(\u_colorgen_v_cnt__reg[2]|Q_net ), .F2(nn0481), .F3(nn0483) );
      defparam ii0484.CONFIG_DATA = 16'h8F00;
      defparam ii0484.PLACE_LOCATION = "NONE";
      defparam ii0484.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0485 ( .DX(nn0485), .F0(\u_colorgen_v_cnt__reg[0]|Q_net ), .F1(nn0484), .F2(dummy_abc_36_), .F3(dummy_abc_37_) );
      defparam ii0485.CONFIG_DATA = 16'h1111;
      defparam ii0485.PLACE_LOCATION = "NONE";
      defparam ii0485.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0486 ( .DX(nn0486), .F0(\u_colorgen_h_cnt__reg[10]|Q_net ), .F1(\u_colorgen_h_cnt__reg[8]|Q_net ), .F2(nn0459), .F3(nn0465) );
      defparam ii0486.CONFIG_DATA = 16'h8000;
      defparam ii0486.PLACE_LOCATION = "NONE";
      defparam ii0486.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0487 ( .DX(nn0487), .F0(\u_colorgen_v_cnt__reg[0]|Q_net ), .F1(\u_colorgen_v_cnt__reg[1]|Q_net ), .F2(nn0484), .F3(dummy_abc_38_) );
      defparam ii0487.CONFIG_DATA = 16'h0606;
      defparam ii0487.PLACE_LOCATION = "NONE";
      defparam ii0487.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0488 ( .DX(nn0488), .F0(\u_colorgen_v_cnt__reg[0]|Q_net ), .F1(\u_colorgen_v_cnt__reg[1]|Q_net ), .F2(\u_colorgen_v_cnt__reg[2]|Q_net ), .F3(nn0484) );
      defparam ii0488.CONFIG_DATA = 16'h0078;
      defparam ii0488.PLACE_LOCATION = "NONE";
      defparam ii0488.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0489 ( .DX(nn0489), .F0(\u_colorgen_v_cnt__reg[0]|Q_net ), .F1(\u_colorgen_v_cnt__reg[1]|Q_net ), .F2(\u_colorgen_v_cnt__reg[2]|Q_net ), .F3(\u_colorgen_v_cnt__reg[3]|Q_net ) );
      defparam ii0489.CONFIG_DATA = 16'h7F80;
      defparam ii0489.PLACE_LOCATION = "NONE";
      defparam ii0489.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0490 ( .DX(nn0490), .F0(nn0484), .F1(nn0489), .F2(dummy_abc_39_), .F3(dummy_abc_40_) );
      defparam ii0490.CONFIG_DATA = 16'h4444;
      defparam ii0490.PLACE_LOCATION = "NONE";
      defparam ii0490.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0491 ( .DX(nn0491), .F0(\u_colorgen_v_cnt__reg[0]|Q_net ), .F1(\u_colorgen_v_cnt__reg[1]|Q_net ), .F2(\u_colorgen_v_cnt__reg[2]|Q_net ), .F3(\u_colorgen_v_cnt__reg[3]|Q_net ) );
      defparam ii0491.CONFIG_DATA = 16'h8000;
      defparam ii0491.PLACE_LOCATION = "NONE";
      defparam ii0491.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0492 ( .DX(nn0492), .F0(\u_colorgen_v_cnt__reg[4]|Q_net ), .F1(nn0484), .F2(nn0491), .F3(dummy_abc_41_) );
      defparam ii0492.CONFIG_DATA = 16'h1212;
      defparam ii0492.PLACE_LOCATION = "NONE";
      defparam ii0492.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0493 ( .DX(nn0493), .F0(\u_colorgen_v_cnt__reg[4]|Q_net ), .F1(\u_colorgen_v_cnt__reg[5]|Q_net ), .F2(nn0484), .F3(nn0491) );
      defparam ii0493.CONFIG_DATA = 16'h060C;
      defparam ii0493.PLACE_LOCATION = "NONE";
      defparam ii0493.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0494 ( .DX(nn0494), .F0(\u_colorgen_v_cnt__reg[4]|Q_net ), .F1(\u_colorgen_v_cnt__reg[5]|Q_net ), .F2(nn0491), .F3(dummy_abc_42_) );
      defparam ii0494.CONFIG_DATA = 16'h8080;
      defparam ii0494.PLACE_LOCATION = "NONE";
      defparam ii0494.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0495 ( .DX(nn0495), .F0(\u_colorgen_v_cnt__reg[6]|Q_net ), .F1(nn0484), .F2(nn0494), .F3(dummy_abc_43_) );
      defparam ii0495.CONFIG_DATA = 16'h1212;
      defparam ii0495.PLACE_LOCATION = "NONE";
      defparam ii0495.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0496 ( .DX(nn0496), .F0(\u_colorgen_v_cnt__reg[6]|Q_net ), .F1(\u_colorgen_v_cnt__reg[7]|Q_net ), .F2(nn0484), .F3(nn0494) );
      defparam ii0496.CONFIG_DATA = 16'h060C;
      defparam ii0496.PLACE_LOCATION = "NONE";
      defparam ii0496.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0497 ( .DX(nn0497), .F0(\u_colorgen_v_cnt__reg[6]|Q_net ), .F1(\u_colorgen_v_cnt__reg[7]|Q_net ), .F2(nn0494), .F3(dummy_abc_44_) );
      defparam ii0497.CONFIG_DATA = 16'h8080;
      defparam ii0497.PLACE_LOCATION = "NONE";
      defparam ii0497.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0498 ( .DX(nn0498), .F0(\u_colorgen_v_cnt__reg[8]|Q_net ), .F1(nn0484), .F2(nn0497), .F3(dummy_abc_45_) );
      defparam ii0498.CONFIG_DATA = 16'h1212;
      defparam ii0498.PLACE_LOCATION = "NONE";
      defparam ii0498.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0499 ( .DX(nn0499), .F0(\u_colorgen_v_cnt__reg[8]|Q_net ), .F1(\u_colorgen_v_cnt__reg[9]|Q_net ), .F2(nn0484), .F3(nn0497) );
      defparam ii0499.CONFIG_DATA = 16'h0E0C;
      defparam ii0499.PLACE_LOCATION = "NONE";
      defparam ii0499.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0500 ( .DX(nn0500), .F0(\u_colorgen_v_cnt__reg[1]|Q_net ), .F1(\u_colorgen_v_cnt__reg[2]|Q_net ), .F2(\u_colorgen_v_cnt__reg[5]|Q_net ), .F3(dummy_abc_46_) );
      defparam ii0500.CONFIG_DATA = 16'h0101;
      defparam ii0500.PLACE_LOCATION = "NONE";
      defparam ii0500.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0501 ( .DX(nn0501), .F0(\u_colorgen_v_cnt__reg[8]|Q_net ), .F1(\u_colorgen_v_cnt__reg[9]|Q_net ), .F2(nn0481), .F3(nn0500) );
      defparam ii0501.CONFIG_DATA = 16'hE777;
      defparam ii0501.PLACE_LOCATION = "NONE";
      defparam ii0501.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0502 ( .DX(nn0502), .F0(\u_sdram_to_RGB_addr_cnt__reg[0]|Q_net ), .F1(dummy_abc_47_), .F2(dummy_abc_48_), .F3(dummy_abc_49_) );
      defparam ii0502.CONFIG_DATA = 16'h5555;
      defparam ii0502.PLACE_LOCATION = "NONE";
      defparam ii0502.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0503 ( .DX(nn0503), .F0(\u_sdram_to_RGB_addr_cnt__reg[0]|Q_net ), .F1(\u_sdram_to_RGB_addr_cnt__reg[1]|Q_net ), .F2(\u_sdram_to_RGB_addr_cnt__reg[2]|Q_net ), .F3(\u_sdram_to_RGB_addr_cnt__reg[3]|Q_net ) );
      defparam ii0503.CONFIG_DATA = 16'h8000;
      defparam ii0503.PLACE_LOCATION = "NONE";
      defparam ii0503.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0504 ( .DX(nn0504), .F0(\u_sdram_to_RGB_addr_cnt__reg[4]|Q_net ), .F1(\u_sdram_to_RGB_addr_cnt__reg[5]|Q_net ), .F2(nn0503), .F3(dummy_abc_50_) );
      defparam ii0504.CONFIG_DATA = 16'h8080;
      defparam ii0504.PLACE_LOCATION = "NONE";
      defparam ii0504.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0505 ( .DX(nn0505), .F0(\u_sdram_to_RGB_addr_cnt__reg[6]|Q_net ), .F1(\u_sdram_to_RGB_addr_cnt__reg[7]|Q_net ), .F2(nn0504), .F3(dummy_abc_51_) );
      defparam ii0505.CONFIG_DATA = 16'h8080;
      defparam ii0505.PLACE_LOCATION = "NONE";
      defparam ii0505.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0506 ( .DX(nn0506), .F0(\u_sdram_to_RGB_addr_cnt__reg[9]|Q_net ), .F1(nn0505), .F2(dummy_abc_52_), .F3(dummy_abc_53_) );
      defparam ii0506.CONFIG_DATA = 16'h8888;
      defparam ii0506.PLACE_LOCATION = "NONE";
      defparam ii0506.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0507 ( .DX(nn0507), .F0(\u_sdram_to_RGB_addr_cnt__reg[10]|Q_net ), .F1(\u_sdram_to_RGB_addr_cnt__reg[8]|Q_net ), .F2(\u_sdram_to_RGB_text__reg[7]|Q_net ), .F3(\u_sdram_to_RGB_text__reg[9]|Q_net ) );
      defparam ii0507.CONFIG_DATA = 16'h8241;
      defparam ii0507.PLACE_LOCATION = "NONE";
      defparam ii0507.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0508 ( .DX(nn0508), .F0(\u_sdram_to_RGB_addr_cnt__reg[9]|Q_net ), .F1(\u_sdram_to_RGB_text__reg[8]|Q_net ), .F2(nn0505), .F3(nn0507) );
      defparam ii0508.CONFIG_DATA = 16'h9000;
      defparam ii0508.PLACE_LOCATION = "NONE";
      defparam ii0508.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0509 ( .DX(nn0509), .F0(\u_sdram_to_RGB_addr_cnt__reg[10]|Q_net ), .F1(\u_sdram_to_RGB_addr_cnt__reg[8]|Q_net ), .F2(nn0506), .F3(nn0508) );
      defparam ii0509.CONFIG_DATA = 16'h006A;
      defparam ii0509.PLACE_LOCATION = "NONE";
      defparam ii0509.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0510 ( .DX(nn0510), .F0(\u_sdram_to_RGB_addr_cnt__reg[0]|Q_net ), .F1(\u_sdram_to_RGB_addr_cnt__reg[1]|Q_net ), .F2(dummy_abc_54_), .F3(dummy_abc_55_) );
      defparam ii0510.CONFIG_DATA = 16'h6666;
      defparam ii0510.PLACE_LOCATION = "NONE";
      defparam ii0510.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0511 ( .DX(nn0511), .F0(\u_sdram_to_RGB_addr_cnt__reg[0]|Q_net ), .F1(\u_sdram_to_RGB_addr_cnt__reg[1]|Q_net ), .F2(\u_sdram_to_RGB_addr_cnt__reg[2]|Q_net ), .F3(dummy_abc_56_) );
      defparam ii0511.CONFIG_DATA = 16'h7878;
      defparam ii0511.PLACE_LOCATION = "NONE";
      defparam ii0511.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0512 ( .DX(nn0512), .F0(\u_sdram_to_RGB_addr_cnt__reg[0]|Q_net ), .F1(\u_sdram_to_RGB_addr_cnt__reg[1]|Q_net ), .F2(\u_sdram_to_RGB_addr_cnt__reg[2]|Q_net ), .F3(\u_sdram_to_RGB_addr_cnt__reg[3]|Q_net ) );
      defparam ii0512.CONFIG_DATA = 16'h7F80;
      defparam ii0512.PLACE_LOCATION = "NONE";
      defparam ii0512.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0513 ( .DX(nn0513), .F0(\u_sdram_to_RGB_addr_cnt__reg[4]|Q_net ), .F1(nn0503), .F2(dummy_abc_57_), .F3(dummy_abc_58_) );
      defparam ii0513.CONFIG_DATA = 16'h6666;
      defparam ii0513.PLACE_LOCATION = "NONE";
      defparam ii0513.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0514 ( .DX(nn0514), .F0(\u_sdram_to_RGB_addr_cnt__reg[4]|Q_net ), .F1(\u_sdram_to_RGB_addr_cnt__reg[5]|Q_net ), .F2(nn0503), .F3(dummy_abc_59_) );
      defparam ii0514.CONFIG_DATA = 16'h6C6C;
      defparam ii0514.PLACE_LOCATION = "NONE";
      defparam ii0514.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0515 ( .DX(nn0515), .F0(\u_sdram_to_RGB_addr_cnt__reg[6]|Q_net ), .F1(nn0504), .F2(dummy_abc_60_), .F3(dummy_abc_61_) );
      defparam ii0515.CONFIG_DATA = 16'h6666;
      defparam ii0515.PLACE_LOCATION = "NONE";
      defparam ii0515.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0516 ( .DX(nn0516), .F0(\u_sdram_to_RGB_addr_cnt__reg[6]|Q_net ), .F1(\u_sdram_to_RGB_addr_cnt__reg[7]|Q_net ), .F2(nn0504), .F3(dummy_abc_62_) );
      defparam ii0516.CONFIG_DATA = 16'h6C6C;
      defparam ii0516.PLACE_LOCATION = "NONE";
      defparam ii0516.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0517 ( .DX(nn0517), .F0(\u_sdram_to_RGB_addr_cnt__reg[8]|Q_net ), .F1(nn0505), .F2(nn0508), .F3(dummy_abc_63_) );
      defparam ii0517.CONFIG_DATA = 16'h0606;
      defparam ii0517.PLACE_LOCATION = "NONE";
      defparam ii0517.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0518 ( .DX(nn0518), .F0(\u_sdram_to_RGB_addr_cnt__reg[8]|Q_net ), .F1(\u_sdram_to_RGB_addr_cnt__reg[9]|Q_net ), .F2(nn0505), .F3(nn0508) );
      defparam ii0518.CONFIG_DATA = 16'h006C;
      defparam ii0518.PLACE_LOCATION = "NONE";
      defparam ii0518.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0519 ( .DX(nn0519), .F0(\u_sdram_to_RGB_buffer_wr_sel__reg|Q_net ), .F1(\u_sdram_to_RGB_display_period_align__reg|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_ahm_rdata_push__reg|Q_net ), .F3(dummy_abc_64_) );
      defparam ii0519.CONFIG_DATA = 16'h4040;
      defparam ii0519.PLACE_LOCATION = "NONE";
      defparam ii0519.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0520 ( .DX(nn0520), .F0(\u_sdram_to_RGB_buffer_wr_sel__reg|Q_net ), .F1(\u_sdram_to_RGB_display_period_align__reg|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_ahm_rdata_push__reg|Q_net ), .F3(dummy_abc_65_) );
      defparam ii0520.CONFIG_DATA = 16'h8080;
      defparam ii0520.PLACE_LOCATION = "NONE";
      defparam ii0520.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0521 ( .DX(nn0521), .F0(\gpio_0_out_o[1]_u_arm_u_soc ), .F1(\u_sdram_to_RGB_display_before_bmp__reg|Q_net ), .F2(dummy_abc_66_), .F3(dummy_abc_67_) );
      defparam ii0521.CONFIG_DATA = 16'h2222;
      defparam ii0521.PLACE_LOCATION = "NONE";
      defparam ii0521.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0522 ( .DX(nn0522), .F0(\u_sdram_to_RGB_bmp_fig_cnt__reg[0]|Q_net ), .F1(\u_sdram_to_RGB_display_before_bmp__reg|Q_net ), .F2(dummy_abc_68_), .F3(dummy_abc_69_) );
      defparam ii0522.CONFIG_DATA = 16'h1111;
      defparam ii0522.PLACE_LOCATION = "NONE";
      defparam ii0522.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0523 ( .DX(nn0523), .F0(\u_sdram_to_RGB_bmp_fig_chg__reg[0]|Q_net ), .F1(\u_sdram_to_RGB_bmp_fig_chg__reg[1]|Q_net ), .F2(\u_sdram_to_RGB_display_before_bmp__reg|Q_net ), .F3(dummy_abc_70_) );
      defparam ii0523.CONFIG_DATA = 16'hF2F2;
      defparam ii0523.PLACE_LOCATION = "NONE";
      defparam ii0523.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0524 ( .DX(nn0524), .F0(\u_sdram_to_RGB_bmp_fig_cnt__reg[0]|Q_net ), .F1(\u_sdram_to_RGB_bmp_fig_cnt__reg[1]|Q_net ), .F2(\u_sdram_to_RGB_display_before_bmp__reg|Q_net ), .F3(dummy_abc_71_) );
      defparam ii0524.CONFIG_DATA = 16'h0606;
      defparam ii0524.PLACE_LOCATION = "NONE";
      defparam ii0524.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0525 ( .DX(nn0525), .F0(\u_sdram_to_RGB_bmp_fig_cnt__reg[0]|Q_net ), .F1(\u_sdram_to_RGB_bmp_fig_cnt__reg[1]|Q_net ), .F2(\u_sdram_to_RGB_bmp_fig_cnt__reg[2]|Q_net ), .F3(\u_sdram_to_RGB_display_before_bmp__reg|Q_net ) );
      defparam ii0525.CONFIG_DATA = 16'h0078;
      defparam ii0525.PLACE_LOCATION = "NONE";
      defparam ii0525.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0526 ( .DX(nn0526), .F0(\u_sdram_to_RGB_bmp_fig_cnt__reg[0]|Q_net ), .F1(\u_sdram_to_RGB_bmp_fig_cnt__reg[1]|Q_net ), .F2(\u_sdram_to_RGB_bmp_fig_cnt__reg[2]|Q_net ), .F3(\u_sdram_to_RGB_bmp_fig_cnt__reg[3]|Q_net ) );
      defparam ii0526.CONFIG_DATA = 16'h807F;
      defparam ii0526.PLACE_LOCATION = "NONE";
      defparam ii0526.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0527 ( .DX(nn0527), .F0(\u_sdram_to_RGB_display_before_bmp__reg|Q_net ), .F1(nn0526), .F2(dummy_abc_72_), .F3(dummy_abc_73_) );
      defparam ii0527.CONFIG_DATA = 16'h1111;
      defparam ii0527.PLACE_LOCATION = "NONE";
      defparam ii0527.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0528 ( .DX(nn0528), .F0(\u_sdram_to_RGB_buffer_rd_sel__reg|Q_net ), .F1(\u_sdram_to_RGB_de_i_r_sclk__reg[0]|Q_net ), .F2(\u_sdram_to_RGB_de_i_r_sclk__reg[1]|Q_net ), .F3(dummy_abc_74_) );
      defparam ii0528.CONFIG_DATA = 16'hA6A6;
      defparam ii0528.PLACE_LOCATION = "NONE";
      defparam ii0528.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0529 ( .DX(nn0529), .F0(\u_sdram_to_RGB_buffer_wr_sel__reg|Q_net ), .F1(\u_sdram_to_RGB_de_i_start_pulse__reg|Q_net ), .F2(dummy_abc_75_), .F3(dummy_abc_76_) );
      defparam ii0529.CONFIG_DATA = 16'h6666;
      defparam ii0529.PLACE_LOCATION = "NONE";
      defparam ii0529.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0530 ( .DX(nn0530), .F0(\u_colorgen_h_valid__reg|Q_net ), .F1(\u_colorgen_v_valid__reg|Q_net ), .F2(dummy_abc_77_), .F3(dummy_abc_78_) );
      defparam ii0530.CONFIG_DATA = 16'h8888;
      defparam ii0530.PLACE_LOCATION = "NONE";
      defparam ii0530.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0531 ( .DX(nn0531), .F0(\u_sdram_to_RGB_de_i_r__reg[0]|Q_net ), .F1(\u_sdram_to_RGB_de_i_r__reg[1]|Q_net ), .F2(dummy_abc_79_), .F3(dummy_abc_80_) );
      defparam ii0531.CONFIG_DATA = 16'h2222;
      defparam ii0531.PLACE_LOCATION = "NONE";
      defparam ii0531.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0532 ( .DX(nn0532), .F0(\gpio_0_out_o[0]_u_arm_u_soc ), .F1(\u_sdram_to_RGB_display_before_bmp__reg|Q_net ), .F2(\u_sdram_to_RGB_v_valid_r__reg[0]|Q_net ), .F3(\u_sdram_to_RGB_v_valid_r__reg[1]|Q_net ) );
      defparam ii0532.CONFIG_DATA = 16'hCCAC;
      defparam ii0532.PLACE_LOCATION = "NONE";
      defparam ii0532.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0533 ( .DX(nn0533), .F0(\u_sdram_to_RGB_v_valid_r__reg[0]|Q_net ), .F1(\u_sdram_to_RGB_v_valid_r__reg[1]|Q_net ), .F2(dummy_abc_81_), .F3(dummy_abc_82_) );
      defparam ii0533.CONFIG_DATA = 16'h4444;
      defparam ii0533.PLACE_LOCATION = "NONE";
      defparam ii0533.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0534 ( .DX(nn0534), .F0(\u_sdram_to_RGB_display_period_align__reg|Q_net ), .F1(nn0533), .F2(dummy_abc_83_), .F3(dummy_abc_84_) );
      defparam ii0534.CONFIG_DATA = 16'hEEEE;
      defparam ii0534.PLACE_LOCATION = "NONE";
      defparam ii0534.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0535 ( .DX(nn0535), .F0(display_sel), .F1(\u_sdram_to_RGB_addr_cnt__reg[6]|Q_net ), .F2(dummy_abc_85_), .F3(dummy_abc_86_) );
      defparam ii0535.CONFIG_DATA = 16'h8888;
      defparam ii0535.PLACE_LOCATION = "NONE";
      defparam ii0535.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0536 ( .DX(nn0536), .F0(display_sel), .F1(\u_sdram_to_RGB_addr_cnt__reg[7]|Q_net ), .F2(dummy_abc_87_), .F3(dummy_abc_88_) );
      defparam ii0536.CONFIG_DATA = 16'h8888;
      defparam ii0536.PLACE_LOCATION = "NONE";
      defparam ii0536.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0537 ( .DX(nn0537), .F0(display_sel), .F1(\u_sdram_to_RGB_addr_cnt__reg[8]|Q_net ), .F2(dummy_abc_89_), .F3(dummy_abc_90_) );
      defparam ii0537.CONFIG_DATA = 16'h8888;
      defparam ii0537.PLACE_LOCATION = "NONE";
      defparam ii0537.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0538 ( .DX(nn0538), .F0(display_sel), .F1(\u_sdram_to_RGB_addr_cnt__reg[9]|Q_net ), .F2(dummy_abc_91_), .F3(dummy_abc_92_) );
      defparam ii0538.CONFIG_DATA = 16'h8888;
      defparam ii0538.PLACE_LOCATION = "NONE";
      defparam ii0538.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0539 ( .DX(nn0539), .F0(display_sel), .F1(\u_sdram_to_RGB_addr_cnt__reg[10]|Q_net ), .F2(dummy_abc_93_), .F3(dummy_abc_94_) );
      defparam ii0539.CONFIG_DATA = 16'h8888;
      defparam ii0539.PLACE_LOCATION = "NONE";
      defparam ii0539.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0540 ( .DX(nn0540), .F0(display_sel), .F1(\u_sdram_to_RGB_bmp_fig_cnt__reg[0]|Q_net ), .F2(dummy_abc_95_), .F3(dummy_abc_96_) );
      defparam ii0540.CONFIG_DATA = 16'h8888;
      defparam ii0540.PLACE_LOCATION = "NONE";
      defparam ii0540.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0541 ( .DX(nn0541), .F0(display_sel), .F1(\u_sdram_to_RGB_bmp_fig_cnt__reg[1]|Q_net ), .F2(dummy_abc_97_), .F3(dummy_abc_98_) );
      defparam ii0541.CONFIG_DATA = 16'h8888;
      defparam ii0541.PLACE_LOCATION = "NONE";
      defparam ii0541.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0542 ( .DX(nn0542), .F0(display_sel), .F1(\u_sdram_to_RGB_bmp_fig_cnt__reg[2]|Q_net ), .F2(dummy_abc_99_), .F3(dummy_abc_100_) );
      defparam ii0542.CONFIG_DATA = 16'h8888;
      defparam ii0542.PLACE_LOCATION = "NONE";
      defparam ii0542.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0543 ( .DX(nn0543), .F0(display_sel), .F1(\u_sdram_to_RGB_bmp_fig_cnt__reg[3]|Q_net ), .F2(dummy_abc_101_), .F3(dummy_abc_102_) );
      defparam ii0543.CONFIG_DATA = 16'h8888;
      defparam ii0543.PLACE_LOCATION = "NONE";
      defparam ii0543.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0544 ( .DX(nn0544), .F0(display_sel), .F1(\u_sdram_to_RGB_display_before_bmp__reg|Q_net ), .F2(dummy_abc_103_), .F3(dummy_abc_104_) );
      defparam ii0544.CONFIG_DATA = 16'h8888;
      defparam ii0544.PLACE_LOCATION = "NONE";
      defparam ii0544.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0545 ( .DX(nn0545), .F0(\u_sdram_to_RGB_de_i_start_pulse__reg|Q_net ), .F1(\u_sdram_to_RGB_display_period_align__reg|Q_net ), .F2(\u_sdram_to_RGB_other_1_beat_start_pulse__reg|Q_net ), .F3(dummy_abc_105_) );
      defparam ii0545.CONFIG_DATA = 16'hC8C8;
      defparam ii0545.PLACE_LOCATION = "NONE";
      defparam ii0545.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0546 ( .DX(nn0546), .F0(\u_sdram_to_RGB_de_i_r_sclk__reg[1]|Q_net ), .F1(\u_sdram_to_RGB_emb_addr_rd__reg[0]|Q_net ), .F2(dummy_abc_106_), .F3(dummy_abc_107_) );
      defparam ii0546.CONFIG_DATA = 16'h2222;
      defparam ii0546.PLACE_LOCATION = "NONE";
      defparam ii0546.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0547 ( .DX(nn0547), .F0(\u_sdram_to_RGB_de_i_r_sclk__reg[1]|Q_net ), .F1(\u_sdram_to_RGB_emb_addr_rd__reg[0]|Q_net ), .F2(\u_sdram_to_RGB_emb_addr_rd__reg[1]|Q_net ), .F3(dummy_abc_108_) );
      defparam ii0547.CONFIG_DATA = 16'h2828;
      defparam ii0547.PLACE_LOCATION = "NONE";
      defparam ii0547.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0548 ( .DX(nn0548), .F0(\u_sdram_to_RGB_de_i_r_sclk__reg[1]|Q_net ), .F1(\u_sdram_to_RGB_emb_addr_rd__reg[0]|Q_net ), .F2(\u_sdram_to_RGB_emb_addr_rd__reg[1]|Q_net ), .F3(\u_sdram_to_RGB_emb_addr_rd__reg[2]|Q_net ) );
      defparam ii0548.CONFIG_DATA = 16'h2A80;
      defparam ii0548.PLACE_LOCATION = "NONE";
      defparam ii0548.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0549 ( .DX(nn0549), .F0(\u_sdram_to_RGB_emb_addr_rd__reg[0]|Q_net ), .F1(\u_sdram_to_RGB_emb_addr_rd__reg[1]|Q_net ), .F2(\u_sdram_to_RGB_emb_addr_rd__reg[2]|Q_net ), .F3(dummy_abc_109_) );
      defparam ii0549.CONFIG_DATA = 16'h8080;
      defparam ii0549.PLACE_LOCATION = "NONE";
      defparam ii0549.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0550 ( .DX(nn0550), .F0(\u_sdram_to_RGB_de_i_r_sclk__reg[1]|Q_net ), .F1(\u_sdram_to_RGB_emb_addr_rd__reg[3]|Q_net ), .F2(nn0549), .F3(dummy_abc_110_) );
      defparam ii0550.CONFIG_DATA = 16'h2828;
      defparam ii0550.PLACE_LOCATION = "NONE";
      defparam ii0550.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0551 ( .DX(nn0551), .F0(\u_sdram_to_RGB_emb_addr_rd__reg[3]|Q_net ), .F1(nn0549), .F2(dummy_abc_111_), .F3(dummy_abc_112_) );
      defparam ii0551.CONFIG_DATA = 16'h8888;
      defparam ii0551.PLACE_LOCATION = "NONE";
      defparam ii0551.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0552 ( .DX(nn0552), .F0(\u_sdram_to_RGB_de_i_r_sclk__reg[1]|Q_net ), .F1(\u_sdram_to_RGB_emb_addr_rd__reg[4]|Q_net ), .F2(nn0551), .F3(dummy_abc_113_) );
      defparam ii0552.CONFIG_DATA = 16'h2828;
      defparam ii0552.PLACE_LOCATION = "NONE";
      defparam ii0552.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0553 ( .DX(nn0553), .F0(\u_sdram_to_RGB_emb_addr_rd__reg[4]|Q_net ), .F1(nn0551), .F2(dummy_abc_114_), .F3(dummy_abc_115_) );
      defparam ii0553.CONFIG_DATA = 16'h8888;
      defparam ii0553.PLACE_LOCATION = "NONE";
      defparam ii0553.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0554 ( .DX(nn0554), .F0(\u_sdram_to_RGB_de_i_r_sclk__reg[1]|Q_net ), .F1(\u_sdram_to_RGB_emb_addr_rd__reg[5]|Q_net ), .F2(nn0553), .F3(dummy_abc_116_) );
      defparam ii0554.CONFIG_DATA = 16'h2828;
      defparam ii0554.PLACE_LOCATION = "NONE";
      defparam ii0554.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0555 ( .DX(nn0555), .F0(\u_sdram_to_RGB_de_i_r_sclk__reg[1]|Q_net ), .F1(\u_sdram_to_RGB_emb_addr_rd__reg[5]|Q_net ), .F2(\u_sdram_to_RGB_emb_addr_rd__reg[6]|Q_net ), .F3(nn0553) );
      defparam ii0555.CONFIG_DATA = 16'h28A0;
      defparam ii0555.PLACE_LOCATION = "NONE";
      defparam ii0555.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0556 ( .DX(nn0556), .F0(\u_sdram_to_RGB_emb_addr_rd__reg[4]|Q_net ), .F1(\u_sdram_to_RGB_emb_addr_rd__reg[5]|Q_net ), .F2(\u_sdram_to_RGB_emb_addr_rd__reg[6]|Q_net ), .F3(nn0551) );
      defparam ii0556.CONFIG_DATA = 16'h8000;
      defparam ii0556.PLACE_LOCATION = "NONE";
      defparam ii0556.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0557 ( .DX(nn0557), .F0(\u_sdram_to_RGB_de_i_r_sclk__reg[1]|Q_net ), .F1(\u_sdram_to_RGB_emb_addr_rd__reg[7]|Q_net ), .F2(nn0556), .F3(dummy_abc_117_) );
      defparam ii0557.CONFIG_DATA = 16'h2828;
      defparam ii0557.PLACE_LOCATION = "NONE";
      defparam ii0557.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0558 ( .DX(nn0558), .F0(\u_sdram_to_RGB_de_i_r_sclk__reg[1]|Q_net ), .F1(\u_sdram_to_RGB_emb_addr_rd__reg[7]|Q_net ), .F2(\u_sdram_to_RGB_emb_addr_rd__reg[8]|Q_net ), .F3(nn0556) );
      defparam ii0558.CONFIG_DATA = 16'h28A0;
      defparam ii0558.PLACE_LOCATION = "NONE";
      defparam ii0558.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0559 ( .DX(nn0559), .F0(\u_sdram_to_RGB_emb_addr_rd__reg[7]|Q_net ), .F1(\u_sdram_to_RGB_emb_addr_rd__reg[8]|Q_net ), .F2(nn0556), .F3(dummy_abc_118_) );
      defparam ii0559.CONFIG_DATA = 16'h8080;
      defparam ii0559.PLACE_LOCATION = "NONE";
      defparam ii0559.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0560 ( .DX(nn0560), .F0(\u_sdram_to_RGB_de_i_r_sclk__reg[1]|Q_net ), .F1(\u_sdram_to_RGB_emb_addr_rd__reg[9]|Q_net ), .F2(nn0559), .F3(dummy_abc_119_) );
      defparam ii0560.CONFIG_DATA = 16'h2828;
      defparam ii0560.PLACE_LOCATION = "NONE";
      defparam ii0560.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0561 ( .DX(nn0561), .F0(\u_sdram_to_RGB_emb_addr_wr__reg[0]|Q_net ), .F1(dummy_abc_120_), .F2(dummy_abc_121_), .F3(dummy_abc_122_) );
      defparam ii0561.CONFIG_DATA = 16'h5555;
      defparam ii0561.PLACE_LOCATION = "NONE";
      defparam ii0561.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0562 ( .DX(nn0562), .F0(\u_sdram_to_RGB_emb_addr_wr__reg[0]|Q_net ), .F1(\u_sdram_to_RGB_emb_addr_wr__reg[1]|Q_net ), .F2(dummy_abc_123_), .F3(dummy_abc_124_) );
      defparam ii0562.CONFIG_DATA = 16'h6666;
      defparam ii0562.PLACE_LOCATION = "NONE";
      defparam ii0562.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0563 ( .DX(nn0563), .F0(\u_sdram_to_RGB_emb_addr_wr__reg[0]|Q_net ), .F1(\u_sdram_to_RGB_emb_addr_wr__reg[1]|Q_net ), .F2(\u_sdram_to_RGB_emb_addr_wr__reg[2]|Q_net ), .F3(dummy_abc_125_) );
      defparam ii0563.CONFIG_DATA = 16'h7878;
      defparam ii0563.PLACE_LOCATION = "NONE";
      defparam ii0563.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0564 ( .DX(nn0564), .F0(\u_sdram_to_RGB_emb_addr_wr__reg[0]|Q_net ), .F1(\u_sdram_to_RGB_emb_addr_wr__reg[1]|Q_net ), .F2(\u_sdram_to_RGB_emb_addr_wr__reg[2]|Q_net ), .F3(\u_sdram_to_RGB_emb_addr_wr__reg[3]|Q_net ) );
      defparam ii0564.CONFIG_DATA = 16'h7F80;
      defparam ii0564.PLACE_LOCATION = "NONE";
      defparam ii0564.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0565 ( .DX(nn0565), .F0(\u_sdram_to_RGB_emb_addr_wr__reg[0]|Q_net ), .F1(\u_sdram_to_RGB_emb_addr_wr__reg[1]|Q_net ), .F2(\u_sdram_to_RGB_emb_addr_wr__reg[2]|Q_net ), .F3(\u_sdram_to_RGB_emb_addr_wr__reg[3]|Q_net ) );
      defparam ii0565.CONFIG_DATA = 16'h8000;
      defparam ii0565.PLACE_LOCATION = "NONE";
      defparam ii0565.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0566 ( .DX(nn0566), .F0(\u_sdram_to_RGB_emb_addr_wr__reg[4]|Q_net ), .F1(nn0565), .F2(dummy_abc_126_), .F3(dummy_abc_127_) );
      defparam ii0566.CONFIG_DATA = 16'h6666;
      defparam ii0566.PLACE_LOCATION = "NONE";
      defparam ii0566.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0567 ( .DX(nn0567), .F0(\u_sdram_to_RGB_emb_addr_wr__reg[4]|Q_net ), .F1(\u_sdram_to_RGB_emb_addr_wr__reg[5]|Q_net ), .F2(nn0565), .F3(dummy_abc_128_) );
      defparam ii0567.CONFIG_DATA = 16'h6C6C;
      defparam ii0567.PLACE_LOCATION = "NONE";
      defparam ii0567.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0568 ( .DX(nn0568), .F0(\u_sdram_to_RGB_emb_addr_wr__reg[4]|Q_net ), .F1(\u_sdram_to_RGB_emb_addr_wr__reg[5]|Q_net ), .F2(\u_sdram_to_RGB_emb_addr_wr__reg[6]|Q_net ), .F3(nn0565) );
      defparam ii0568.CONFIG_DATA = 16'h78F0;
      defparam ii0568.PLACE_LOCATION = "NONE";
      defparam ii0568.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0569 ( .DX(nn0569), .F0(\u_sdram_to_RGB_emb_addr_wr__reg[4]|Q_net ), .F1(\u_sdram_to_RGB_emb_addr_wr__reg[5]|Q_net ), .F2(\u_sdram_to_RGB_emb_addr_wr__reg[6]|Q_net ), .F3(nn0565) );
      defparam ii0569.CONFIG_DATA = 16'h8000;
      defparam ii0569.PLACE_LOCATION = "NONE";
      defparam ii0569.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0570 ( .DX(nn0570), .F0(\u_sdram_to_RGB_emb_addr_wr__reg[7]|Q_net ), .F1(nn0569), .F2(dummy_abc_129_), .F3(dummy_abc_130_) );
      defparam ii0570.CONFIG_DATA = 16'h6666;
      defparam ii0570.PLACE_LOCATION = "NONE";
      defparam ii0570.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0571 ( .DX(nn0571), .F0(\u_sdram_to_RGB_emb_addr_wr__reg[7]|Q_net ), .F1(\u_sdram_to_RGB_emb_addr_wr__reg[8]|Q_net ), .F2(nn0569), .F3(dummy_abc_131_) );
      defparam ii0571.CONFIG_DATA = 16'h6C6C;
      defparam ii0571.PLACE_LOCATION = "NONE";
      defparam ii0571.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0572 ( .DX(nn0572), .F0(\u_sdram_to_RGB_buffer_rd_sel_r__reg[1]|Q_net ), .F1(\u_sdram_to_RGB_emb_rdata_0_r__reg[0]|Q_net ), .F2(\u_sdram_to_RGB_emb_rdata_1_r__reg[0]|Q_net ), .F3(dummy_abc_132_) );
      defparam ii0572.CONFIG_DATA = 16'hD8D8;
      defparam ii0572.PLACE_LOCATION = "NONE";
      defparam ii0572.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0573 ( .DX(nn0573), .F0(\u_sdram_to_RGB_buffer_rd_sel_r__reg[1]|Q_net ), .F1(\u_sdram_to_RGB_emb_rdata_0_r__reg[10]|Q_net ), .F2(\u_sdram_to_RGB_emb_rdata_1_r__reg[10]|Q_net ), .F3(dummy_abc_133_) );
      defparam ii0573.CONFIG_DATA = 16'hD8D8;
      defparam ii0573.PLACE_LOCATION = "NONE";
      defparam ii0573.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0574 ( .DX(nn0574), .F0(\u_sdram_to_RGB_buffer_rd_sel_r__reg[1]|Q_net ), .F1(\u_sdram_to_RGB_emb_rdata_0_r__reg[11]|Q_net ), .F2(\u_sdram_to_RGB_emb_rdata_1_r__reg[11]|Q_net ), .F3(dummy_abc_134_) );
      defparam ii0574.CONFIG_DATA = 16'hD8D8;
      defparam ii0574.PLACE_LOCATION = "NONE";
      defparam ii0574.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0575 ( .DX(nn0575), .F0(\u_sdram_to_RGB_buffer_rd_sel_r__reg[1]|Q_net ), .F1(\u_sdram_to_RGB_emb_rdata_0_r__reg[12]|Q_net ), .F2(\u_sdram_to_RGB_emb_rdata_1_r__reg[12]|Q_net ), .F3(dummy_abc_135_) );
      defparam ii0575.CONFIG_DATA = 16'hD8D8;
      defparam ii0575.PLACE_LOCATION = "NONE";
      defparam ii0575.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0576 ( .DX(nn0576), .F0(\u_sdram_to_RGB_buffer_rd_sel_r__reg[1]|Q_net ), .F1(\u_sdram_to_RGB_emb_rdata_0_r__reg[13]|Q_net ), .F2(\u_sdram_to_RGB_emb_rdata_1_r__reg[13]|Q_net ), .F3(dummy_abc_136_) );
      defparam ii0576.CONFIG_DATA = 16'hD8D8;
      defparam ii0576.PLACE_LOCATION = "NONE";
      defparam ii0576.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0577 ( .DX(nn0577), .F0(\u_sdram_to_RGB_buffer_rd_sel_r__reg[1]|Q_net ), .F1(\u_sdram_to_RGB_emb_rdata_0_r__reg[14]|Q_net ), .F2(\u_sdram_to_RGB_emb_rdata_1_r__reg[14]|Q_net ), .F3(dummy_abc_137_) );
      defparam ii0577.CONFIG_DATA = 16'hD8D8;
      defparam ii0577.PLACE_LOCATION = "NONE";
      defparam ii0577.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0578 ( .DX(nn0578), .F0(\u_sdram_to_RGB_buffer_rd_sel_r__reg[1]|Q_net ), .F1(\u_sdram_to_RGB_emb_rdata_0_r__reg[15]|Q_net ), .F2(\u_sdram_to_RGB_emb_rdata_1_r__reg[15]|Q_net ), .F3(dummy_abc_138_) );
      defparam ii0578.CONFIG_DATA = 16'hD8D8;
      defparam ii0578.PLACE_LOCATION = "NONE";
      defparam ii0578.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0579 ( .DX(nn0579), .F0(\u_sdram_to_RGB_buffer_rd_sel_r__reg[1]|Q_net ), .F1(\u_sdram_to_RGB_emb_rdata_0_r__reg[1]|Q_net ), .F2(\u_sdram_to_RGB_emb_rdata_1_r__reg[1]|Q_net ), .F3(dummy_abc_139_) );
      defparam ii0579.CONFIG_DATA = 16'hD8D8;
      defparam ii0579.PLACE_LOCATION = "NONE";
      defparam ii0579.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0580 ( .DX(nn0580), .F0(\u_sdram_to_RGB_buffer_rd_sel_r__reg[1]|Q_net ), .F1(\u_sdram_to_RGB_emb_rdata_0_r__reg[2]|Q_net ), .F2(\u_sdram_to_RGB_emb_rdata_1_r__reg[2]|Q_net ), .F3(dummy_abc_140_) );
      defparam ii0580.CONFIG_DATA = 16'hD8D8;
      defparam ii0580.PLACE_LOCATION = "NONE";
      defparam ii0580.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0581 ( .DX(nn0581), .F0(\u_sdram_to_RGB_buffer_rd_sel_r__reg[1]|Q_net ), .F1(\u_sdram_to_RGB_emb_rdata_0_r__reg[3]|Q_net ), .F2(\u_sdram_to_RGB_emb_rdata_1_r__reg[3]|Q_net ), .F3(dummy_abc_141_) );
      defparam ii0581.CONFIG_DATA = 16'hD8D8;
      defparam ii0581.PLACE_LOCATION = "NONE";
      defparam ii0581.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0582 ( .DX(nn0582), .F0(\u_sdram_to_RGB_buffer_rd_sel_r__reg[1]|Q_net ), .F1(\u_sdram_to_RGB_emb_rdata_0_r__reg[4]|Q_net ), .F2(\u_sdram_to_RGB_emb_rdata_1_r__reg[4]|Q_net ), .F3(dummy_abc_142_) );
      defparam ii0582.CONFIG_DATA = 16'hD8D8;
      defparam ii0582.PLACE_LOCATION = "NONE";
      defparam ii0582.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0583 ( .DX(nn0583), .F0(\u_sdram_to_RGB_buffer_rd_sel_r__reg[1]|Q_net ), .F1(\u_sdram_to_RGB_emb_rdata_0_r__reg[5]|Q_net ), .F2(\u_sdram_to_RGB_emb_rdata_1_r__reg[5]|Q_net ), .F3(dummy_abc_143_) );
      defparam ii0583.CONFIG_DATA = 16'hD8D8;
      defparam ii0583.PLACE_LOCATION = "NONE";
      defparam ii0583.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0584 ( .DX(nn0584), .F0(\u_sdram_to_RGB_buffer_rd_sel_r__reg[1]|Q_net ), .F1(\u_sdram_to_RGB_emb_rdata_0_r__reg[6]|Q_net ), .F2(\u_sdram_to_RGB_emb_rdata_1_r__reg[6]|Q_net ), .F3(dummy_abc_144_) );
      defparam ii0584.CONFIG_DATA = 16'hD8D8;
      defparam ii0584.PLACE_LOCATION = "NONE";
      defparam ii0584.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0585 ( .DX(nn0585), .F0(\u_sdram_to_RGB_buffer_rd_sel_r__reg[1]|Q_net ), .F1(\u_sdram_to_RGB_emb_rdata_0_r__reg[7]|Q_net ), .F2(\u_sdram_to_RGB_emb_rdata_1_r__reg[7]|Q_net ), .F3(dummy_abc_145_) );
      defparam ii0585.CONFIG_DATA = 16'hD8D8;
      defparam ii0585.PLACE_LOCATION = "NONE";
      defparam ii0585.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0586 ( .DX(nn0586), .F0(\u_sdram_to_RGB_buffer_rd_sel_r__reg[1]|Q_net ), .F1(\u_sdram_to_RGB_emb_rdata_0_r__reg[8]|Q_net ), .F2(\u_sdram_to_RGB_emb_rdata_1_r__reg[8]|Q_net ), .F3(dummy_abc_146_) );
      defparam ii0586.CONFIG_DATA = 16'hD8D8;
      defparam ii0586.PLACE_LOCATION = "NONE";
      defparam ii0586.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0587 ( .DX(nn0587), .F0(\u_sdram_to_RGB_buffer_rd_sel_r__reg[1]|Q_net ), .F1(\u_sdram_to_RGB_emb_rdata_0_r__reg[9]|Q_net ), .F2(\u_sdram_to_RGB_emb_rdata_1_r__reg[9]|Q_net ), .F3(dummy_abc_147_) );
      defparam ii0587.CONFIG_DATA = 16'hD8D8;
      defparam ii0587.PLACE_LOCATION = "NONE";
      defparam ii0587.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0588 ( .DX(nn0588), .F0(\u_sdram_to_RGB_other_1_beat_valid__reg|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_ahm_xfer_done__reg|Q_net ), .F2(dummy_abc_148_), .F3(dummy_abc_149_) );
      defparam ii0588.CONFIG_DATA = 16'h8888;
      defparam ii0588.PLACE_LOCATION = "NONE";
      defparam ii0588.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0589 ( .DX(nn0589), .F0(\u_sdram_to_RGB_de_i_start_pulse__reg|Q_net ), .F1(\u_sdram_to_RGB_other_1_beat_valid__reg|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_ahm_xfer_done__reg|Q_net ), .F3(dummy_abc_150_) );
      defparam ii0589.CONFIG_DATA = 16'hAEAE;
      defparam ii0589.PLACE_LOCATION = "NONE";
      defparam ii0589.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0590 ( .DX(nn0590), .F0(buttonIn2), .F1(buttonIn3), .F2(\u_sdram_to_RGB_text__reg[7]|Q_net ), .F3(nn0533) );
      defparam ii0590.CONFIG_DATA = 16'hA2F0;
      defparam ii0590.PLACE_LOCATION = "NONE";
      defparam ii0590.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0591 ( .DX(nn0591), .F0(buttonIn2), .F1(buttonIn3), .F2(\u_sdram_to_RGB_text__reg[8]|Q_net ), .F3(nn0533) );
      defparam ii0591.CONFIG_DATA = 16'hD5F0;
      defparam ii0591.PLACE_LOCATION = "NONE";
      defparam ii0591.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0592 ( .DX(nn0592), .F0(buttonIn2), .F1(buttonIn3), .F2(\u_sdram_to_RGB_text__reg[9]|Q_net ), .F3(nn0533) );
      defparam ii0592.CONFIG_DATA = 16'hA2F0;
      defparam ii0592.PLACE_LOCATION = "NONE";
      defparam ii0592.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0593 ( .DX(nn0593), .F0(fp0_m_ahb_ready_u_arm_u_soc), .F1(\u_sdram_to_RGB_u_ahb_master_ahb_cs__reg[0]|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_ahb_cs__reg[1]|Q_net ), .F3(\u_sdram_to_RGB_u_ahb_master_ahb_cs__reg[2]|Q_net ) );
      defparam ii0593.CONFIG_DATA = 16'h0008;
      defparam ii0593.PLACE_LOCATION = "NONE";
      defparam ii0593.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0594 ( .DX(nn0594), .F0(\u_sdram_to_RGB_u_ahb_master_mx_addr__reg[6]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_mx_addr__reg[7]|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_mx_addr__reg[8]|Q_net ), .F3(\u_sdram_to_RGB_u_ahb_master_mx_addr__reg[9]|Q_net ) );
      defparam ii0594.CONFIG_DATA = 16'h8000;
      defparam ii0594.PLACE_LOCATION = "NONE";
      defparam ii0594.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0595 ( .DX(nn0595), .F0(\u_sdram_to_RGB_u_ahb_master_mx_addr__reg[2]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_mx_addr__reg[3]|Q_net ), .F2(dummy_abc_151_), .F3(dummy_abc_152_) );
      defparam ii0595.CONFIG_DATA = 16'h1111;
      defparam ii0595.PLACE_LOCATION = "NONE";
      defparam ii0595.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0596 ( .DX(nn0596), .F0(\u_sdram_to_RGB_u_ahb_master_mx_addr__reg[4]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_mx_addr__reg[5]|Q_net ), .F2(nn0594), .F3(nn0595) );
      defparam ii0596.CONFIG_DATA = 16'h0080;
      defparam ii0596.PLACE_LOCATION = "NONE";
      defparam ii0596.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0597 ( .DX(nn0597), .F0(\u_sdram_to_RGB_u_ahb_master_xfer_count__reg[4]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_xfer_count__reg[5]|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_xfer_count__reg[6]|Q_net ), .F3(\u_sdram_to_RGB_u_ahb_master_xfer_count__reg[7]|Q_net ) );
      defparam ii0597.CONFIG_DATA = 16'h0001;
      defparam ii0597.PLACE_LOCATION = "NONE";
      defparam ii0597.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0598 ( .DX(nn0598), .F0(\u_sdram_to_RGB_u_ahb_master_xfer_count__reg[0]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_xfer_count__reg[1]|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_xfer_count__reg[3]|Q_net ), .F3(nn0597) );
      defparam ii0598.CONFIG_DATA = 16'h0700;
      defparam ii0598.PLACE_LOCATION = "NONE";
      defparam ii0598.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0599 ( .DX(nn0599), .F0(\u_sdram_to_RGB_u_ahb_master_xfer_count__reg[2]|Q_net ), .F1(nn0596), .F2(nn0598), .F3(nn0593) );
      defparam ii0599.CONFIG_DATA = 16'hDC00;
      defparam ii0599.PLACE_LOCATION = "NONE";
      defparam ii0599.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0600 ( .DX(nn0600), .F0(\u_sdram_to_RGB_u_ahb_master_addr_count__reg[0]|Q_net ), .F1(nn0593), .F2(nn0599), .F3(dummy_abc_153_) );
      defparam ii0600.CONFIG_DATA = 16'hF1F1;
      defparam ii0600.PLACE_LOCATION = "NONE";
      defparam ii0600.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0601 ( .DX(nn0601), .F0(fp0_m_ahb_ready_u_arm_u_soc), .F1(\u_sdram_to_RGB_u_ahb_master_ahb_cs__reg[1]|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_ahb_cs__reg[2]|Q_net ), .F3(dummy_abc_154_) );
      defparam ii0601.CONFIG_DATA = 16'h0808;
      defparam ii0601.PLACE_LOCATION = "NONE";
      defparam ii0601.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0602 ( .DX(nn0602), .F0(fp0_m_ahb_resp_u_arm_u_soc), .F1(\u_sdram_to_RGB_u_ahb_master_ahb_cs__reg[0]|Q_net ), .F2(dummy_abc_155_), .F3(dummy_abc_156_) );
      defparam ii0602.CONFIG_DATA = 16'h8888;
      defparam ii0602.PLACE_LOCATION = "NONE";
      defparam ii0602.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0603 ( .DX(nn0603), .F0(nn0593), .F1(nn0601), .F2(nn0602), .F3(dummy_abc_157_) );
      defparam ii0603.CONFIG_DATA = 16'hAEAE;
      defparam ii0603.PLACE_LOCATION = "NONE";
      defparam ii0603.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0604 ( .DX(nn0604), .F0(\u_sdram_to_RGB_u_ahb_master_addr_count__reg[0]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_addr_count__reg[1]|Q_net ), .F2(nn0593), .F3(dummy_abc_158_) );
      defparam ii0604.CONFIG_DATA = 16'h0909;
      defparam ii0604.PLACE_LOCATION = "NONE";
      defparam ii0604.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0605 ( .DX(nn0605), .F0(\u_sdram_to_RGB_u_ahb_master_xfer_count__reg[2]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_xfer_count__reg[3]|Q_net ), .F2(dummy_abc_159_), .F3(dummy_abc_160_) );
      defparam ii0605.CONFIG_DATA = 16'h1111;
      defparam ii0605.PLACE_LOCATION = "NONE";
      defparam ii0605.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0606 ( .DX(nn0606), .F0(nn0597), .F1(nn0605), .F2(dummy_abc_161_), .F3(dummy_abc_162_) );
      defparam ii0606.CONFIG_DATA = 16'h8888;
      defparam ii0606.PLACE_LOCATION = "NONE";
      defparam ii0606.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0607 ( .DX(nn0607), .F0(\u_sdram_to_RGB_u_ahb_master_mx_addr__reg[4]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_mx_addr__reg[5]|Q_net ), .F2(nn0594), .F3(nn0595) );
      defparam ii0607.CONFIG_DATA = 16'h80C0;
      defparam ii0607.PLACE_LOCATION = "NONE";
      defparam ii0607.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0608 ( .DX(nn0608), .F0(nn0606), .F1(nn0607), .F2(nn0598), .F3(nn0593) );
      defparam ii0608.CONFIG_DATA = 16'h0100;
      defparam ii0608.PLACE_LOCATION = "NONE";
      defparam ii0608.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0609 ( .DX(nn0609), .F0(\u_sdram_to_RGB_u_ahb_master_addr_count__reg[0]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_addr_count__reg[1]|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_addr_count__reg[2]|Q_net ), .F3(dummy_abc_163_) );
      defparam ii0609.CONFIG_DATA = 16'h1E1E;
      defparam ii0609.PLACE_LOCATION = "NONE";
      defparam ii0609.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0610 ( .DX(nn0610), .F0(nn0593), .F1(nn0599), .F2(nn0608), .F3(nn0609) );
      defparam ii0610.CONFIG_DATA = 16'h0203;
      defparam ii0610.PLACE_LOCATION = "NONE";
      defparam ii0610.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0611 ( .DX(nn0611), .F0(\u_sdram_to_RGB_u_ahb_master_xfer_count__reg[0]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_xfer_count__reg[1]|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_xfer_count__reg[2]|Q_net ), .F3(\u_sdram_to_RGB_u_ahb_master_xfer_count__reg[3]|Q_net ) );
      defparam ii0611.CONFIG_DATA = 16'h8000;
      defparam ii0611.PLACE_LOCATION = "NONE";
      defparam ii0611.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0612 ( .DX(nn0612), .F0(\u_sdram_to_RGB_u_ahb_master_mx_addr__reg[2]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_mx_addr__reg[3]|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_mx_addr__reg[4]|Q_net ), .F3(\u_sdram_to_RGB_u_ahb_master_mx_addr__reg[5]|Q_net ) );
      defparam ii0612.CONFIG_DATA = 16'h0001;
      defparam ii0612.PLACE_LOCATION = "NONE";
      defparam ii0612.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0613 ( .DX(nn0613), .F0(nn0594), .F1(nn0597), .F2(nn0611), .F3(nn0612) );
      defparam ii0613.CONFIG_DATA = 16'hF351;
      defparam ii0613.PLACE_LOCATION = "NONE";
      defparam ii0613.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0614 ( .DX(nn0614), .F0(\u_sdram_to_RGB_u_ahb_master_addr_count__reg[0]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_addr_count__reg[1]|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_addr_count__reg[2]|Q_net ), .F3(\u_sdram_to_RGB_u_ahb_master_addr_count__reg[3]|Q_net ) );
      defparam ii0614.CONFIG_DATA = 16'h01FE;
      defparam ii0614.PLACE_LOCATION = "NONE";
      defparam ii0614.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0615 ( .DX(nn0615), .F0(nn0613), .F1(nn0593), .F2(nn0608), .F3(nn0614) );
      defparam ii0615.CONFIG_DATA = 16'h5073;
      defparam ii0615.PLACE_LOCATION = "NONE";
      defparam ii0615.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0616 ( .DX(nn0616), .F0(\u_sdram_to_RGB_u_ahb_master_addr_count__reg[0]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_addr_count__reg[1]|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_addr_count__reg[2]|Q_net ), .F3(\u_sdram_to_RGB_u_ahb_master_addr_count__reg[3]|Q_net ) );
      defparam ii0616.CONFIG_DATA = 16'h0001;
      defparam ii0616.PLACE_LOCATION = "NONE";
      defparam ii0616.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0617 ( .DX(nn0617), .F0(\u_sdram_to_RGB_u_ahb_master_addr_count__reg[4]|Q_net ), .F1(nn0613), .F2(nn0593), .F3(nn0616) );
      defparam ii0617.CONFIG_DATA = 16'hC5CA;
      defparam ii0617.PLACE_LOCATION = "NONE";
      defparam ii0617.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0618 ( .DX(nn0618), .F0(\u_sdram_to_RGB_u_ahb_master_addr_count__reg[4]|Q_net ), .F1(nn0616), .F2(dummy_abc_164_), .F3(dummy_abc_165_) );
      defparam ii0618.CONFIG_DATA = 16'h4444;
      defparam ii0618.PLACE_LOCATION = "NONE";
      defparam ii0618.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0619 ( .DX(nn0619), .F0(\u_sdram_to_RGB_u_ahb_master_addr_count__reg[5]|Q_net ), .F1(nn0593), .F2(nn0618), .F3(dummy_abc_166_) );
      defparam ii0619.CONFIG_DATA = 16'h1212;
      defparam ii0619.PLACE_LOCATION = "NONE";
      defparam ii0619.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0620 ( .DX(nn0620), .F0(\u_sdram_to_RGB_u_ahb_master_addr_count__reg[5]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_addr_count__reg[6]|Q_net ), .F2(nn0593), .F3(nn0618) );
      defparam ii0620.CONFIG_DATA = 16'h090C;
      defparam ii0620.PLACE_LOCATION = "NONE";
      defparam ii0620.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0621 ( .DX(nn0621), .F0(\u_sdram_to_RGB_u_ahb_master_addr_count__reg[5]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_addr_count__reg[6]|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_addr_count__reg[7]|Q_net ), .F3(nn0618) );
      defparam ii0621.CONFIG_DATA = 16'h1E0F;
      defparam ii0621.PLACE_LOCATION = "NONE";
      defparam ii0621.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0622 ( .DX(nn0622), .F0(nn0593), .F1(nn0621), .F2(dummy_abc_167_), .F3(dummy_abc_168_) );
      defparam ii0622.CONFIG_DATA = 16'h1111;
      defparam ii0622.PLACE_LOCATION = "NONE";
      defparam ii0622.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0623 ( .DX(nn0623), .F0(\u_sdram_to_RGB_u_ahb_master_xfer_count__reg[2]|Q_net ), .F1(nn0606), .F2(nn0607), .F3(nn0598) );
      defparam ii0623.CONFIG_DATA = 16'hDCDE;
      defparam ii0623.PLACE_LOCATION = "NONE";
      defparam ii0623.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0624 ( .DX(nn0624), .F0(\u_sdram_to_RGB_u_ahb_master_xfer_count__reg[3]|Q_net ), .F1(nn0597), .F2(nn0623), .F3(nn0613) );
      defparam ii0624.CONFIG_DATA = 16'hC040;
      defparam ii0624.PLACE_LOCATION = "NONE";
      defparam ii0624.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0625 ( .DX(nn0625), .F0(\u_sdram_to_RGB_u_ahb_master_xfer_count__reg[0]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_xfer_count__reg[1]|Q_net ), .F2(nn0596), .F3(nn0606) );
      defparam ii0625.CONFIG_DATA = 16'h5D5A;
      defparam ii0625.PLACE_LOCATION = "NONE";
      defparam ii0625.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0626 ( .DX(nn0626), .F0(\u_sdram_to_RGB_u_ahb_master_xfer_count__reg[0]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_xfer_count__reg[1]|Q_net ), .F2(nn0596), .F3(nn0606) );
      defparam ii0626.CONFIG_DATA = 16'h3B3C;
      defparam ii0626.PLACE_LOCATION = "NONE";
      defparam ii0626.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0627 ( .DX(nn0627), .F0(\u_sdram_to_RGB_u_ahb_master_xfer_count__reg[3]|Q_net ), .F1(nn0625), .F2(nn0626), .F3(dummy_abc_169_) );
      defparam ii0627.CONFIG_DATA = 16'hE0E0;
      defparam ii0627.PLACE_LOCATION = "NONE";
      defparam ii0627.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0628 ( .DX(nn0628), .F0(\u_sdram_to_RGB_u_ahb_master_ahb_cs__reg[1]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_ahb_cs__reg[2]|Q_net ), .F2(dummy_abc_170_), .F3(dummy_abc_171_) );
      defparam ii0628.CONFIG_DATA = 16'h4444;
      defparam ii0628.PLACE_LOCATION = "NONE";
      defparam ii0628.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0629 ( .DX(nn0629), .F0(fp0_m_ahb_ready_u_arm_u_soc), .F1(\u_sdram_to_RGB_u_ahb_master_ahb_cs__reg[0]|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_dma_eof_get__reg|Q_net ), .F3(nn0628) );
      defparam ii0629.CONFIG_DATA = 16'h0200;
      defparam ii0629.PLACE_LOCATION = "NONE";
      defparam ii0629.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0630 ( .DX(nn0630), .F0(\u_sdram_to_RGB_u_ahb_master_xfer_count__reg[0]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_xfer_count__reg[1]|Q_net ), .F2(nn0597), .F3(nn0605) );
      defparam ii0630.CONFIG_DATA = 16'h1000;
      defparam ii0630.PLACE_LOCATION = "NONE";
      defparam ii0630.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0631 ( .DX(nn0631), .F0(\u_sdram_to_RGB_u_ahb_master_dma_cs__reg[0]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_dma_cs__reg[1]|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_dma_eof_get__reg|Q_net ), .F3(nn0630) );
      defparam ii0631.CONFIG_DATA = 16'hCCC8;
      defparam ii0631.PLACE_LOCATION = "NONE";
      defparam ii0631.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0632 ( .DX(nn0632), .F0(\u_sdram_to_RGB_dma_start_xfer__reg|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_dma_cs__reg[0]|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_dma_cs__reg[1]|Q_net ), .F3(dummy_abc_172_) );
      defparam ii0632.CONFIG_DATA = 16'h3232;
      defparam ii0632.PLACE_LOCATION = "NONE";
      defparam ii0632.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0633 ( .DX(nn0633), .F0(\u_sdram_to_RGB_u_ahb_master_ahb_cs__reg[0]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_ahb_cs__reg[1]|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_ahb_cs__reg[2]|Q_net ), .F3(nn0632) );
      defparam ii0633.CONFIG_DATA = 16'h0100;
      defparam ii0633.PLACE_LOCATION = "NONE";
      defparam ii0633.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0634 ( .DX(nn0634), .F0(fp0_m_ahb_resp_u_arm_u_soc), .F1(\u_sdram_to_RGB_u_ahb_master_ahb_cs__reg[0]|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_ahb_cs__reg[1]|Q_net ), .F3(\u_sdram_to_RGB_u_ahb_master_ahb_cs__reg[2]|Q_net ) );
      defparam ii0634.CONFIG_DATA = 16'h0280;
      defparam ii0634.PLACE_LOCATION = "NONE";
      defparam ii0634.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0635 ( .DX(nn0635), .F0(\u_sdram_to_RGB_u_ahb_master_addr_count__reg[3]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_addr_count__reg[4]|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_addr_count__reg[5]|Q_net ), .F3(\u_sdram_to_RGB_u_ahb_master_addr_count__reg[6]|Q_net ) );
      defparam ii0635.CONFIG_DATA = 16'h0001;
      defparam ii0635.PLACE_LOCATION = "NONE";
      defparam ii0635.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0636 ( .DX(nn0636), .F0(\u_sdram_to_RGB_u_ahb_master_addr_count__reg[0]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_addr_count__reg[1]|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_addr_count__reg[2]|Q_net ), .F3(\u_sdram_to_RGB_u_ahb_master_addr_count__reg[7]|Q_net ) );
      defparam ii0636.CONFIG_DATA = 16'h0002;
      defparam ii0636.PLACE_LOCATION = "NONE";
      defparam ii0636.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0637 ( .DX(nn0637), .F0(fp0_m_ahb_ready_u_arm_u_soc), .F1(\u_sdram_to_RGB_u_ahb_master_ahb_cs__reg[0]|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_ahb_cs__reg[1]|Q_net ), .F3(\u_sdram_to_RGB_u_ahb_master_ahb_cs__reg[2]|Q_net ) );
      defparam ii0637.CONFIG_DATA = 16'h0444;
      defparam ii0637.PLACE_LOCATION = "NONE";
      defparam ii0637.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0638 ( .DX(nn0638), .F0(nn0601), .F1(nn0635), .F2(nn0636), .F3(nn0637) );
      defparam ii0638.CONFIG_DATA = 16'h00D5;
      defparam ii0638.PLACE_LOCATION = "NONE";
      defparam ii0638.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0639 ( .DX(nn0639), .F0(nn0631), .F1(nn0633), .F2(nn0634), .F3(nn0638) );
      defparam ii0639.CONFIG_DATA = 16'h0B00;
      defparam ii0639.PLACE_LOCATION = "NONE";
      defparam ii0639.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0640 ( .DX(nn0640), .F0(nn0624), .F1(nn0627), .F2(nn0629), .F3(nn0639) );
      defparam ii0640.CONFIG_DATA = 16'h70FF;
      defparam ii0640.PLACE_LOCATION = "NONE";
      defparam ii0640.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0641 ( .DX(nn0641), .F0(fp0_m_ahb_ready_u_arm_u_soc), .F1(nn0602), .F2(nn0635), .F3(nn0636) );
      defparam ii0641.CONFIG_DATA = 16'h1333;
      defparam ii0641.PLACE_LOCATION = "NONE";
      defparam ii0641.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0642 ( .DX(nn0642), .F0(\u_sdram_to_RGB_u_ahb_master_ahb_cs__reg[1]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_ahb_cs__reg[2]|Q_net ), .F2(nn0593), .F3(nn0641) );
      defparam ii0642.CONFIG_DATA = 16'hF2F0;
      defparam ii0642.PLACE_LOCATION = "NONE";
      defparam ii0642.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0643 ( .DX(nn0643), .F0(fp0_m_ahb_ready_u_arm_u_soc), .F1(fp0_m_ahb_resp_u_arm_u_soc), .F2(\u_sdram_to_RGB_u_ahb_master_ahb_cs__reg[0]|Q_net ), .F3(dummy_abc_173_) );
      defparam ii0643.CONFIG_DATA = 16'h5D5D;
      defparam ii0643.PLACE_LOCATION = "NONE";
      defparam ii0643.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0644 ( .DX(nn0644), .F0(\u_sdram_to_RGB_u_ahb_master_ahb_cs__reg[1]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_ahb_cs__reg[2]|Q_net ), .F2(nn0641), .F3(nn0643) );
      defparam ii0644.CONFIG_DATA = 16'h4602;
      defparam ii0644.PLACE_LOCATION = "NONE";
      defparam ii0644.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0645 ( .DX(nn0645), .F0(fp0_m_ahb_ready_u_arm_u_soc), .F1(fp0_m_ahb_resp_u_arm_u_soc), .F2(dummy_abc_174_), .F3(dummy_abc_175_) );
      defparam ii0645.CONFIG_DATA = 16'h2222;
      defparam ii0645.PLACE_LOCATION = "NONE";
      defparam ii0645.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0646 ( .DX(nn0646), .F0(\u_sdram_to_RGB_u_ahb_master_ahb_cs__reg[0]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_ahb_cs__reg[1]|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_ahb_cs__reg[2]|Q_net ), .F3(nn0645) );
      defparam ii0646.CONFIG_DATA = 16'h1800;
      defparam ii0646.PLACE_LOCATION = "NONE";
      defparam ii0646.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0647 ( .DX(nn0647), .F0(\u_sdram_to_RGB_u_ahb_master_ahb_cs__reg[0]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_ahb_cs__reg[1]|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_ahb_cs__reg[2]|Q_net ), .F3(\u_sdram_to_RGB_u_ahb_master_mx_done_r__reg|Q_net ) );
      defparam ii0647.CONFIG_DATA = 16'h0100;
      defparam ii0647.PLACE_LOCATION = "NONE";
      defparam ii0647.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0648 ( .DX(nn0648), .F0(nn0628), .F1(nn0643), .F2(dummy_abc_176_), .F3(dummy_abc_177_) );
      defparam ii0648.CONFIG_DATA = 16'h2222;
      defparam ii0648.PLACE_LOCATION = "NONE";
      defparam ii0648.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0649 ( .DX(nn0649), .F0(\u_sdram_to_RGB_u_ahb_master_dma_cs__reg[0]|Q_net ), .F1(nn0631), .F2(nn0632), .F3(nn0648) );
      defparam ii0649.CONFIG_DATA = 16'h3032;
      defparam ii0649.PLACE_LOCATION = "NONE";
      defparam ii0649.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0650 ( .DX(nn0650), .F0(\u_sdram_to_RGB_u_ahb_master_ahb_cs__reg[0]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_dma_cs__reg[0]|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_dma_cs__reg[1]|Q_net ), .F3(nn0648) );
      defparam ii0650.CONFIG_DATA = 16'h0400;
      defparam ii0650.PLACE_LOCATION = "NONE";
      defparam ii0650.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0651 ( .DX(nn0651), .F0(\u_sdram_to_RGB_u_ahb_master_dma_cs__reg[0]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_dma_cs__reg[1]|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_dma_eof_get__reg|Q_net ), .F3(dummy_abc_178_) );
      defparam ii0651.CONFIG_DATA = 16'hE0E0;
      defparam ii0651.PLACE_LOCATION = "NONE";
      defparam ii0651.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0652 ( .DX(nn0652), .F0(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[0]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_mx_addr__reg[10]|Q_net ), .F2(nn0593), .F3(dummy_abc_179_) );
      defparam ii0652.CONFIG_DATA = 16'hC5C5;
      defparam ii0652.PLACE_LOCATION = "NONE";
      defparam ii0652.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0653 ( .DX(nn0653), .F0(\u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[0]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[1]|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[2]|Q_net ), .F3(\u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[3]|Q_net ) );
      defparam ii0653.CONFIG_DATA = 16'h8000;
      defparam ii0653.PLACE_LOCATION = "NONE";
      defparam ii0653.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0654 ( .DX(nn0654), .F0(\u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[4]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[5]|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[6]|Q_net ), .F3(nn0653) );
      defparam ii0654.CONFIG_DATA = 16'h8000;
      defparam ii0654.PLACE_LOCATION = "NONE";
      defparam ii0654.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0655 ( .DX(nn0655), .F0(\u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[7]|Q_net ), .F1(nn0593), .F2(nn0603), .F3(nn0654) );
      defparam ii0655.CONFIG_DATA = 16'hE0C0;
      defparam ii0655.PLACE_LOCATION = "NONE";
      defparam ii0655.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0656 ( .DX(nn0656), .F0(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[0]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[1]|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[2]|Q_net ), .F3(dummy_abc_180_) );
      defparam ii0656.CONFIG_DATA = 16'h8080;
      defparam ii0656.PLACE_LOCATION = "NONE";
      defparam ii0656.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0657 ( .DX(nn0657), .F0(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[3]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[4]|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[5]|Q_net ), .F3(dummy_abc_181_) );
      defparam ii0657.CONFIG_DATA = 16'h8080;
      defparam ii0657.PLACE_LOCATION = "NONE";
      defparam ii0657.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0658 ( .DX(nn0658), .F0(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[6]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[7]|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[8]|Q_net ), .F3(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[9]|Q_net ) );
      defparam ii0658.CONFIG_DATA = 16'h8000;
      defparam ii0658.PLACE_LOCATION = "NONE";
      defparam ii0658.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0659 ( .DX(nn0659), .F0(nn0656), .F1(nn0657), .F2(nn0658), .F3(dummy_abc_182_) );
      defparam ii0659.CONFIG_DATA = 16'h8080;
      defparam ii0659.PLACE_LOCATION = "NONE";
      defparam ii0659.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0660 ( .DX(nn0660), .F0(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[10]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_mx_addr__reg[20]|Q_net ), .F2(nn0593), .F3(nn0659) );
      defparam ii0660.CONFIG_DATA = 16'hC5CA;
      defparam ii0660.PLACE_LOCATION = "NONE";
      defparam ii0660.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0661 ( .DX(nn0661), .F0(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[10]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[11]|Q_net ), .F2(nn0659), .F3(dummy_abc_183_) );
      defparam ii0661.CONFIG_DATA = 16'h6C6C;
      defparam ii0661.PLACE_LOCATION = "NONE";
      defparam ii0661.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0662 ( .DX(nn0662), .F0(\u_sdram_to_RGB_u_ahb_master_mx_addr__reg[21]|Q_net ), .F1(nn0593), .F2(nn0661), .F3(dummy_abc_184_) );
      defparam ii0662.CONFIG_DATA = 16'hB8B8;
      defparam ii0662.PLACE_LOCATION = "NONE";
      defparam ii0662.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0663 ( .DX(nn0663), .F0(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[10]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[11]|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[12]|Q_net ), .F3(nn0659) );
      defparam ii0663.CONFIG_DATA = 16'h78F0;
      defparam ii0663.PLACE_LOCATION = "NONE";
      defparam ii0663.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0664 ( .DX(nn0664), .F0(\u_sdram_to_RGB_u_ahb_master_mx_addr__reg[22]|Q_net ), .F1(nn0593), .F2(nn0663), .F3(dummy_abc_185_) );
      defparam ii0664.CONFIG_DATA = 16'hB8B8;
      defparam ii0664.PLACE_LOCATION = "NONE";
      defparam ii0664.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0665 ( .DX(nn0665), .F0(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[10]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[11]|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[12]|Q_net ), .F3(nn0659) );
      defparam ii0665.CONFIG_DATA = 16'h8000;
      defparam ii0665.PLACE_LOCATION = "NONE";
      defparam ii0665.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0666 ( .DX(nn0666), .F0(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[13]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_mx_addr__reg[23]|Q_net ), .F2(nn0593), .F3(nn0665) );
      defparam ii0666.CONFIG_DATA = 16'hC5CA;
      defparam ii0666.PLACE_LOCATION = "NONE";
      defparam ii0666.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0667 ( .DX(nn0667), .F0(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[10]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[11]|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[12]|Q_net ), .F3(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[13]|Q_net ) );
      defparam ii0667.CONFIG_DATA = 16'h8000;
      defparam ii0667.PLACE_LOCATION = "NONE";
      defparam ii0667.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0668 ( .DX(nn0668), .F0(nn0656), .F1(nn0657), .F2(nn0658), .F3(nn0667) );
      defparam ii0668.CONFIG_DATA = 16'h8000;
      defparam ii0668.PLACE_LOCATION = "NONE";
      defparam ii0668.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0669 ( .DX(nn0669), .F0(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[14]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_mx_addr__reg[24]|Q_net ), .F2(nn0593), .F3(nn0668) );
      defparam ii0669.CONFIG_DATA = 16'hC5CA;
      defparam ii0669.PLACE_LOCATION = "NONE";
      defparam ii0669.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0670 ( .DX(nn0670), .F0(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[14]|Q_net ), .F1(nn0668), .F2(dummy_abc_186_), .F3(dummy_abc_187_) );
      defparam ii0670.CONFIG_DATA = 16'h8888;
      defparam ii0670.PLACE_LOCATION = "NONE";
      defparam ii0670.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0671 ( .DX(nn0671), .F0(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[15]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_mx_addr__reg[25]|Q_net ), .F2(nn0593), .F3(nn0670) );
      defparam ii0671.CONFIG_DATA = 16'hC5CA;
      defparam ii0671.PLACE_LOCATION = "NONE";
      defparam ii0671.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0672 ( .DX(nn0672), .F0(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[15]|Q_net ), .F1(nn0670), .F2(dummy_abc_188_), .F3(dummy_abc_189_) );
      defparam ii0672.CONFIG_DATA = 16'h8888;
      defparam ii0672.PLACE_LOCATION = "NONE";
      defparam ii0672.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0673 ( .DX(nn0673), .F0(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[16]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_mx_addr__reg[26]|Q_net ), .F2(nn0593), .F3(nn0672) );
      defparam ii0673.CONFIG_DATA = 16'hC5CA;
      defparam ii0673.PLACE_LOCATION = "NONE";
      defparam ii0673.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0674 ( .DX(nn0674), .F0(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[14]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[15]|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[16]|Q_net ), .F3(nn0668) );
      defparam ii0674.CONFIG_DATA = 16'h8000;
      defparam ii0674.PLACE_LOCATION = "NONE";
      defparam ii0674.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0675 ( .DX(nn0675), .F0(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[17]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_mx_addr__reg[27]|Q_net ), .F2(nn0593), .F3(nn0674) );
      defparam ii0675.CONFIG_DATA = 16'hC5CA;
      defparam ii0675.PLACE_LOCATION = "NONE";
      defparam ii0675.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0676 ( .DX(nn0676), .F0(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[17]|Q_net ), .F1(nn0674), .F2(dummy_abc_190_), .F3(dummy_abc_191_) );
      defparam ii0676.CONFIG_DATA = 16'h8888;
      defparam ii0676.PLACE_LOCATION = "NONE";
      defparam ii0676.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0677 ( .DX(nn0677), .F0(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[18]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_mx_addr__reg[28]|Q_net ), .F2(nn0593), .F3(nn0676) );
      defparam ii0677.CONFIG_DATA = 16'hC5CA;
      defparam ii0677.PLACE_LOCATION = "NONE";
      defparam ii0677.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0678 ( .DX(nn0678), .F0(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[17]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[18]|Q_net ), .F2(nn0674), .F3(dummy_abc_192_) );
      defparam ii0678.CONFIG_DATA = 16'h8080;
      defparam ii0678.PLACE_LOCATION = "NONE";
      defparam ii0678.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0679 ( .DX(nn0679), .F0(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[19]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_mx_addr__reg[29]|Q_net ), .F2(nn0593), .F3(nn0678) );
      defparam ii0679.CONFIG_DATA = 16'hC5CA;
      defparam ii0679.PLACE_LOCATION = "NONE";
      defparam ii0679.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0680 ( .DX(nn0680), .F0(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[0]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[1]|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_mx_addr__reg[11]|Q_net ), .F3(nn0593) );
      defparam ii0680.CONFIG_DATA = 16'hF066;
      defparam ii0680.PLACE_LOCATION = "NONE";
      defparam ii0680.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0681 ( .DX(nn0681), .F0(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[17]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[18]|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[19]|Q_net ), .F3(nn0674) );
      defparam ii0681.CONFIG_DATA = 16'h8000;
      defparam ii0681.PLACE_LOCATION = "NONE";
      defparam ii0681.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0682 ( .DX(nn0682), .F0(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[20]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_mx_addr__reg[30]|Q_net ), .F2(nn0593), .F3(nn0681) );
      defparam ii0682.CONFIG_DATA = 16'hC5CA;
      defparam ii0682.PLACE_LOCATION = "NONE";
      defparam ii0682.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0683 ( .DX(nn0683), .F0(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[17]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[20]|Q_net ), .F2(dummy_abc_193_), .F3(dummy_abc_194_) );
      defparam ii0683.CONFIG_DATA = 16'h8888;
      defparam ii0683.PLACE_LOCATION = "NONE";
      defparam ii0683.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0684 ( .DX(nn0684), .F0(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[18]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[19]|Q_net ), .F2(nn0674), .F3(nn0683) );
      defparam ii0684.CONFIG_DATA = 16'h8000;
      defparam ii0684.PLACE_LOCATION = "NONE";
      defparam ii0684.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0685 ( .DX(nn0685), .F0(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[21]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_mx_addr__reg[31]|Q_net ), .F2(nn0593), .F3(nn0684) );
      defparam ii0685.CONFIG_DATA = 16'hC5CA;
      defparam ii0685.PLACE_LOCATION = "NONE";
      defparam ii0685.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0686 ( .DX(nn0686), .F0(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[0]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[1]|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[2]|Q_net ), .F3(dummy_abc_195_) );
      defparam ii0686.CONFIG_DATA = 16'h7878;
      defparam ii0686.PLACE_LOCATION = "NONE";
      defparam ii0686.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0687 ( .DX(nn0687), .F0(\u_sdram_to_RGB_u_ahb_master_mx_addr__reg[12]|Q_net ), .F1(nn0593), .F2(nn0686), .F3(dummy_abc_196_) );
      defparam ii0687.CONFIG_DATA = 16'hB8B8;
      defparam ii0687.PLACE_LOCATION = "NONE";
      defparam ii0687.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0688 ( .DX(nn0688), .F0(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[3]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_mx_addr__reg[13]|Q_net ), .F2(nn0593), .F3(nn0656) );
      defparam ii0688.CONFIG_DATA = 16'hC5CA;
      defparam ii0688.PLACE_LOCATION = "NONE";
      defparam ii0688.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0689 ( .DX(nn0689), .F0(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[3]|Q_net ), .F1(nn0656), .F2(dummy_abc_197_), .F3(dummy_abc_198_) );
      defparam ii0689.CONFIG_DATA = 16'h8888;
      defparam ii0689.PLACE_LOCATION = "NONE";
      defparam ii0689.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0690 ( .DX(nn0690), .F0(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[4]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_mx_addr__reg[14]|Q_net ), .F2(nn0593), .F3(nn0689) );
      defparam ii0690.CONFIG_DATA = 16'hC5CA;
      defparam ii0690.PLACE_LOCATION = "NONE";
      defparam ii0690.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0691 ( .DX(nn0691), .F0(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[4]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[5]|Q_net ), .F2(nn0689), .F3(dummy_abc_199_) );
      defparam ii0691.CONFIG_DATA = 16'h6C6C;
      defparam ii0691.PLACE_LOCATION = "NONE";
      defparam ii0691.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0692 ( .DX(nn0692), .F0(\u_sdram_to_RGB_u_ahb_master_mx_addr__reg[15]|Q_net ), .F1(nn0593), .F2(nn0691), .F3(dummy_abc_200_) );
      defparam ii0692.CONFIG_DATA = 16'hB8B8;
      defparam ii0692.PLACE_LOCATION = "NONE";
      defparam ii0692.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0693 ( .DX(nn0693), .F0(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[6]|Q_net ), .F1(nn0656), .F2(nn0657), .F3(dummy_abc_201_) );
      defparam ii0693.CONFIG_DATA = 16'h6A6A;
      defparam ii0693.PLACE_LOCATION = "NONE";
      defparam ii0693.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0694 ( .DX(nn0694), .F0(\u_sdram_to_RGB_u_ahb_master_mx_addr__reg[16]|Q_net ), .F1(nn0593), .F2(nn0693), .F3(dummy_abc_202_) );
      defparam ii0694.CONFIG_DATA = 16'hB8B8;
      defparam ii0694.PLACE_LOCATION = "NONE";
      defparam ii0694.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0695 ( .DX(nn0695), .F0(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[6]|Q_net ), .F1(nn0656), .F2(nn0657), .F3(dummy_abc_203_) );
      defparam ii0695.CONFIG_DATA = 16'h8080;
      defparam ii0695.PLACE_LOCATION = "NONE";
      defparam ii0695.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0696 ( .DX(nn0696), .F0(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[7]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_mx_addr__reg[17]|Q_net ), .F2(nn0593), .F3(nn0695) );
      defparam ii0696.CONFIG_DATA = 16'hC5CA;
      defparam ii0696.PLACE_LOCATION = "NONE";
      defparam ii0696.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0697 ( .DX(nn0697), .F0(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[7]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[8]|Q_net ), .F2(nn0695), .F3(dummy_abc_204_) );
      defparam ii0697.CONFIG_DATA = 16'h6C6C;
      defparam ii0697.PLACE_LOCATION = "NONE";
      defparam ii0697.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0698 ( .DX(nn0698), .F0(\u_sdram_to_RGB_u_ahb_master_mx_addr__reg[18]|Q_net ), .F1(nn0593), .F2(nn0697), .F3(dummy_abc_205_) );
      defparam ii0698.CONFIG_DATA = 16'hB8B8;
      defparam ii0698.PLACE_LOCATION = "NONE";
      defparam ii0698.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0699 ( .DX(nn0699), .F0(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[7]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[8]|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[9]|Q_net ), .F3(nn0695) );
      defparam ii0699.CONFIG_DATA = 16'h78F0;
      defparam ii0699.PLACE_LOCATION = "NONE";
      defparam ii0699.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0700 ( .DX(nn0700), .F0(\u_sdram_to_RGB_u_ahb_master_mx_addr__reg[19]|Q_net ), .F1(nn0593), .F2(nn0699), .F3(dummy_abc_206_) );
      defparam ii0700.CONFIG_DATA = 16'hB8B8;
      defparam ii0700.PLACE_LOCATION = "NONE";
      defparam ii0700.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0701 ( .DX(nn0701), .F0(\u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[0]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_mx_addr__reg[2]|Q_net ), .F2(nn0593), .F3(dummy_abc_207_) );
      defparam ii0701.CONFIG_DATA = 16'hC5C5;
      defparam ii0701.PLACE_LOCATION = "NONE";
      defparam ii0701.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0702 ( .DX(nn0702), .F0(\u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[0]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[1]|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_mx_addr__reg[3]|Q_net ), .F3(nn0593) );
      defparam ii0702.CONFIG_DATA = 16'hF066;
      defparam ii0702.PLACE_LOCATION = "NONE";
      defparam ii0702.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0703 ( .DX(nn0703), .F0(\u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[0]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[1]|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[2]|Q_net ), .F3(dummy_abc_208_) );
      defparam ii0703.CONFIG_DATA = 16'h7878;
      defparam ii0703.PLACE_LOCATION = "NONE";
      defparam ii0703.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0704 ( .DX(nn0704), .F0(\u_sdram_to_RGB_u_ahb_master_mx_addr__reg[4]|Q_net ), .F1(nn0593), .F2(nn0703), .F3(dummy_abc_209_) );
      defparam ii0704.CONFIG_DATA = 16'hB8B8;
      defparam ii0704.PLACE_LOCATION = "NONE";
      defparam ii0704.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0705 ( .DX(nn0705), .F0(\u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[0]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[1]|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[2]|Q_net ), .F3(\u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[3]|Q_net ) );
      defparam ii0705.CONFIG_DATA = 16'h7F80;
      defparam ii0705.PLACE_LOCATION = "NONE";
      defparam ii0705.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0706 ( .DX(nn0706), .F0(\u_sdram_to_RGB_u_ahb_master_mx_addr__reg[5]|Q_net ), .F1(nn0593), .F2(nn0705), .F3(dummy_abc_210_) );
      defparam ii0706.CONFIG_DATA = 16'hB8B8;
      defparam ii0706.PLACE_LOCATION = "NONE";
      defparam ii0706.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0707 ( .DX(nn0707), .F0(\u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[4]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_mx_addr__reg[6]|Q_net ), .F2(nn0593), .F3(nn0653) );
      defparam ii0707.CONFIG_DATA = 16'hC5CA;
      defparam ii0707.PLACE_LOCATION = "NONE";
      defparam ii0707.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0708 ( .DX(nn0708), .F0(\u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[4]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[5]|Q_net ), .F2(nn0653), .F3(dummy_abc_211_) );
      defparam ii0708.CONFIG_DATA = 16'h6C6C;
      defparam ii0708.PLACE_LOCATION = "NONE";
      defparam ii0708.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0709 ( .DX(nn0709), .F0(\u_sdram_to_RGB_u_ahb_master_mx_addr__reg[7]|Q_net ), .F1(nn0593), .F2(nn0708), .F3(dummy_abc_212_) );
      defparam ii0709.CONFIG_DATA = 16'hB8B8;
      defparam ii0709.PLACE_LOCATION = "NONE";
      defparam ii0709.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0710 ( .DX(nn0710), .F0(\u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[4]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[5]|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[6]|Q_net ), .F3(nn0653) );
      defparam ii0710.CONFIG_DATA = 16'h870F;
      defparam ii0710.PLACE_LOCATION = "NONE";
      defparam ii0710.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0711 ( .DX(nn0711), .F0(\u_sdram_to_RGB_u_ahb_master_mx_addr__reg[8]|Q_net ), .F1(nn0593), .F2(nn0710), .F3(dummy_abc_213_) );
      defparam ii0711.CONFIG_DATA = 16'h8B8B;
      defparam ii0711.PLACE_LOCATION = "NONE";
      defparam ii0711.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0712 ( .DX(nn0712), .F0(\u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[7]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_mx_addr__reg[9]|Q_net ), .F2(nn0593), .F3(nn0654) );
      defparam ii0712.CONFIG_DATA = 16'hC5CA;
      defparam ii0712.PLACE_LOCATION = "NONE";
      defparam ii0712.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0713 ( .DX(nn0713), .F0(\u_sdram_to_RGB_u_ahb_master_hburst_o__reg[0]|Q_net ), .F1(nn0593), .F2(nn0599), .F3(dummy_abc_214_) );
      defparam ii0713.CONFIG_DATA = 16'h0E0E;
      defparam ii0713.PLACE_LOCATION = "NONE";
      defparam ii0713.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0714 ( .DX(nn0714), .F0(nn0613), .F1(nn0599), .F2(nn0608), .F3(dummy_abc_215_) );
      defparam ii0714.CONFIG_DATA = 16'h5454;
      defparam ii0714.PLACE_LOCATION = "NONE";
      defparam ii0714.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0715 ( .DX(nn0715), .F0(\u_sdram_to_RGB_u_ahb_master_hburst_o__reg[1]|Q_net ), .F1(nn0593), .F2(nn0714), .F3(dummy_abc_216_) );
      defparam ii0715.CONFIG_DATA = 16'h0E0E;
      defparam ii0715.PLACE_LOCATION = "NONE";
      defparam ii0715.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0716 ( .DX(nn0716), .F0(\u_sdram_to_RGB_u_ahb_master_hburst_o__reg[2]|Q_net ), .F1(nn0593), .F2(nn0608), .F3(dummy_abc_217_) );
      defparam ii0716.CONFIG_DATA = 16'hF2F2;
      defparam ii0716.PLACE_LOCATION = "NONE";
      defparam ii0716.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0717 ( .DX(nn0717), .F0(fp0_m_ahb_resp_u_arm_u_soc), .F1(nn0601), .F2(nn0642), .F3(dummy_abc_218_) );
      defparam ii0717.CONFIG_DATA = 16'h0E0E;
      defparam ii0717.PLACE_LOCATION = "NONE";
      defparam ii0717.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0718 ( .DX(nn0718), .F0(\u_sdram_to_RGB_u_ahb_master_addr_count__reg[1]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_addr_count__reg[2]|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_addr_count__reg[7]|Q_net ), .F3(dummy_abc_219_) );
      defparam ii0718.CONFIG_DATA = 16'h0101;
      defparam ii0718.PLACE_LOCATION = "NONE";
      defparam ii0718.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0719 ( .DX(nn0719), .F0(\u_sdram_to_RGB_u_ahb_master_ahb_cs__reg[0]|Q_net ), .F1(nn0601), .F2(nn0635), .F3(nn0718) );
      defparam ii0719.CONFIG_DATA = 16'h0444;
      defparam ii0719.PLACE_LOCATION = "NONE";
      defparam ii0719.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0720 ( .DX(nn0720), .F0(\u_sdram_to_RGB_u_ahb_master_htrans_o__reg[0]|Q_net ), .F1(nn0593), .F2(nn0717), .F3(nn0719) );
      defparam ii0720.CONFIG_DATA = 16'h0302;
      defparam ii0720.PLACE_LOCATION = "NONE";
      defparam ii0720.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0721 ( .DX(nn0721), .F0(\u_sdram_to_RGB_u_ahb_master_htrans_o__reg[1]|Q_net ), .F1(nn0593), .F2(nn0717), .F3(nn0719) );
      defparam ii0721.CONFIG_DATA = 16'h0F0E;
      defparam ii0721.PLACE_LOCATION = "NONE";
      defparam ii0721.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0722 ( .DX(nn0722), .F0(\u_sdram_to_RGB_dma_start_xfer__reg|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_hwrite_o__reg|Q_net ), .F2(dummy_abc_220_), .F3(dummy_abc_221_) );
      defparam ii0722.CONFIG_DATA = 16'h4444;
      defparam ii0722.PLACE_LOCATION = "NONE";
      defparam ii0722.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0723 ( .DX(nn0723), .F0(\u_sdram_to_RGB_dma_addr__reg[10]|Q_net ), .F1(\u_sdram_to_RGB_dma_start_xfer__reg|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[0]|Q_net ), .F3(dummy_abc_222_) );
      defparam ii0723.CONFIG_DATA = 16'hB8B8;
      defparam ii0723.PLACE_LOCATION = "NONE";
      defparam ii0723.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0724 ( .DX(nn0724), .F0(\u_sdram_to_RGB_dma_start_xfer__reg|Q_net ), .F1(nn0648), .F2(dummy_abc_223_), .F3(dummy_abc_224_) );
      defparam ii0724.CONFIG_DATA = 16'hEEEE;
      defparam ii0724.PLACE_LOCATION = "NONE";
      defparam ii0724.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0725 ( .DX(nn0725), .F0(\u_sdram_to_RGB_dma_addr__reg[11]|Q_net ), .F1(\u_sdram_to_RGB_dma_start_xfer__reg|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[1]|Q_net ), .F3(dummy_abc_225_) );
      defparam ii0725.CONFIG_DATA = 16'hB8B8;
      defparam ii0725.PLACE_LOCATION = "NONE";
      defparam ii0725.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0726 ( .DX(nn0726), .F0(\u_sdram_to_RGB_dma_addr__reg[12]|Q_net ), .F1(\u_sdram_to_RGB_dma_start_xfer__reg|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[2]|Q_net ), .F3(dummy_abc_226_) );
      defparam ii0726.CONFIG_DATA = 16'hB8B8;
      defparam ii0726.PLACE_LOCATION = "NONE";
      defparam ii0726.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0727 ( .DX(nn0727), .F0(\u_sdram_to_RGB_dma_addr__reg[13]|Q_net ), .F1(\u_sdram_to_RGB_dma_start_xfer__reg|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[3]|Q_net ), .F3(dummy_abc_227_) );
      defparam ii0727.CONFIG_DATA = 16'hB8B8;
      defparam ii0727.PLACE_LOCATION = "NONE";
      defparam ii0727.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0728 ( .DX(nn0728), .F0(\u_sdram_to_RGB_dma_addr__reg[14]|Q_net ), .F1(\u_sdram_to_RGB_dma_start_xfer__reg|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[4]|Q_net ), .F3(dummy_abc_228_) );
      defparam ii0728.CONFIG_DATA = 16'hB8B8;
      defparam ii0728.PLACE_LOCATION = "NONE";
      defparam ii0728.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0729 ( .DX(nn0729), .F0(\u_sdram_to_RGB_dma_addr__reg[15]|Q_net ), .F1(\u_sdram_to_RGB_dma_start_xfer__reg|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[5]|Q_net ), .F3(dummy_abc_229_) );
      defparam ii0729.CONFIG_DATA = 16'hB8B8;
      defparam ii0729.PLACE_LOCATION = "NONE";
      defparam ii0729.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0730 ( .DX(nn0730), .F0(\u_sdram_to_RGB_dma_addr__reg[16]|Q_net ), .F1(\u_sdram_to_RGB_dma_start_xfer__reg|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[6]|Q_net ), .F3(dummy_abc_230_) );
      defparam ii0730.CONFIG_DATA = 16'hB8B8;
      defparam ii0730.PLACE_LOCATION = "NONE";
      defparam ii0730.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0731 ( .DX(nn0731), .F0(\u_sdram_to_RGB_dma_addr__reg[17]|Q_net ), .F1(\u_sdram_to_RGB_dma_start_xfer__reg|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[7]|Q_net ), .F3(dummy_abc_231_) );
      defparam ii0731.CONFIG_DATA = 16'hB8B8;
      defparam ii0731.PLACE_LOCATION = "NONE";
      defparam ii0731.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0732 ( .DX(nn0732), .F0(\u_sdram_to_RGB_dma_addr__reg[18]|Q_net ), .F1(\u_sdram_to_RGB_dma_start_xfer__reg|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[8]|Q_net ), .F3(dummy_abc_232_) );
      defparam ii0732.CONFIG_DATA = 16'hB8B8;
      defparam ii0732.PLACE_LOCATION = "NONE";
      defparam ii0732.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0733 ( .DX(nn0733), .F0(\u_sdram_to_RGB_dma_addr__reg[19]|Q_net ), .F1(\u_sdram_to_RGB_dma_start_xfer__reg|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[9]|Q_net ), .F3(dummy_abc_233_) );
      defparam ii0733.CONFIG_DATA = 16'hB8B8;
      defparam ii0733.PLACE_LOCATION = "NONE";
      defparam ii0733.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0734 ( .DX(nn0734), .F0(\u_sdram_to_RGB_dma_addr__reg[20]|Q_net ), .F1(\u_sdram_to_RGB_dma_start_xfer__reg|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[10]|Q_net ), .F3(dummy_abc_234_) );
      defparam ii0734.CONFIG_DATA = 16'hB8B8;
      defparam ii0734.PLACE_LOCATION = "NONE";
      defparam ii0734.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0735 ( .DX(nn0735), .F0(\u_sdram_to_RGB_dma_addr__reg[21]|Q_net ), .F1(\u_sdram_to_RGB_dma_start_xfer__reg|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[11]|Q_net ), .F3(dummy_abc_235_) );
      defparam ii0735.CONFIG_DATA = 16'hB8B8;
      defparam ii0735.PLACE_LOCATION = "NONE";
      defparam ii0735.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0736 ( .DX(nn0736), .F0(\u_sdram_to_RGB_dma_addr__reg[22]|Q_net ), .F1(\u_sdram_to_RGB_dma_start_xfer__reg|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[12]|Q_net ), .F3(dummy_abc_236_) );
      defparam ii0736.CONFIG_DATA = 16'hB8B8;
      defparam ii0736.PLACE_LOCATION = "NONE";
      defparam ii0736.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0737 ( .DX(nn0737), .F0(\u_sdram_to_RGB_dma_addr__reg[23]|Q_net ), .F1(\u_sdram_to_RGB_dma_start_xfer__reg|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[13]|Q_net ), .F3(dummy_abc_237_) );
      defparam ii0737.CONFIG_DATA = 16'hB8B8;
      defparam ii0737.PLACE_LOCATION = "NONE";
      defparam ii0737.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0738 ( .DX(nn0738), .F0(\u_sdram_to_RGB_dma_addr__reg[24]|Q_net ), .F1(\u_sdram_to_RGB_dma_start_xfer__reg|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[14]|Q_net ), .F3(dummy_abc_238_) );
      defparam ii0738.CONFIG_DATA = 16'hB8B8;
      defparam ii0738.PLACE_LOCATION = "NONE";
      defparam ii0738.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0739 ( .DX(nn0739), .F0(\u_sdram_to_RGB_dma_addr__reg[25]|Q_net ), .F1(\u_sdram_to_RGB_dma_start_xfer__reg|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[15]|Q_net ), .F3(dummy_abc_239_) );
      defparam ii0739.CONFIG_DATA = 16'hB8B8;
      defparam ii0739.PLACE_LOCATION = "NONE";
      defparam ii0739.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0740 ( .DX(nn0740), .F0(\u_sdram_to_RGB_dma_addr__reg[26]|Q_net ), .F1(\u_sdram_to_RGB_dma_start_xfer__reg|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[16]|Q_net ), .F3(dummy_abc_240_) );
      defparam ii0740.CONFIG_DATA = 16'hB8B8;
      defparam ii0740.PLACE_LOCATION = "NONE";
      defparam ii0740.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0741 ( .DX(nn0741), .F0(\u_sdram_to_RGB_dma_addr__reg[27]|Q_net ), .F1(\u_sdram_to_RGB_dma_start_xfer__reg|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[17]|Q_net ), .F3(dummy_abc_241_) );
      defparam ii0741.CONFIG_DATA = 16'hB8B8;
      defparam ii0741.PLACE_LOCATION = "NONE";
      defparam ii0741.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0742 ( .DX(nn0742), .F0(\u_sdram_to_RGB_dma_addr__reg[28]|Q_net ), .F1(\u_sdram_to_RGB_dma_start_xfer__reg|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[18]|Q_net ), .F3(dummy_abc_242_) );
      defparam ii0742.CONFIG_DATA = 16'hB8B8;
      defparam ii0742.PLACE_LOCATION = "NONE";
      defparam ii0742.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0743 ( .DX(nn0743), .F0(\u_sdram_to_RGB_dma_addr__reg[29]|Q_net ), .F1(\u_sdram_to_RGB_dma_start_xfer__reg|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[19]|Q_net ), .F3(dummy_abc_243_) );
      defparam ii0743.CONFIG_DATA = 16'hB8B8;
      defparam ii0743.PLACE_LOCATION = "NONE";
      defparam ii0743.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0744 ( .DX(nn0744), .F0(\u_sdram_to_RGB_dma_addr__reg[2]|Q_net ), .F1(\u_sdram_to_RGB_dma_start_xfer__reg|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[0]|Q_net ), .F3(dummy_abc_244_) );
      defparam ii0744.CONFIG_DATA = 16'hB8B8;
      defparam ii0744.PLACE_LOCATION = "NONE";
      defparam ii0744.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0745 ( .DX(nn0745), .F0(\u_sdram_to_RGB_dma_addr__reg[30]|Q_net ), .F1(\u_sdram_to_RGB_dma_start_xfer__reg|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[20]|Q_net ), .F3(dummy_abc_245_) );
      defparam ii0745.CONFIG_DATA = 16'hB8B8;
      defparam ii0745.PLACE_LOCATION = "NONE";
      defparam ii0745.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0746 ( .DX(nn0746), .F0(\u_sdram_to_RGB_dma_addr__reg[31]|Q_net ), .F1(\u_sdram_to_RGB_dma_start_xfer__reg|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[21]|Q_net ), .F3(dummy_abc_246_) );
      defparam ii0746.CONFIG_DATA = 16'hB8B8;
      defparam ii0746.PLACE_LOCATION = "NONE";
      defparam ii0746.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0747 ( .DX(nn0747), .F0(\u_sdram_to_RGB_dma_addr__reg[3]|Q_net ), .F1(\u_sdram_to_RGB_dma_start_xfer__reg|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[1]|Q_net ), .F3(dummy_abc_247_) );
      defparam ii0747.CONFIG_DATA = 16'hB8B8;
      defparam ii0747.PLACE_LOCATION = "NONE";
      defparam ii0747.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0748 ( .DX(nn0748), .F0(\u_sdram_to_RGB_dma_addr__reg[4]|Q_net ), .F1(\u_sdram_to_RGB_dma_start_xfer__reg|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[2]|Q_net ), .F3(dummy_abc_248_) );
      defparam ii0748.CONFIG_DATA = 16'hB8B8;
      defparam ii0748.PLACE_LOCATION = "NONE";
      defparam ii0748.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0749 ( .DX(nn0749), .F0(\u_sdram_to_RGB_dma_addr__reg[5]|Q_net ), .F1(\u_sdram_to_RGB_dma_start_xfer__reg|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[3]|Q_net ), .F3(dummy_abc_249_) );
      defparam ii0749.CONFIG_DATA = 16'hB8B8;
      defparam ii0749.PLACE_LOCATION = "NONE";
      defparam ii0749.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0750 ( .DX(nn0750), .F0(\u_sdram_to_RGB_dma_addr__reg[6]|Q_net ), .F1(\u_sdram_to_RGB_dma_start_xfer__reg|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[4]|Q_net ), .F3(dummy_abc_250_) );
      defparam ii0750.CONFIG_DATA = 16'hB8B8;
      defparam ii0750.PLACE_LOCATION = "NONE";
      defparam ii0750.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0751 ( .DX(nn0751), .F0(\u_sdram_to_RGB_dma_addr__reg[7]|Q_net ), .F1(\u_sdram_to_RGB_dma_start_xfer__reg|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[5]|Q_net ), .F3(dummy_abc_251_) );
      defparam ii0751.CONFIG_DATA = 16'hB8B8;
      defparam ii0751.PLACE_LOCATION = "NONE";
      defparam ii0751.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0752 ( .DX(nn0752), .F0(\u_sdram_to_RGB_dma_addr__reg[8]|Q_net ), .F1(\u_sdram_to_RGB_dma_start_xfer__reg|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[6]|Q_net ), .F3(dummy_abc_252_) );
      defparam ii0752.CONFIG_DATA = 16'hB8B8;
      defparam ii0752.PLACE_LOCATION = "NONE";
      defparam ii0752.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0753 ( .DX(nn0753), .F0(\u_sdram_to_RGB_dma_addr__reg[9]|Q_net ), .F1(\u_sdram_to_RGB_dma_start_xfer__reg|Q_net ), .F2(\u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[7]|Q_net ), .F3(dummy_abc_253_) );
      defparam ii0753.CONFIG_DATA = 16'hB8B8;
      defparam ii0753.PLACE_LOCATION = "NONE";
      defparam ii0753.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0754 ( .DX(nn0754), .F0(\u_sdram_to_RGB_u_ahb_master_xfer_count__reg[3]|Q_net ), .F1(nn0625), .F2(nn0613), .F3(nn0630) );
      defparam ii0754.CONFIG_DATA = 16'h00E4;
      defparam ii0754.PLACE_LOCATION = "NONE";
      defparam ii0754.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0755 ( .DX(nn0755), .F0(nn0597), .F1(nn0626), .F2(nn0623), .F3(nn0648) );
      defparam ii0755.CONFIG_DATA = 16'h8000;
      defparam ii0755.PLACE_LOCATION = "NONE";
      defparam ii0755.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0756 ( .DX(nn0756), .F0(\u_sdram_to_RGB_dma_start_xfer__reg|Q_net ), .F1(nn0625), .F2(nn0754), .F3(nn0755) );
      defparam ii0756.CONFIG_DATA = 16'hAEEE;
      defparam ii0756.PLACE_LOCATION = "NONE";
      defparam ii0756.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0757 ( .DX(nn0757), .F0(\u_sdram_to_RGB_dma_start_xfer__reg|Q_net ), .F1(nn0630), .F2(nn0648), .F3(dummy_abc_254_) );
      defparam ii0757.CONFIG_DATA = 16'hBABA;
      defparam ii0757.PLACE_LOCATION = "NONE";
      defparam ii0757.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0758 ( .DX(nn0758), .F0(\u_sdram_to_RGB_u_ahb_master_xfer_count__reg[0]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_xfer_count__reg[1]|Q_net ), .F2(nn0596), .F3(nn0606) );
      defparam ii0758.CONFIG_DATA = 16'h5D5A;
      defparam ii0758.PLACE_LOCATION = "NONE";
      defparam ii0758.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0759 ( .DX(nn0759), .F0(\u_sdram_to_RGB_u_ahb_master_xfer_count__reg[0]|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_xfer_count__reg[1]|Q_net ), .F2(nn0596), .F3(nn0606) );
      defparam ii0759.CONFIG_DATA = 16'h3B3C;
      defparam ii0759.PLACE_LOCATION = "NONE";
      defparam ii0759.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0760 ( .DX(nn0760), .F0(\u_sdram_to_RGB_u_ahb_master_xfer_count__reg[2]|Q_net ), .F1(nn0606), .F2(nn0607), .F3(nn0598) );
      defparam ii0760.CONFIG_DATA = 16'hDCDE;
      defparam ii0760.PLACE_LOCATION = "NONE";
      defparam ii0760.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0761 ( .DX(nn0761), .F0(\u_sdram_to_RGB_u_ahb_master_xfer_count__reg[3]|Q_net ), .F1(nn0613), .F2(dummy_abc_255_), .F3(dummy_abc_256_) );
      defparam ii0761.CONFIG_DATA = 16'h9999;
      defparam ii0761.PLACE_LOCATION = "NONE";
      defparam ii0761.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0762 ( .DX(nn0762), .F0(\u_sdram_to_RGB_u_ahb_master_xfer_count__reg[4]|Q_net ), .F1(dummy_abc_257_), .F2(dummy_abc_258_), .F3(dummy_abc_259_) );
      defparam ii0762.CONFIG_DATA = 16'h5555;
      defparam ii0762.PLACE_LOCATION = "NONE";
      defparam ii0762.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0763 ( .DX(nn0763), .F0(\u_sdram_to_RGB_u_ahb_master_xfer_count__reg[5]|Q_net ), .F1(dummy_abc_260_), .F2(dummy_abc_261_), .F3(dummy_abc_262_) );
      defparam ii0763.CONFIG_DATA = 16'h5555;
      defparam ii0763.PLACE_LOCATION = "NONE";
      defparam ii0763.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0764 ( .DX(nn0764), .F0(\u_sdram_to_RGB_u_ahb_master_xfer_count__reg[6]|Q_net ), .F1(dummy_abc_263_), .F2(dummy_abc_264_), .F3(dummy_abc_265_) );
      defparam ii0764.CONFIG_DATA = 16'h5555;
      defparam ii0764.PLACE_LOCATION = "NONE";
      defparam ii0764.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0765 ( .DX(nn0765), .F0(\u_sdram_to_RGB_u_ahb_master_xfer_count__reg[7]|Q_net ), .F1(dummy_abc_266_), .F2(dummy_abc_267_), .F3(dummy_abc_268_) );
      defparam ii0765.CONFIG_DATA = 16'h5555;
      defparam ii0765.PLACE_LOCATION = "NONE";
      defparam ii0765.PCK_LOCATION = "NONE";
    demo_sd_to_lcd_ipc_adder_8 carry_8 ( 
        .CA( {\u_sdram_to_RGB_u_ahb_master_xfer_count__reg[7]|Q_net , 
              \u_sdram_to_RGB_u_ahb_master_xfer_count__reg[6]|Q_net , \u_sdram_to_RGB_u_ahb_master_xfer_count__reg[5]|Q_net , 
              \u_sdram_to_RGB_u_ahb_master_xfer_count__reg[4]|Q_net , \u_sdram_to_RGB_u_ahb_master_xfer_count__reg[3]|Q_net , 
              \u_sdram_to_RGB_u_ahb_master_xfer_count__reg[2]|Q_net , \u_sdram_to_RGB_u_ahb_master_xfer_count__reg[1]|Q_net , 
              \u_sdram_to_RGB_u_ahb_master_xfer_count__reg[0]|Q_net } ), 
        .CI( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), 
        .CO( dummy_1_ ), 
        .DX( {nn0765, nn0764, nn0763, nn0762, nn0761, nn0760, nn0759, nn0758} ), 
        .SUM( {\u_sdram_to_RGB_u_ahb_master_u65_XORCI_7|SUM_net , 
              \u_sdram_to_RGB_u_ahb_master_u65_XORCI_6|SUM_net , \u_sdram_to_RGB_u_ahb_master_u65_XORCI_5|SUM_net , 
              \u_sdram_to_RGB_u_ahb_master_u65_XORCI_4|SUM_net , \u_sdram_to_RGB_u_ahb_master_u65_XORCI_3|SUM_net , 
              \u_sdram_to_RGB_u_ahb_master_u65_XORCI_2|SUM_net , \u_sdram_to_RGB_u_ahb_master_u65_XORCI_1|SUM_net , 
              \u_sdram_to_RGB_u_ahb_master_u65_XORCI_0|SUM_net } )
      );
    CS_LUT4_PRIM ii0776 ( .DX(nn0776), .F0(\u_sdram_to_RGB_dma_start_xfer__reg|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_u65_XORCI_1|SUM_net ), .F2(nn0754), .F3(nn0755) );
      defparam ii0776.CONFIG_DATA = 16'hAEEE;
      defparam ii0776.PLACE_LOCATION = "NONE";
      defparam ii0776.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0777 ( .DX(nn0777), .F0(\u_sdram_to_RGB_dma_start_xfer__reg|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_u65_XORCI_2|SUM_net ), .F2(nn0754), .F3(nn0755) );
      defparam ii0777.CONFIG_DATA = 16'hAEEE;
      defparam ii0777.PLACE_LOCATION = "NONE";
      defparam ii0777.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0778 ( .DX(nn0778), .F0(\u_sdram_to_RGB_dma_start_xfer__reg|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_u65_XORCI_3|SUM_net ), .F2(nn0754), .F3(nn0755) );
      defparam ii0778.CONFIG_DATA = 16'hAEEE;
      defparam ii0778.PLACE_LOCATION = "NONE";
      defparam ii0778.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0779 ( .DX(nn0779), .F0(\u_sdram_to_RGB_dma_start_xfer__reg|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_u65_XORCI_4|SUM_net ), .F2(nn0754), .F3(nn0755) );
      defparam ii0779.CONFIG_DATA = 16'hAEEE;
      defparam ii0779.PLACE_LOCATION = "NONE";
      defparam ii0779.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0780 ( .DX(nn0780), .F0(\u_sdram_to_RGB_dma_start_xfer__reg|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_u65_XORCI_5|SUM_net ), .F2(nn0754), .F3(nn0755) );
      defparam ii0780.CONFIG_DATA = 16'hAEEE;
      defparam ii0780.PLACE_LOCATION = "NONE";
      defparam ii0780.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0781 ( .DX(nn0781), .F0(\u_sdram_to_RGB_dma_start_xfer__reg|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_u65_XORCI_6|SUM_net ), .F2(nn0754), .F3(nn0755) );
      defparam ii0781.CONFIG_DATA = 16'hAEEE;
      defparam ii0781.PLACE_LOCATION = "NONE";
      defparam ii0781.PCK_LOCATION = "NONE";
    CS_LUT4_PRIM ii0782 ( .DX(nn0782), .F0(\u_sdram_to_RGB_dma_start_xfer__reg|Q_net ), .F1(\u_sdram_to_RGB_u_ahb_master_u65_XORCI_7|SUM_net ), .F2(nn0754), .F3(nn0755) );
      defparam ii0782.CONFIG_DATA = 16'hAEEE;
      defparam ii0782.PLACE_LOCATION = "NONE";
      defparam ii0782.PCK_LOCATION = "NONE";
    CS_REGA_PRIM rstn_final__reg ( .CLK( clkout0_u_lvds_pll_u0 ), .D( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .RST( nn0458 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \rstn_final__reg|Q_net  ) );
      defparam rstn_final__reg.INIT = 0;
      defparam rstn_final__reg.PLACE_LOCATION = "NONE";
      defparam rstn_final__reg.PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_colorgen_h_cnt__reg[0]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( nn0461 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_colorgen_h_cnt__reg[0]|Q_net  ) );
      defparam \u_colorgen_h_cnt__reg[0] .INIT = 0;
      defparam \u_colorgen_h_cnt__reg[0] .PLACE_LOCATION = "NONE";
      defparam \u_colorgen_h_cnt__reg[0] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_colorgen_h_cnt__reg[10]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( nn0467 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_colorgen_h_cnt__reg[10]|Q_net  ) );
      defparam \u_colorgen_h_cnt__reg[10] .INIT = 0;
      defparam \u_colorgen_h_cnt__reg[10] .PLACE_LOCATION = "NONE";
      defparam \u_colorgen_h_cnt__reg[10] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_colorgen_h_cnt__reg[1]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( nn0468 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_colorgen_h_cnt__reg[1]|Q_net  ) );
      defparam \u_colorgen_h_cnt__reg[1] .INIT = 0;
      defparam \u_colorgen_h_cnt__reg[1] .PLACE_LOCATION = "NONE";
      defparam \u_colorgen_h_cnt__reg[1] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_colorgen_h_cnt__reg[2]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( nn0470 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_colorgen_h_cnt__reg[2]|Q_net  ) );
      defparam \u_colorgen_h_cnt__reg[2] .INIT = 0;
      defparam \u_colorgen_h_cnt__reg[2] .PLACE_LOCATION = "NONE";
      defparam \u_colorgen_h_cnt__reg[2] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_colorgen_h_cnt__reg[3]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( nn0471 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_colorgen_h_cnt__reg[3]|Q_net  ) );
      defparam \u_colorgen_h_cnt__reg[3] .INIT = 0;
      defparam \u_colorgen_h_cnt__reg[3] .PLACE_LOCATION = "NONE";
      defparam \u_colorgen_h_cnt__reg[3] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_colorgen_h_cnt__reg[4]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( nn0472 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_colorgen_h_cnt__reg[4]|Q_net  ) );
      defparam \u_colorgen_h_cnt__reg[4] .INIT = 0;
      defparam \u_colorgen_h_cnt__reg[4] .PLACE_LOCATION = "NONE";
      defparam \u_colorgen_h_cnt__reg[4] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_colorgen_h_cnt__reg[5]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( nn0473 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_colorgen_h_cnt__reg[5]|Q_net  ) );
      defparam \u_colorgen_h_cnt__reg[5] .INIT = 0;
      defparam \u_colorgen_h_cnt__reg[5] .PLACE_LOCATION = "NONE";
      defparam \u_colorgen_h_cnt__reg[5] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_colorgen_h_cnt__reg[6]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( nn0474 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_colorgen_h_cnt__reg[6]|Q_net  ) );
      defparam \u_colorgen_h_cnt__reg[6] .INIT = 0;
      defparam \u_colorgen_h_cnt__reg[6] .PLACE_LOCATION = "NONE";
      defparam \u_colorgen_h_cnt__reg[6] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_colorgen_h_cnt__reg[7]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( nn0475 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_colorgen_h_cnt__reg[7]|Q_net  ) );
      defparam \u_colorgen_h_cnt__reg[7] .INIT = 0;
      defparam \u_colorgen_h_cnt__reg[7] .PLACE_LOCATION = "NONE";
      defparam \u_colorgen_h_cnt__reg[7] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_colorgen_h_cnt__reg[8]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( nn0477 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_colorgen_h_cnt__reg[8]|Q_net  ) );
      defparam \u_colorgen_h_cnt__reg[8] .INIT = 0;
      defparam \u_colorgen_h_cnt__reg[8] .PLACE_LOCATION = "NONE";
      defparam \u_colorgen_h_cnt__reg[8] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_colorgen_h_cnt__reg[9]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( nn0478 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_colorgen_h_cnt__reg[9]|Q_net  ) );
      defparam \u_colorgen_h_cnt__reg[9] .INIT = 0;
      defparam \u_colorgen_h_cnt__reg[9] .PLACE_LOCATION = "NONE";
      defparam \u_colorgen_h_cnt__reg[9] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM u_colorgen_h_valid__reg ( .CLK( clkout0_u_lvds_pll_u0 ), .D( nn0480 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_colorgen_h_valid__reg|Q_net  ) );
      defparam u_colorgen_h_valid__reg.INIT = 0;
      defparam u_colorgen_h_valid__reg.PLACE_LOCATION = "NONE";
      defparam u_colorgen_h_valid__reg.PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_colorgen_v_cnt__reg[0]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( nn0485 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0486 ), .Q( \u_colorgen_v_cnt__reg[0]|Q_net  ) );
      defparam \u_colorgen_v_cnt__reg[0] .INIT = 0;
      defparam \u_colorgen_v_cnt__reg[0] .PLACE_LOCATION = "NONE";
      defparam \u_colorgen_v_cnt__reg[0] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_colorgen_v_cnt__reg[1]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( nn0487 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0486 ), .Q( \u_colorgen_v_cnt__reg[1]|Q_net  ) );
      defparam \u_colorgen_v_cnt__reg[1] .INIT = 0;
      defparam \u_colorgen_v_cnt__reg[1] .PLACE_LOCATION = "NONE";
      defparam \u_colorgen_v_cnt__reg[1] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_colorgen_v_cnt__reg[2]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( nn0488 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0486 ), .Q( \u_colorgen_v_cnt__reg[2]|Q_net  ) );
      defparam \u_colorgen_v_cnt__reg[2] .INIT = 0;
      defparam \u_colorgen_v_cnt__reg[2] .PLACE_LOCATION = "NONE";
      defparam \u_colorgen_v_cnt__reg[2] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_colorgen_v_cnt__reg[3]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( nn0490 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0486 ), .Q( \u_colorgen_v_cnt__reg[3]|Q_net  ) );
      defparam \u_colorgen_v_cnt__reg[3] .INIT = 0;
      defparam \u_colorgen_v_cnt__reg[3] .PLACE_LOCATION = "NONE";
      defparam \u_colorgen_v_cnt__reg[3] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_colorgen_v_cnt__reg[4]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( nn0492 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0486 ), .Q( \u_colorgen_v_cnt__reg[4]|Q_net  ) );
      defparam \u_colorgen_v_cnt__reg[4] .INIT = 0;
      defparam \u_colorgen_v_cnt__reg[4] .PLACE_LOCATION = "NONE";
      defparam \u_colorgen_v_cnt__reg[4] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_colorgen_v_cnt__reg[5]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( nn0493 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0486 ), .Q( \u_colorgen_v_cnt__reg[5]|Q_net  ) );
      defparam \u_colorgen_v_cnt__reg[5] .INIT = 0;
      defparam \u_colorgen_v_cnt__reg[5] .PLACE_LOCATION = "NONE";
      defparam \u_colorgen_v_cnt__reg[5] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_colorgen_v_cnt__reg[6]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( nn0495 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0486 ), .Q( \u_colorgen_v_cnt__reg[6]|Q_net  ) );
      defparam \u_colorgen_v_cnt__reg[6] .INIT = 0;
      defparam \u_colorgen_v_cnt__reg[6] .PLACE_LOCATION = "NONE";
      defparam \u_colorgen_v_cnt__reg[6] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_colorgen_v_cnt__reg[7]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( nn0496 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0486 ), .Q( \u_colorgen_v_cnt__reg[7]|Q_net  ) );
      defparam \u_colorgen_v_cnt__reg[7] .INIT = 0;
      defparam \u_colorgen_v_cnt__reg[7] .PLACE_LOCATION = "NONE";
      defparam \u_colorgen_v_cnt__reg[7] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_colorgen_v_cnt__reg[8]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( nn0498 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0486 ), .Q( \u_colorgen_v_cnt__reg[8]|Q_net  ) );
      defparam \u_colorgen_v_cnt__reg[8] .INIT = 0;
      defparam \u_colorgen_v_cnt__reg[8] .PLACE_LOCATION = "NONE";
      defparam \u_colorgen_v_cnt__reg[8] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_colorgen_v_cnt__reg[9]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( nn0499 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0486 ), .Q( \u_colorgen_v_cnt__reg[9]|Q_net  ) );
      defparam \u_colorgen_v_cnt__reg[9] .INIT = 0;
      defparam \u_colorgen_v_cnt__reg[9] .PLACE_LOCATION = "NONE";
      defparam \u_colorgen_v_cnt__reg[9] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM u_colorgen_v_valid__reg ( .CLK( clkout0_u_lvds_pll_u0 ), .D( nn0501 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_colorgen_v_valid__reg|Q_net  ) );
      defparam u_colorgen_v_valid__reg.INIT = 0;
      defparam u_colorgen_v_valid__reg.PLACE_LOCATION = "NONE";
      defparam u_colorgen_v_valid__reg.PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_addr_cnt__reg[0]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0502 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \u_sdram_to_RGB_dma_start_xfer__reg|Q_net  ), .Q( \u_sdram_to_RGB_addr_cnt__reg[0]|Q_net  ) );
      defparam \u_sdram_to_RGB_addr_cnt__reg[0] .INIT = 0;
      defparam \u_sdram_to_RGB_addr_cnt__reg[0] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_addr_cnt__reg[0] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_addr_cnt__reg[10]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0509 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \u_sdram_to_RGB_dma_start_xfer__reg|Q_net  ), .Q( \u_sdram_to_RGB_addr_cnt__reg[10]|Q_net  ) );
      defparam \u_sdram_to_RGB_addr_cnt__reg[10] .INIT = 0;
      defparam \u_sdram_to_RGB_addr_cnt__reg[10] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_addr_cnt__reg[10] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_addr_cnt__reg[1]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0510 ), .RST( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .SET( nn0462 ), .CE( \u_sdram_to_RGB_dma_start_xfer__reg|Q_net  ), .Q( \u_sdram_to_RGB_addr_cnt__reg[1]|Q_net  ) );
      defparam \u_sdram_to_RGB_addr_cnt__reg[1] .INIT = 0;
      defparam \u_sdram_to_RGB_addr_cnt__reg[1] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_addr_cnt__reg[1] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_addr_cnt__reg[2]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0511 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \u_sdram_to_RGB_dma_start_xfer__reg|Q_net  ), .Q( \u_sdram_to_RGB_addr_cnt__reg[2]|Q_net  ) );
      defparam \u_sdram_to_RGB_addr_cnt__reg[2] .INIT = 0;
      defparam \u_sdram_to_RGB_addr_cnt__reg[2] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_addr_cnt__reg[2] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_addr_cnt__reg[3]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0512 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \u_sdram_to_RGB_dma_start_xfer__reg|Q_net  ), .Q( \u_sdram_to_RGB_addr_cnt__reg[3]|Q_net  ) );
      defparam \u_sdram_to_RGB_addr_cnt__reg[3] .INIT = 0;
      defparam \u_sdram_to_RGB_addr_cnt__reg[3] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_addr_cnt__reg[3] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_addr_cnt__reg[4]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0513 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \u_sdram_to_RGB_dma_start_xfer__reg|Q_net  ), .Q( \u_sdram_to_RGB_addr_cnt__reg[4]|Q_net  ) );
      defparam \u_sdram_to_RGB_addr_cnt__reg[4] .INIT = 0;
      defparam \u_sdram_to_RGB_addr_cnt__reg[4] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_addr_cnt__reg[4] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_addr_cnt__reg[5]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0514 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \u_sdram_to_RGB_dma_start_xfer__reg|Q_net  ), .Q( \u_sdram_to_RGB_addr_cnt__reg[5]|Q_net  ) );
      defparam \u_sdram_to_RGB_addr_cnt__reg[5] .INIT = 0;
      defparam \u_sdram_to_RGB_addr_cnt__reg[5] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_addr_cnt__reg[5] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_addr_cnt__reg[6]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0515 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \u_sdram_to_RGB_dma_start_xfer__reg|Q_net  ), .Q( \u_sdram_to_RGB_addr_cnt__reg[6]|Q_net  ) );
      defparam \u_sdram_to_RGB_addr_cnt__reg[6] .INIT = 0;
      defparam \u_sdram_to_RGB_addr_cnt__reg[6] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_addr_cnt__reg[6] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_addr_cnt__reg[7]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0516 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \u_sdram_to_RGB_dma_start_xfer__reg|Q_net  ), .Q( \u_sdram_to_RGB_addr_cnt__reg[7]|Q_net  ) );
      defparam \u_sdram_to_RGB_addr_cnt__reg[7] .INIT = 0;
      defparam \u_sdram_to_RGB_addr_cnt__reg[7] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_addr_cnt__reg[7] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_addr_cnt__reg[8]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0517 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \u_sdram_to_RGB_dma_start_xfer__reg|Q_net  ), .Q( \u_sdram_to_RGB_addr_cnt__reg[8]|Q_net  ) );
      defparam \u_sdram_to_RGB_addr_cnt__reg[8] .INIT = 0;
      defparam \u_sdram_to_RGB_addr_cnt__reg[8] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_addr_cnt__reg[8] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_addr_cnt__reg[9]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0518 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \u_sdram_to_RGB_dma_start_xfer__reg|Q_net  ), .Q( \u_sdram_to_RGB_addr_cnt__reg[9]|Q_net  ) );
      defparam \u_sdram_to_RGB_addr_cnt__reg[9] .INIT = 0;
      defparam \u_sdram_to_RGB_addr_cnt__reg[9] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_addr_cnt__reg[9] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM u_sdram_to_RGB_ahm_rdata_push_wr0__reg ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0519 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_ahm_rdata_push_wr0__reg|Q_net  ) );
      defparam u_sdram_to_RGB_ahm_rdata_push_wr0__reg.INIT = 0;
      defparam u_sdram_to_RGB_ahm_rdata_push_wr0__reg.PLACE_LOCATION = "NONE";
      defparam u_sdram_to_RGB_ahm_rdata_push_wr0__reg.PCK_LOCATION = "NONE";
    CS_REGA_PRIM u_sdram_to_RGB_ahm_rdata_push_wr1__reg ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0520 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_ahm_rdata_push_wr1__reg|Q_net  ) );
      defparam u_sdram_to_RGB_ahm_rdata_push_wr1__reg.INIT = 0;
      defparam u_sdram_to_RGB_ahm_rdata_push_wr1__reg.PLACE_LOCATION = "NONE";
      defparam u_sdram_to_RGB_ahm_rdata_push_wr1__reg.PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_ahm_rdata_r__reg[0]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[0]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_ahm_rdata_r__reg[0]|Q_net  ) );
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[0] .INIT = 0;
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[0] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[0] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_ahm_rdata_r__reg[10]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[10]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_ahm_rdata_r__reg[10]|Q_net  ) );
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[10] .INIT = 0;
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[10] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[10] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_ahm_rdata_r__reg[11]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[11]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_ahm_rdata_r__reg[11]|Q_net  ) );
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[11] .INIT = 0;
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[11] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[11] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_ahm_rdata_r__reg[12]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[12]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_ahm_rdata_r__reg[12]|Q_net  ) );
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[12] .INIT = 0;
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[12] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[12] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_ahm_rdata_r__reg[13]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[13]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_ahm_rdata_r__reg[13]|Q_net  ) );
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[13] .INIT = 0;
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[13] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[13] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_ahm_rdata_r__reg[14]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[14]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_ahm_rdata_r__reg[14]|Q_net  ) );
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[14] .INIT = 0;
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[14] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[14] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_ahm_rdata_r__reg[15]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[15]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_ahm_rdata_r__reg[15]|Q_net  ) );
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[15] .INIT = 0;
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[15] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[15] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_ahm_rdata_r__reg[16]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[16]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_ahm_rdata_r__reg[16]|Q_net  ) );
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[16] .INIT = 0;
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[16] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[16] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_ahm_rdata_r__reg[17]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[17]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_ahm_rdata_r__reg[17]|Q_net  ) );
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[17] .INIT = 0;
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[17] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[17] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_ahm_rdata_r__reg[18]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[18]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_ahm_rdata_r__reg[18]|Q_net  ) );
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[18] .INIT = 0;
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[18] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[18] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_ahm_rdata_r__reg[19]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[19]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_ahm_rdata_r__reg[19]|Q_net  ) );
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[19] .INIT = 0;
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[19] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[19] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_ahm_rdata_r__reg[1]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[1]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_ahm_rdata_r__reg[1]|Q_net  ) );
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[1] .INIT = 0;
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[1] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[1] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_ahm_rdata_r__reg[20]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[20]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_ahm_rdata_r__reg[20]|Q_net  ) );
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[20] .INIT = 0;
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[20] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[20] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_ahm_rdata_r__reg[21]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[21]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_ahm_rdata_r__reg[21]|Q_net  ) );
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[21] .INIT = 0;
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[21] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[21] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_ahm_rdata_r__reg[22]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[22]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_ahm_rdata_r__reg[22]|Q_net  ) );
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[22] .INIT = 0;
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[22] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[22] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_ahm_rdata_r__reg[23]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[23]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_ahm_rdata_r__reg[23]|Q_net  ) );
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[23] .INIT = 0;
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[23] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[23] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_ahm_rdata_r__reg[24]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[24]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_ahm_rdata_r__reg[24]|Q_net  ) );
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[24] .INIT = 0;
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[24] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[24] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_ahm_rdata_r__reg[25]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[25]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_ahm_rdata_r__reg[25]|Q_net  ) );
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[25] .INIT = 0;
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[25] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[25] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_ahm_rdata_r__reg[26]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[26]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_ahm_rdata_r__reg[26]|Q_net  ) );
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[26] .INIT = 0;
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[26] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[26] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_ahm_rdata_r__reg[27]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[27]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_ahm_rdata_r__reg[27]|Q_net  ) );
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[27] .INIT = 0;
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[27] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[27] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_ahm_rdata_r__reg[28]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[28]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_ahm_rdata_r__reg[28]|Q_net  ) );
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[28] .INIT = 0;
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[28] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[28] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_ahm_rdata_r__reg[29]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[29]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_ahm_rdata_r__reg[29]|Q_net  ) );
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[29] .INIT = 0;
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[29] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[29] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_ahm_rdata_r__reg[2]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[2]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_ahm_rdata_r__reg[2]|Q_net  ) );
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[2] .INIT = 0;
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[2] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[2] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_ahm_rdata_r__reg[30]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[30]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_ahm_rdata_r__reg[30]|Q_net  ) );
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[30] .INIT = 0;
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[30] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[30] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_ahm_rdata_r__reg[31]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[31]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_ahm_rdata_r__reg[31]|Q_net  ) );
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[31] .INIT = 0;
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[31] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[31] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_ahm_rdata_r__reg[3]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[3]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_ahm_rdata_r__reg[3]|Q_net  ) );
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[3] .INIT = 0;
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[3] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[3] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_ahm_rdata_r__reg[4]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[4]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_ahm_rdata_r__reg[4]|Q_net  ) );
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[4] .INIT = 0;
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[4] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[4] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_ahm_rdata_r__reg[5]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[5]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_ahm_rdata_r__reg[5]|Q_net  ) );
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[5] .INIT = 0;
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[5] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[5] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_ahm_rdata_r__reg[6]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[6]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_ahm_rdata_r__reg[6]|Q_net  ) );
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[6] .INIT = 0;
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[6] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[6] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_ahm_rdata_r__reg[7]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[7]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_ahm_rdata_r__reg[7]|Q_net  ) );
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[7] .INIT = 0;
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[7] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[7] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_ahm_rdata_r__reg[8]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[8]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_ahm_rdata_r__reg[8]|Q_net  ) );
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[8] .INIT = 0;
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[8] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[8] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_ahm_rdata_r__reg[9]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[9]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_ahm_rdata_r__reg[9]|Q_net  ) );
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[9] .INIT = 0;
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[9] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_ahm_rdata_r__reg[9] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_bmp_fig_chg__reg[0]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0521 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_bmp_fig_chg__reg[0]|Q_net  ) );
      defparam \u_sdram_to_RGB_bmp_fig_chg__reg[0] .INIT = 0;
      defparam \u_sdram_to_RGB_bmp_fig_chg__reg[0] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_bmp_fig_chg__reg[0] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_bmp_fig_chg__reg[1]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_bmp_fig_chg__reg[0]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_bmp_fig_chg__reg[1]|Q_net  ) );
      defparam \u_sdram_to_RGB_bmp_fig_chg__reg[1] .INIT = 0;
      defparam \u_sdram_to_RGB_bmp_fig_chg__reg[1] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_bmp_fig_chg__reg[1] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_bmp_fig_cnt__reg[0]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0522 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0523 ), .Q( \u_sdram_to_RGB_bmp_fig_cnt__reg[0]|Q_net  ) );
      defparam \u_sdram_to_RGB_bmp_fig_cnt__reg[0] .INIT = 0;
      defparam \u_sdram_to_RGB_bmp_fig_cnt__reg[0] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_bmp_fig_cnt__reg[0] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_bmp_fig_cnt__reg[1]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0524 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0523 ), .Q( \u_sdram_to_RGB_bmp_fig_cnt__reg[1]|Q_net  ) );
      defparam \u_sdram_to_RGB_bmp_fig_cnt__reg[1] .INIT = 0;
      defparam \u_sdram_to_RGB_bmp_fig_cnt__reg[1] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_bmp_fig_cnt__reg[1] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_bmp_fig_cnt__reg[2]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0525 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0523 ), .Q( \u_sdram_to_RGB_bmp_fig_cnt__reg[2]|Q_net  ) );
      defparam \u_sdram_to_RGB_bmp_fig_cnt__reg[2] .INIT = 0;
      defparam \u_sdram_to_RGB_bmp_fig_cnt__reg[2] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_bmp_fig_cnt__reg[2] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_bmp_fig_cnt__reg[3]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0527 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0523 ), .Q( \u_sdram_to_RGB_bmp_fig_cnt__reg[3]|Q_net  ) );
      defparam \u_sdram_to_RGB_bmp_fig_cnt__reg[3] .INIT = 0;
      defparam \u_sdram_to_RGB_bmp_fig_cnt__reg[3] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_bmp_fig_cnt__reg[3] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM u_sdram_to_RGB_buffer_rd_sel__reg ( .CLK( clkout0_u_lvds_pll_u0 ), .D( nn0528 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_buffer_rd_sel__reg|Q_net  ) );
      defparam u_sdram_to_RGB_buffer_rd_sel__reg.INIT = 0;
      defparam u_sdram_to_RGB_buffer_rd_sel__reg.PLACE_LOCATION = "NONE";
      defparam u_sdram_to_RGB_buffer_rd_sel__reg.PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_buffer_rd_sel_r__reg[0]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( \u_sdram_to_RGB_buffer_rd_sel__reg|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_buffer_rd_sel_r__reg[0]|Q_net  ) );
      defparam \u_sdram_to_RGB_buffer_rd_sel_r__reg[0] .INIT = 0;
      defparam \u_sdram_to_RGB_buffer_rd_sel_r__reg[0] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_buffer_rd_sel_r__reg[0] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_buffer_rd_sel_r__reg[1]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( \u_sdram_to_RGB_buffer_rd_sel_r__reg[0]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_buffer_rd_sel_r__reg[1]|Q_net  ) );
      defparam \u_sdram_to_RGB_buffer_rd_sel_r__reg[1] .INIT = 0;
      defparam \u_sdram_to_RGB_buffer_rd_sel_r__reg[1] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_buffer_rd_sel_r__reg[1] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM u_sdram_to_RGB_buffer_wr_sel__reg ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0529 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_buffer_wr_sel__reg|Q_net  ) );
      defparam u_sdram_to_RGB_buffer_wr_sel__reg.INIT = 0;
      defparam u_sdram_to_RGB_buffer_wr_sel__reg.PLACE_LOCATION = "NONE";
      defparam u_sdram_to_RGB_buffer_wr_sel__reg.PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_de_i_r__reg[0]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0530 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_de_i_r__reg[0]|Q_net  ) );
      defparam \u_sdram_to_RGB_de_i_r__reg[0] .INIT = 0;
      defparam \u_sdram_to_RGB_de_i_r__reg[0] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_de_i_r__reg[0] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_de_i_r__reg[1]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_de_i_r__reg[0]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_de_i_r__reg[1]|Q_net  ) );
      defparam \u_sdram_to_RGB_de_i_r__reg[1] .INIT = 0;
      defparam \u_sdram_to_RGB_de_i_r__reg[1] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_de_i_r__reg[1] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_de_i_r_sclk__reg[0]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( nn0530 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_de_i_r_sclk__reg[0]|Q_net  ) );
      defparam \u_sdram_to_RGB_de_i_r_sclk__reg[0] .INIT = 0;
      defparam \u_sdram_to_RGB_de_i_r_sclk__reg[0] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_de_i_r_sclk__reg[0] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_de_i_r_sclk__reg[1]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( \u_sdram_to_RGB_de_i_r_sclk__reg[0]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_de_i_r_sclk__reg[1]|Q_net  ) );
      defparam \u_sdram_to_RGB_de_i_r_sclk__reg[1] .INIT = 0;
      defparam \u_sdram_to_RGB_de_i_r_sclk__reg[1] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_de_i_r_sclk__reg[1] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_de_i_r_sclk__reg[2]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( \u_sdram_to_RGB_de_i_r_sclk__reg[1]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_de_i_r_sclk__reg[2]|Q_net  ) );
      defparam \u_sdram_to_RGB_de_i_r_sclk__reg[2] .INIT = 0;
      defparam \u_sdram_to_RGB_de_i_r_sclk__reg[2] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_de_i_r_sclk__reg[2] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_de_i_r_sclk__reg[3]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( \u_sdram_to_RGB_de_i_r_sclk__reg[2]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_de_i_r_sclk__reg[3]|Q_net  ) );
      defparam \u_sdram_to_RGB_de_i_r_sclk__reg[3] .INIT = 0;
      defparam \u_sdram_to_RGB_de_i_r_sclk__reg[3] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_de_i_r_sclk__reg[3] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM u_sdram_to_RGB_de_i_start_pulse__reg ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0531 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_de_i_start_pulse__reg|Q_net  ) );
      defparam u_sdram_to_RGB_de_i_start_pulse__reg.INIT = 0;
      defparam u_sdram_to_RGB_de_i_start_pulse__reg.PLACE_LOCATION = "NONE";
      defparam u_sdram_to_RGB_de_i_start_pulse__reg.PCK_LOCATION = "NONE";
    CS_REGA_PRIM u_sdram_to_RGB_de_o__reg ( .CLK( clkout0_u_lvds_pll_u0 ), .D( \u_sdram_to_RGB_de_i_r_sclk__reg[3]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_de_o__reg|Q_net  ) );
      defparam u_sdram_to_RGB_de_o__reg.INIT = 0;
      defparam u_sdram_to_RGB_de_o__reg.PLACE_LOCATION = "NONE";
      defparam u_sdram_to_RGB_de_o__reg.PCK_LOCATION = "NONE";
    CS_REGA_PRIM u_sdram_to_RGB_display_before_bmp__reg ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0532 ), .RST( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .SET( nn0462 ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_display_before_bmp__reg|Q_net  ) );
      defparam u_sdram_to_RGB_display_before_bmp__reg.INIT = 0;
      defparam u_sdram_to_RGB_display_before_bmp__reg.PLACE_LOCATION = "NONE";
      defparam u_sdram_to_RGB_display_before_bmp__reg.PCK_LOCATION = "NONE";
    CS_REGA_PRIM u_sdram_to_RGB_display_period_align__reg ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0534 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_display_period_align__reg|Q_net  ) );
      defparam u_sdram_to_RGB_display_period_align__reg.INIT = 0;
      defparam u_sdram_to_RGB_display_period_align__reg.PLACE_LOCATION = "NONE";
      defparam u_sdram_to_RGB_display_period_align__reg.PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_dma_addr__reg[10]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_addr_cnt__reg[0]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_dma_addr__reg[10]|Q_net  ) );
      defparam \u_sdram_to_RGB_dma_addr__reg[10] .INIT = 0;
      defparam \u_sdram_to_RGB_dma_addr__reg[10] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_dma_addr__reg[10] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_dma_addr__reg[11]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_addr_cnt__reg[1]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_dma_addr__reg[11]|Q_net  ) );
      defparam \u_sdram_to_RGB_dma_addr__reg[11] .INIT = 0;
      defparam \u_sdram_to_RGB_dma_addr__reg[11] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_dma_addr__reg[11] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_dma_addr__reg[12]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_addr_cnt__reg[2]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_dma_addr__reg[12]|Q_net  ) );
      defparam \u_sdram_to_RGB_dma_addr__reg[12] .INIT = 0;
      defparam \u_sdram_to_RGB_dma_addr__reg[12] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_dma_addr__reg[12] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_dma_addr__reg[13]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_addr_cnt__reg[3]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_dma_addr__reg[13]|Q_net  ) );
      defparam \u_sdram_to_RGB_dma_addr__reg[13] .INIT = 0;
      defparam \u_sdram_to_RGB_dma_addr__reg[13] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_dma_addr__reg[13] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_dma_addr__reg[14]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_addr_cnt__reg[4]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_dma_addr__reg[14]|Q_net  ) );
      defparam \u_sdram_to_RGB_dma_addr__reg[14] .INIT = 0;
      defparam \u_sdram_to_RGB_dma_addr__reg[14] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_dma_addr__reg[14] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_dma_addr__reg[15]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_addr_cnt__reg[5]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_dma_addr__reg[15]|Q_net  ) );
      defparam \u_sdram_to_RGB_dma_addr__reg[15] .INIT = 0;
      defparam \u_sdram_to_RGB_dma_addr__reg[15] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_dma_addr__reg[15] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_dma_addr__reg[16]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0535 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_dma_addr__reg[16]|Q_net  ) );
      defparam \u_sdram_to_RGB_dma_addr__reg[16] .INIT = 0;
      defparam \u_sdram_to_RGB_dma_addr__reg[16] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_dma_addr__reg[16] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_dma_addr__reg[17]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0536 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_dma_addr__reg[17]|Q_net  ) );
      defparam \u_sdram_to_RGB_dma_addr__reg[17] .INIT = 0;
      defparam \u_sdram_to_RGB_dma_addr__reg[17] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_dma_addr__reg[17] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_dma_addr__reg[18]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0537 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_dma_addr__reg[18]|Q_net  ) );
      defparam \u_sdram_to_RGB_dma_addr__reg[18] .INIT = 0;
      defparam \u_sdram_to_RGB_dma_addr__reg[18] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_dma_addr__reg[18] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_dma_addr__reg[19]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0538 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_dma_addr__reg[19]|Q_net  ) );
      defparam \u_sdram_to_RGB_dma_addr__reg[19] .INIT = 0;
      defparam \u_sdram_to_RGB_dma_addr__reg[19] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_dma_addr__reg[19] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_dma_addr__reg[20]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0539 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_dma_addr__reg[20]|Q_net  ) );
      defparam \u_sdram_to_RGB_dma_addr__reg[20] .INIT = 0;
      defparam \u_sdram_to_RGB_dma_addr__reg[20] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_dma_addr__reg[20] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_dma_addr__reg[21]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0540 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_dma_addr__reg[21]|Q_net  ) );
      defparam \u_sdram_to_RGB_dma_addr__reg[21] .INIT = 0;
      defparam \u_sdram_to_RGB_dma_addr__reg[21] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_dma_addr__reg[21] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_dma_addr__reg[22]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0541 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_dma_addr__reg[22]|Q_net  ) );
      defparam \u_sdram_to_RGB_dma_addr__reg[22] .INIT = 0;
      defparam \u_sdram_to_RGB_dma_addr__reg[22] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_dma_addr__reg[22] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_dma_addr__reg[23]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0542 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_dma_addr__reg[23]|Q_net  ) );
      defparam \u_sdram_to_RGB_dma_addr__reg[23] .INIT = 0;
      defparam \u_sdram_to_RGB_dma_addr__reg[23] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_dma_addr__reg[23] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_dma_addr__reg[24]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0543 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_dma_addr__reg[24]|Q_net  ) );
      defparam \u_sdram_to_RGB_dma_addr__reg[24] .INIT = 0;
      defparam \u_sdram_to_RGB_dma_addr__reg[24] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_dma_addr__reg[24] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_dma_addr__reg[25]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0544 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_dma_addr__reg[25]|Q_net  ) );
      defparam \u_sdram_to_RGB_dma_addr__reg[25] .INIT = 0;
      defparam \u_sdram_to_RGB_dma_addr__reg[25] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_dma_addr__reg[25] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_dma_addr__reg[26]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_dma_addr__reg[26]|Q_net  ) );
      defparam \u_sdram_to_RGB_dma_addr__reg[26] .INIT = 0;
      defparam \u_sdram_to_RGB_dma_addr__reg[26] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_dma_addr__reg[26] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_dma_addr__reg[27]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_dma_addr__reg[27]|Q_net  ) );
      defparam \u_sdram_to_RGB_dma_addr__reg[27] .INIT = 0;
      defparam \u_sdram_to_RGB_dma_addr__reg[27] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_dma_addr__reg[27] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_dma_addr__reg[28]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_dma_addr__reg[28]|Q_net  ) );
      defparam \u_sdram_to_RGB_dma_addr__reg[28] .INIT = 0;
      defparam \u_sdram_to_RGB_dma_addr__reg[28] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_dma_addr__reg[28] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_dma_addr__reg[29]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_dma_addr__reg[29]|Q_net  ) );
      defparam \u_sdram_to_RGB_dma_addr__reg[29] .INIT = 0;
      defparam \u_sdram_to_RGB_dma_addr__reg[29] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_dma_addr__reg[29] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_dma_addr__reg[2]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_dma_addr__reg[2]|Q_net  ) );
      defparam \u_sdram_to_RGB_dma_addr__reg[2] .INIT = 0;
      defparam \u_sdram_to_RGB_dma_addr__reg[2] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_dma_addr__reg[2] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_dma_addr__reg[30]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( display_sel ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_dma_addr__reg[30]|Q_net  ) );
      defparam \u_sdram_to_RGB_dma_addr__reg[30] .INIT = 0;
      defparam \u_sdram_to_RGB_dma_addr__reg[30] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_dma_addr__reg[30] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_dma_addr__reg[31]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_dma_addr__reg[31]|Q_net  ) );
      defparam \u_sdram_to_RGB_dma_addr__reg[31] .INIT = 0;
      defparam \u_sdram_to_RGB_dma_addr__reg[31] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_dma_addr__reg[31] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_dma_addr__reg[3]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_dma_addr__reg[3]|Q_net  ) );
      defparam \u_sdram_to_RGB_dma_addr__reg[3] .INIT = 0;
      defparam \u_sdram_to_RGB_dma_addr__reg[3] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_dma_addr__reg[3] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_dma_addr__reg[4]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_dma_addr__reg[4]|Q_net  ) );
      defparam \u_sdram_to_RGB_dma_addr__reg[4] .INIT = 0;
      defparam \u_sdram_to_RGB_dma_addr__reg[4] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_dma_addr__reg[4] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_dma_addr__reg[5]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_dma_addr__reg[5]|Q_net  ) );
      defparam \u_sdram_to_RGB_dma_addr__reg[5] .INIT = 0;
      defparam \u_sdram_to_RGB_dma_addr__reg[5] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_dma_addr__reg[5] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_dma_addr__reg[6]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_dma_addr__reg[6]|Q_net  ) );
      defparam \u_sdram_to_RGB_dma_addr__reg[6] .INIT = 0;
      defparam \u_sdram_to_RGB_dma_addr__reg[6] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_dma_addr__reg[6] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_dma_addr__reg[7]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_dma_addr__reg[7]|Q_net  ) );
      defparam \u_sdram_to_RGB_dma_addr__reg[7] .INIT = 0;
      defparam \u_sdram_to_RGB_dma_addr__reg[7] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_dma_addr__reg[7] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_dma_addr__reg[8]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_dma_addr__reg[8]|Q_net  ) );
      defparam \u_sdram_to_RGB_dma_addr__reg[8] .INIT = 0;
      defparam \u_sdram_to_RGB_dma_addr__reg[8] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_dma_addr__reg[8] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_dma_addr__reg[9]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_dma_addr__reg[9]|Q_net  ) );
      defparam \u_sdram_to_RGB_dma_addr__reg[9] .INIT = 0;
      defparam \u_sdram_to_RGB_dma_addr__reg[9] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_dma_addr__reg[9] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM u_sdram_to_RGB_dma_start_xfer__reg ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_dma_start_xfer_prev__reg|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_dma_start_xfer__reg|Q_net  ) );
      defparam u_sdram_to_RGB_dma_start_xfer__reg.INIT = 0;
      defparam u_sdram_to_RGB_dma_start_xfer__reg.PLACE_LOCATION = "NONE";
      defparam u_sdram_to_RGB_dma_start_xfer__reg.PCK_LOCATION = "NONE";
    CS_REGA_PRIM u_sdram_to_RGB_dma_start_xfer_prev__reg ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0545 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_dma_start_xfer_prev__reg|Q_net  ) );
      defparam u_sdram_to_RGB_dma_start_xfer_prev__reg.INIT = 0;
      defparam u_sdram_to_RGB_dma_start_xfer_prev__reg.PLACE_LOCATION = "NONE";
      defparam u_sdram_to_RGB_dma_start_xfer_prev__reg.PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_addr_rd__reg[0]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( nn0546 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_addr_rd__reg[0]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_addr_rd__reg[0] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_addr_rd__reg[0] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_addr_rd__reg[0] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_addr_rd__reg[1]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( nn0547 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_addr_rd__reg[1]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_addr_rd__reg[1] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_addr_rd__reg[1] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_addr_rd__reg[1] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_addr_rd__reg[2]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( nn0548 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_addr_rd__reg[2]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_addr_rd__reg[2] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_addr_rd__reg[2] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_addr_rd__reg[2] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_addr_rd__reg[3]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( nn0550 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_addr_rd__reg[3]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_addr_rd__reg[3] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_addr_rd__reg[3] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_addr_rd__reg[3] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_addr_rd__reg[4]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( nn0552 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_addr_rd__reg[4]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_addr_rd__reg[4] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_addr_rd__reg[4] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_addr_rd__reg[4] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_addr_rd__reg[5]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( nn0554 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_addr_rd__reg[5]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_addr_rd__reg[5] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_addr_rd__reg[5] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_addr_rd__reg[5] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_addr_rd__reg[6]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( nn0555 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_addr_rd__reg[6]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_addr_rd__reg[6] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_addr_rd__reg[6] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_addr_rd__reg[6] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_addr_rd__reg[7]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( nn0557 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_addr_rd__reg[7]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_addr_rd__reg[7] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_addr_rd__reg[7] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_addr_rd__reg[7] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_addr_rd__reg[8]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( nn0558 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_addr_rd__reg[8]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_addr_rd__reg[8] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_addr_rd__reg[8] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_addr_rd__reg[8] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_addr_rd__reg[9]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( nn0560 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_addr_rd__reg[9]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_addr_rd__reg[9] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_addr_rd__reg[9] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_addr_rd__reg[9] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_addr_wr__reg[0]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0561 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_push__reg|Q_net  ), .Q( \u_sdram_to_RGB_emb_addr_wr__reg[0]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_addr_wr__reg[0] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_addr_wr__reg[0] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_addr_wr__reg[0] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_addr_wr__reg[1]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0562 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_push__reg|Q_net  ), .Q( \u_sdram_to_RGB_emb_addr_wr__reg[1]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_addr_wr__reg[1] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_addr_wr__reg[1] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_addr_wr__reg[1] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_addr_wr__reg[2]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0563 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_push__reg|Q_net  ), .Q( \u_sdram_to_RGB_emb_addr_wr__reg[2]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_addr_wr__reg[2] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_addr_wr__reg[2] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_addr_wr__reg[2] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_addr_wr__reg[3]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0564 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_push__reg|Q_net  ), .Q( \u_sdram_to_RGB_emb_addr_wr__reg[3]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_addr_wr__reg[3] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_addr_wr__reg[3] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_addr_wr__reg[3] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_addr_wr__reg[4]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0566 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_push__reg|Q_net  ), .Q( \u_sdram_to_RGB_emb_addr_wr__reg[4]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_addr_wr__reg[4] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_addr_wr__reg[4] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_addr_wr__reg[4] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_addr_wr__reg[5]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0567 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_push__reg|Q_net  ), .Q( \u_sdram_to_RGB_emb_addr_wr__reg[5]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_addr_wr__reg[5] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_addr_wr__reg[5] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_addr_wr__reg[5] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_addr_wr__reg[6]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0568 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_push__reg|Q_net  ), .Q( \u_sdram_to_RGB_emb_addr_wr__reg[6]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_addr_wr__reg[6] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_addr_wr__reg[6] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_addr_wr__reg[6] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_addr_wr__reg[7]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0570 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_push__reg|Q_net  ), .Q( \u_sdram_to_RGB_emb_addr_wr__reg[7]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_addr_wr__reg[7] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_addr_wr__reg[7] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_addr_wr__reg[7] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_addr_wr__reg[8]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0571 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_push__reg|Q_net  ), .Q( \u_sdram_to_RGB_emb_addr_wr__reg[8]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_addr_wr__reg[8] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_addr_wr__reg[8] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_addr_wr__reg[8] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_addr_wr_r__reg[0]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_emb_addr_wr__reg[0]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_addr_wr_r__reg[0]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_addr_wr_r__reg[0] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_addr_wr_r__reg[0] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_addr_wr_r__reg[0] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_addr_wr_r__reg[1]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_emb_addr_wr__reg[1]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_addr_wr_r__reg[1]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_addr_wr_r__reg[1] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_addr_wr_r__reg[1] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_addr_wr_r__reg[1] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_addr_wr_r__reg[2]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_emb_addr_wr__reg[2]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_addr_wr_r__reg[2]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_addr_wr_r__reg[2] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_addr_wr_r__reg[2] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_addr_wr_r__reg[2] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_addr_wr_r__reg[3]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_emb_addr_wr__reg[3]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_addr_wr_r__reg[3]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_addr_wr_r__reg[3] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_addr_wr_r__reg[3] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_addr_wr_r__reg[3] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_addr_wr_r__reg[4]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_emb_addr_wr__reg[4]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_addr_wr_r__reg[4]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_addr_wr_r__reg[4] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_addr_wr_r__reg[4] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_addr_wr_r__reg[4] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_addr_wr_r__reg[5]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_emb_addr_wr__reg[5]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_addr_wr_r__reg[5]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_addr_wr_r__reg[5] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_addr_wr_r__reg[5] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_addr_wr_r__reg[5] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_addr_wr_r__reg[6]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_emb_addr_wr__reg[6]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_addr_wr_r__reg[6]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_addr_wr_r__reg[6] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_addr_wr_r__reg[6] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_addr_wr_r__reg[6] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_addr_wr_r__reg[7]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_emb_addr_wr__reg[7]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_addr_wr_r__reg[7]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_addr_wr_r__reg[7] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_addr_wr_r__reg[7] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_addr_wr_r__reg[7] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_addr_wr_r__reg[8]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_emb_addr_wr__reg[8]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_addr_wr_r__reg[8]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_addr_wr_r__reg[8] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_addr_wr_r__reg[8] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_addr_wr_r__reg[8] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_rdata_0_r__reg[0]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( \q[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_rdata_0_r__reg[0]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_rdata_0_r__reg[0] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_rdata_0_r__reg[0] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_rdata_0_r__reg[0] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_rdata_0_r__reg[10]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( \q[2]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_rdata_0_r__reg[10]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_rdata_0_r__reg[10] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_rdata_0_r__reg[10] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_rdata_0_r__reg[10] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_rdata_0_r__reg[11]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( \q[2]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_rdata_0_r__reg[11]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_rdata_0_r__reg[11] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_rdata_0_r__reg[11] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_rdata_0_r__reg[11] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_rdata_0_r__reg[12]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( \q[3]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_rdata_0_r__reg[12]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_rdata_0_r__reg[12] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_rdata_0_r__reg[12] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_rdata_0_r__reg[12] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_rdata_0_r__reg[13]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( \q[3]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_rdata_0_r__reg[13]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_rdata_0_r__reg[13] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_rdata_0_r__reg[13] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_rdata_0_r__reg[13] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_rdata_0_r__reg[14]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( \q[3]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_rdata_0_r__reg[14]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_rdata_0_r__reg[14] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_rdata_0_r__reg[14] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_rdata_0_r__reg[14] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_rdata_0_r__reg[15]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( \q[3]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_rdata_0_r__reg[15]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_rdata_0_r__reg[15] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_rdata_0_r__reg[15] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_rdata_0_r__reg[15] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_rdata_0_r__reg[1]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( \q[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_rdata_0_r__reg[1]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_rdata_0_r__reg[1] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_rdata_0_r__reg[1] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_rdata_0_r__reg[1] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_rdata_0_r__reg[2]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( \q[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_rdata_0_r__reg[2]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_rdata_0_r__reg[2] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_rdata_0_r__reg[2] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_rdata_0_r__reg[2] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_rdata_0_r__reg[3]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( \q[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_rdata_0_r__reg[3]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_rdata_0_r__reg[3] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_rdata_0_r__reg[3] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_rdata_0_r__reg[3] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_rdata_0_r__reg[4]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( \q[1]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_rdata_0_r__reg[4]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_rdata_0_r__reg[4] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_rdata_0_r__reg[4] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_rdata_0_r__reg[4] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_rdata_0_r__reg[5]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( \q[1]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_rdata_0_r__reg[5]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_rdata_0_r__reg[5] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_rdata_0_r__reg[5] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_rdata_0_r__reg[5] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_rdata_0_r__reg[6]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( \q[1]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_2  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_rdata_0_r__reg[6]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_rdata_0_r__reg[6] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_rdata_0_r__reg[6] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_rdata_0_r__reg[6] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_rdata_0_r__reg[7]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( \q[1]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_3  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_rdata_0_r__reg[7]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_rdata_0_r__reg[7] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_rdata_0_r__reg[7] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_rdata_0_r__reg[7] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_rdata_0_r__reg[8]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( \q[2]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_rdata_0_r__reg[8]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_rdata_0_r__reg[8] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_rdata_0_r__reg[8] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_rdata_0_r__reg[8] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_rdata_0_r__reg[9]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( \q[2]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_1  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_rdata_0_r__reg[9]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_rdata_0_r__reg[9] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_rdata_0_r__reg[9] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_rdata_0_r__reg[9] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_rdata_1_r__reg[0]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( \q[0]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_rdata_1_r__reg[0]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_rdata_1_r__reg[0] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_rdata_1_r__reg[0] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_rdata_1_r__reg[0] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_rdata_1_r__reg[10]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( \q[2]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_rdata_1_r__reg[10]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_rdata_1_r__reg[10] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_rdata_1_r__reg[10] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_rdata_1_r__reg[10] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_rdata_1_r__reg[11]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( \q[2]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_rdata_1_r__reg[11]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_rdata_1_r__reg[11] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_rdata_1_r__reg[11] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_rdata_1_r__reg[11] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_rdata_1_r__reg[12]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( \q[3]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_rdata_1_r__reg[12]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_rdata_1_r__reg[12] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_rdata_1_r__reg[12] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_rdata_1_r__reg[12] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_rdata_1_r__reg[13]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( \q[3]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_rdata_1_r__reg[13]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_rdata_1_r__reg[13] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_rdata_1_r__reg[13] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_rdata_1_r__reg[13] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_rdata_1_r__reg[14]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( \q[3]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_rdata_1_r__reg[14]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_rdata_1_r__reg[14] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_rdata_1_r__reg[14] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_rdata_1_r__reg[14] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_rdata_1_r__reg[15]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( \q[3]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_rdata_1_r__reg[15]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_rdata_1_r__reg[15] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_rdata_1_r__reg[15] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_rdata_1_r__reg[15] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_rdata_1_r__reg[1]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( \q[0]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_rdata_1_r__reg[1]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_rdata_1_r__reg[1] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_rdata_1_r__reg[1] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_rdata_1_r__reg[1] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_rdata_1_r__reg[2]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( \q[0]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_rdata_1_r__reg[2]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_rdata_1_r__reg[2] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_rdata_1_r__reg[2] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_rdata_1_r__reg[2] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_rdata_1_r__reg[3]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( \q[0]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_rdata_1_r__reg[3]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_rdata_1_r__reg[3] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_rdata_1_r__reg[3] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_rdata_1_r__reg[3] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_rdata_1_r__reg[4]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( \q[1]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_rdata_1_r__reg[4]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_rdata_1_r__reg[4] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_rdata_1_r__reg[4] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_rdata_1_r__reg[4] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_rdata_1_r__reg[5]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( \q[1]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_rdata_1_r__reg[5]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_rdata_1_r__reg[5] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_rdata_1_r__reg[5] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_rdata_1_r__reg[5] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_rdata_1_r__reg[6]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( \q[1]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_2  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_rdata_1_r__reg[6]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_rdata_1_r__reg[6] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_rdata_1_r__reg[6] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_rdata_1_r__reg[6] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_rdata_1_r__reg[7]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( \q[1]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_3  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_rdata_1_r__reg[7]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_rdata_1_r__reg[7] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_rdata_1_r__reg[7] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_rdata_1_r__reg[7] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_rdata_1_r__reg[8]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( \q[2]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_0  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_rdata_1_r__reg[8]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_rdata_1_r__reg[8] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_rdata_1_r__reg[8] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_rdata_1_r__reg[8] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_rdata_1_r__reg[9]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( \q[2]_u_sdram_to_RGB_u_1kx16_1_u_emb5k_1  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_rdata_1_r__reg[9]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_rdata_1_r__reg[9] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_rdata_1_r__reg[9] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_rdata_1_r__reg[9] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_rdata_r__reg[0]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( nn0572 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_rdata_r__reg[0]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_rdata_r__reg[0] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_rdata_r__reg[0] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_rdata_r__reg[0] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_rdata_r__reg[10]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( nn0573 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_rdata_r__reg[10]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_rdata_r__reg[10] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_rdata_r__reg[10] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_rdata_r__reg[10] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_rdata_r__reg[11]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( nn0574 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_rdata_r__reg[11]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_rdata_r__reg[11] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_rdata_r__reg[11] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_rdata_r__reg[11] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_rdata_r__reg[12]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( nn0575 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_rdata_r__reg[12]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_rdata_r__reg[12] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_rdata_r__reg[12] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_rdata_r__reg[12] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_rdata_r__reg[13]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( nn0576 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_rdata_r__reg[13]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_rdata_r__reg[13] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_rdata_r__reg[13] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_rdata_r__reg[13] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_rdata_r__reg[14]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( nn0577 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_rdata_r__reg[14]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_rdata_r__reg[14] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_rdata_r__reg[14] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_rdata_r__reg[14] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_rdata_r__reg[15]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( nn0578 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_rdata_r__reg[15]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_rdata_r__reg[15] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_rdata_r__reg[15] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_rdata_r__reg[15] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_rdata_r__reg[1]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( nn0579 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_rdata_r__reg[1]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_rdata_r__reg[1] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_rdata_r__reg[1] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_rdata_r__reg[1] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_rdata_r__reg[2]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( nn0580 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_rdata_r__reg[2]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_rdata_r__reg[2] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_rdata_r__reg[2] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_rdata_r__reg[2] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_rdata_r__reg[3]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( nn0581 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_rdata_r__reg[3]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_rdata_r__reg[3] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_rdata_r__reg[3] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_rdata_r__reg[3] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_rdata_r__reg[4]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( nn0582 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_rdata_r__reg[4]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_rdata_r__reg[4] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_rdata_r__reg[4] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_rdata_r__reg[4] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_rdata_r__reg[5]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( nn0583 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_rdata_r__reg[5]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_rdata_r__reg[5] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_rdata_r__reg[5] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_rdata_r__reg[5] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_rdata_r__reg[6]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( nn0584 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_rdata_r__reg[6]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_rdata_r__reg[6] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_rdata_r__reg[6] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_rdata_r__reg[6] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_rdata_r__reg[7]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( nn0585 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_rdata_r__reg[7]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_rdata_r__reg[7] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_rdata_r__reg[7] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_rdata_r__reg[7] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_rdata_r__reg[8]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( nn0586 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_rdata_r__reg[8]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_rdata_r__reg[8] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_rdata_r__reg[8] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_rdata_r__reg[8] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_emb_rdata_r__reg[9]  ( .CLK( clkout0_u_lvds_pll_u0 ), .D( nn0587 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_emb_rdata_r__reg[9]|Q_net  ) );
      defparam \u_sdram_to_RGB_emb_rdata_r__reg[9] .INIT = 0;
      defparam \u_sdram_to_RGB_emb_rdata_r__reg[9] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_emb_rdata_r__reg[9] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM u_sdram_to_RGB_other_1_beat_start_pulse__reg ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0588 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_other_1_beat_start_pulse__reg|Q_net  ) );
      defparam u_sdram_to_RGB_other_1_beat_start_pulse__reg.INIT = 0;
      defparam u_sdram_to_RGB_other_1_beat_start_pulse__reg.PLACE_LOCATION = "NONE";
      defparam u_sdram_to_RGB_other_1_beat_start_pulse__reg.PCK_LOCATION = "NONE";
    CS_REGA_PRIM u_sdram_to_RGB_other_1_beat_valid__reg ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0589 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_other_1_beat_valid__reg|Q_net  ) );
      defparam u_sdram_to_RGB_other_1_beat_valid__reg.INIT = 0;
      defparam u_sdram_to_RGB_other_1_beat_valid__reg.PLACE_LOCATION = "NONE";
      defparam u_sdram_to_RGB_other_1_beat_valid__reg.PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_text__reg[7]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0590 ), .RST( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .SET( nn0462 ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_text__reg[7]|Q_net  ) );
      defparam \u_sdram_to_RGB_text__reg[7] .INIT = 0;
      defparam \u_sdram_to_RGB_text__reg[7] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_text__reg[7] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_text__reg[8]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0591 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_text__reg[8]|Q_net  ) );
      defparam \u_sdram_to_RGB_text__reg[8] .INIT = 0;
      defparam \u_sdram_to_RGB_text__reg[8] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_text__reg[8] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_text__reg[9]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0592 ), .RST( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .SET( nn0462 ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_text__reg[9]|Q_net  ) );
      defparam \u_sdram_to_RGB_text__reg[9] .INIT = 0;
      defparam \u_sdram_to_RGB_text__reg[9] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_text__reg[9] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_addr_count__reg[0]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0600 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0603 ), .Q( \u_sdram_to_RGB_u_ahb_master_addr_count__reg[0]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_addr_count__reg[0] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_addr_count__reg[0] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_addr_count__reg[0] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_addr_count__reg[1]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0604 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0603 ), .Q( \u_sdram_to_RGB_u_ahb_master_addr_count__reg[1]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_addr_count__reg[1] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_addr_count__reg[1] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_addr_count__reg[1] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_addr_count__reg[2]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0610 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0603 ), .Q( \u_sdram_to_RGB_u_ahb_master_addr_count__reg[2]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_addr_count__reg[2] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_addr_count__reg[2] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_addr_count__reg[2] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_addr_count__reg[3]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0615 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0603 ), .Q( \u_sdram_to_RGB_u_ahb_master_addr_count__reg[3]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_addr_count__reg[3] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_addr_count__reg[3] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_addr_count__reg[3] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_addr_count__reg[4]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0617 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0603 ), .Q( \u_sdram_to_RGB_u_ahb_master_addr_count__reg[4]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_addr_count__reg[4] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_addr_count__reg[4] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_addr_count__reg[4] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_addr_count__reg[5]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0619 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0603 ), .Q( \u_sdram_to_RGB_u_ahb_master_addr_count__reg[5]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_addr_count__reg[5] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_addr_count__reg[5] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_addr_count__reg[5] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_addr_count__reg[6]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0620 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0603 ), .Q( \u_sdram_to_RGB_u_ahb_master_addr_count__reg[6]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_addr_count__reg[6] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_addr_count__reg[6] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_addr_count__reg[6] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_addr_count__reg[7]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0622 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0603 ), .Q( \u_sdram_to_RGB_u_ahb_master_addr_count__reg[7]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_addr_count__reg[7] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_addr_count__reg[7] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_addr_count__reg[7] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_ahb_cs__reg[0]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0640 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_u_ahb_master_ahb_cs__reg[0]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_ahb_cs__reg[0] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_ahb_cs__reg[0] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_ahb_cs__reg[0] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_ahb_cs__reg[1]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0642 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_u_ahb_master_ahb_cs__reg[1]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_ahb_cs__reg[1] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_ahb_cs__reg[1] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_ahb_cs__reg[1] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_ahb_cs__reg[2]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0644 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_u_ahb_master_ahb_cs__reg[2]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_ahb_cs__reg[2] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_ahb_cs__reg[2] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_ahb_cs__reg[2] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM u_sdram_to_RGB_u_ahb_master_ahm_rdata_push__reg ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0646 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_push__reg|Q_net  ) );
      defparam u_sdram_to_RGB_u_ahb_master_ahm_rdata_push__reg.INIT = 0;
      defparam u_sdram_to_RGB_u_ahb_master_ahm_rdata_push__reg.PLACE_LOCATION = "NONE";
      defparam u_sdram_to_RGB_u_ahb_master_ahm_rdata_push__reg.PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[0]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \fp0_m_ahb_rdata[0]_u_arm_u_soc  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0646 ), .Q( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[0]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[0] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[0] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[0] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[10]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \fp0_m_ahb_rdata[10]_u_arm_u_soc  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0646 ), .Q( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[10]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[10] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[10] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[10] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[11]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \fp0_m_ahb_rdata[11]_u_arm_u_soc  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0646 ), .Q( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[11]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[11] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[11] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[11] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[12]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \fp0_m_ahb_rdata[12]_u_arm_u_soc  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0646 ), .Q( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[12]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[12] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[12] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[12] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[13]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \fp0_m_ahb_rdata[13]_u_arm_u_soc  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0646 ), .Q( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[13]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[13] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[13] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[13] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[14]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \fp0_m_ahb_rdata[14]_u_arm_u_soc  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0646 ), .Q( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[14]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[14] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[14] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[14] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[15]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \fp0_m_ahb_rdata[15]_u_arm_u_soc  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0646 ), .Q( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[15]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[15] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[15] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[15] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[16]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \fp0_m_ahb_rdata[16]_u_arm_u_soc  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0646 ), .Q( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[16]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[16] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[16] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[16] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[17]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \fp0_m_ahb_rdata[17]_u_arm_u_soc  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0646 ), .Q( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[17]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[17] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[17] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[17] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[18]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \fp0_m_ahb_rdata[18]_u_arm_u_soc  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0646 ), .Q( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[18]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[18] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[18] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[18] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[19]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \fp0_m_ahb_rdata[19]_u_arm_u_soc  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0646 ), .Q( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[19]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[19] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[19] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[19] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[1]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \fp0_m_ahb_rdata[1]_u_arm_u_soc  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0646 ), .Q( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[1]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[1] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[1] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[1] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[20]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \fp0_m_ahb_rdata[20]_u_arm_u_soc  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0646 ), .Q( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[20]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[20] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[20] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[20] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[21]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \fp0_m_ahb_rdata[21]_u_arm_u_soc  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0646 ), .Q( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[21]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[21] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[21] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[21] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[22]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \fp0_m_ahb_rdata[22]_u_arm_u_soc  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0646 ), .Q( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[22]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[22] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[22] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[22] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[23]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \fp0_m_ahb_rdata[23]_u_arm_u_soc  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0646 ), .Q( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[23]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[23] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[23] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[23] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[24]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \fp0_m_ahb_rdata[24]_u_arm_u_soc  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0646 ), .Q( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[24]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[24] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[24] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[24] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[25]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \fp0_m_ahb_rdata[25]_u_arm_u_soc  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0646 ), .Q( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[25]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[25] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[25] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[25] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[26]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \fp0_m_ahb_rdata[26]_u_arm_u_soc  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0646 ), .Q( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[26]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[26] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[26] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[26] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[27]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \fp0_m_ahb_rdata[27]_u_arm_u_soc  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0646 ), .Q( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[27]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[27] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[27] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[27] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[28]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \fp0_m_ahb_rdata[28]_u_arm_u_soc  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0646 ), .Q( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[28]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[28] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[28] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[28] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[29]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \fp0_m_ahb_rdata[29]_u_arm_u_soc  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0646 ), .Q( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[29]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[29] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[29] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[29] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[2]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \fp0_m_ahb_rdata[2]_u_arm_u_soc  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0646 ), .Q( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[2]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[2] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[2] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[2] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[30]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \fp0_m_ahb_rdata[30]_u_arm_u_soc  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0646 ), .Q( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[30]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[30] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[30] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[30] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[31]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \fp0_m_ahb_rdata[31]_u_arm_u_soc  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0646 ), .Q( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[31]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[31] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[31] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[31] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[3]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \fp0_m_ahb_rdata[3]_u_arm_u_soc  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0646 ), .Q( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[3]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[3] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[3] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[3] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[4]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \fp0_m_ahb_rdata[4]_u_arm_u_soc  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0646 ), .Q( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[4]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[4] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[4] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[4] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[5]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \fp0_m_ahb_rdata[5]_u_arm_u_soc  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0646 ), .Q( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[5]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[5] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[5] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[5] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[6]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \fp0_m_ahb_rdata[6]_u_arm_u_soc  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0646 ), .Q( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[6]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[6] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[6] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[6] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[7]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \fp0_m_ahb_rdata[7]_u_arm_u_soc  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0646 ), .Q( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[7]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[7] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[7] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[7] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[8]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \fp0_m_ahb_rdata[8]_u_arm_u_soc  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0646 ), .Q( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[8]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[8] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[8] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[8] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[9]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \fp0_m_ahb_rdata[9]_u_arm_u_soc  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0646 ), .Q( \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[9]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[9] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[9] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_ahm_rdata_r__reg[9] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM u_sdram_to_RGB_u_ahb_master_ahm_xfer_done__reg ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0647 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_u_ahb_master_ahm_xfer_done__reg|Q_net  ) );
      defparam u_sdram_to_RGB_u_ahb_master_ahm_xfer_done__reg.INIT = 0;
      defparam u_sdram_to_RGB_u_ahb_master_ahm_xfer_done__reg.PLACE_LOCATION = "NONE";
      defparam u_sdram_to_RGB_u_ahb_master_ahm_xfer_done__reg.PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_dma_cs__reg[0]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0649 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_u_ahb_master_dma_cs__reg[0]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_dma_cs__reg[0] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_dma_cs__reg[0] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_dma_cs__reg[0] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_dma_cs__reg[1]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0650 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_u_ahb_master_dma_cs__reg[1]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_dma_cs__reg[1] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_dma_cs__reg[1] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_dma_cs__reg[1] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM u_sdram_to_RGB_u_ahb_master_dma_eof_get__reg ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0651 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_u_ahb_master_dma_eof_get__reg|Q_net  ) );
      defparam u_sdram_to_RGB_u_ahb_master_dma_eof_get__reg.INIT = 0;
      defparam u_sdram_to_RGB_u_ahb_master_dma_eof_get__reg.PLACE_LOCATION = "NONE";
      defparam u_sdram_to_RGB_u_ahb_master_dma_eof_get__reg.PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[0]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0652 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0655 ), .Q( \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[0]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[0] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[0] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[0] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[10]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0660 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0655 ), .Q( \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[10]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[10] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[10] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[10] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[11]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0662 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0655 ), .Q( \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[11]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[11] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[11] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[11] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[12]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0664 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0655 ), .Q( \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[12]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[12] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[12] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[12] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[13]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0666 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0655 ), .Q( \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[13]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[13] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[13] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[13] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[14]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0669 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0655 ), .Q( \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[14]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[14] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[14] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[14] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[15]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0671 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0655 ), .Q( \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[15]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[15] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[15] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[15] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[16]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0673 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0655 ), .Q( \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[16]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[16] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[16] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[16] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[17]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0675 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0655 ), .Q( \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[17]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[17] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[17] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[17] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[18]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0677 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0655 ), .Q( \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[18]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[18] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[18] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[18] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[19]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0679 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0655 ), .Q( \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[19]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[19] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[19] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[19] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[1]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0680 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0655 ), .Q( \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[1]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[1] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[1] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[1] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[20]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0682 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0655 ), .Q( \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[20]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[20] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[20] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[20] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[21]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0685 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0655 ), .Q( \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[21]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[21] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[21] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[21] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[2]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0687 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0655 ), .Q( \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[2]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[2] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[2] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[2] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[3]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0688 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0655 ), .Q( \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[3]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[3] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[3] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[3] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[4]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0690 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0655 ), .Q( \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[4]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[4] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[4] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[4] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[5]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0692 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0655 ), .Q( \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[5]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[5] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[5] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[5] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[6]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0694 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0655 ), .Q( \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[6]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[6] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[6] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[6] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[7]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0696 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0655 ), .Q( \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[7]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[7] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[7] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[7] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[8]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0698 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0655 ), .Q( \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[8]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[8] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[8] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[8] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[9]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0700 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0655 ), .Q( \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[9]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[9] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[9] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_hi__reg[9] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[0]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0701 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0603 ), .Q( \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[0]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[0] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[0] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[0] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[1]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0702 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0603 ), .Q( \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[1]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[1] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[1] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[1] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[2]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0704 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0603 ), .Q( \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[2]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[2] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[2] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[2] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[3]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0706 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0603 ), .Q( \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[3]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[3] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[3] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[3] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[4]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0707 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0603 ), .Q( \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[4]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[4] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[4] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[4] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[5]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0709 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0603 ), .Q( \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[5]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[5] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[5] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[5] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[6]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0711 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0603 ), .Q( \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[6]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[6] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[6] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[6] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[7]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0712 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0603 ), .Q( \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[7]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[7] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[7] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_haddr_lo__reg[7] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_hburst_o__reg[0]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0713 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_u_ahb_master_hburst_o__reg[0]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_hburst_o__reg[0] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_hburst_o__reg[0] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_hburst_o__reg[0] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_hburst_o__reg[1]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0715 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_u_ahb_master_hburst_o__reg[1]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_hburst_o__reg[1] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_hburst_o__reg[1] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_hburst_o__reg[1] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_hburst_o__reg[2]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0716 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_u_ahb_master_hburst_o__reg[2]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_hburst_o__reg[2] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_hburst_o__reg[2] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_hburst_o__reg[2] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_htrans_o__reg[0]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0720 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_u_ahb_master_htrans_o__reg[0]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_htrans_o__reg[0] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_htrans_o__reg[0] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_htrans_o__reg[0] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_htrans_o__reg[1]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0721 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_u_ahb_master_htrans_o__reg[1]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_htrans_o__reg[1] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_htrans_o__reg[1] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_htrans_o__reg[1] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[0]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[0]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[0]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[0] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[0] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[0] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[10]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[10]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[10]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[10] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[10] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[10] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[11]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[11]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[11]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[11] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[11] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[11] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[12]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[12]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[12]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[12] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[12] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[12] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[13]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[13]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[13]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[13] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[13] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[13] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[14]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[14]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[14]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[14] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[14] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[14] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[15]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[15]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[15]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[15] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[15] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[15] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[16]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[16]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[16]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[16] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[16] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[16] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[17]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[17]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[17]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[17] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[17] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[17] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[18]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[18]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[18]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[18] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[18] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[18] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[19]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[19]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[19]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[19] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[19] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[19] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[1]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[1]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[1]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[1] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[1] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[1] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[20]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[20]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[20]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[20] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[20] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[20] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[21]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[21]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[21]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[21] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[21] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[21] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[22]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[22]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[22]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[22] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[22] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[22] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[23]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[23]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[23]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[23] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[23] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[23] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[24]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[24]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[24]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[24] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[24] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[24] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[25]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[25]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[25]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[25] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[25] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[25] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[26]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[26]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[26]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[26] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[26] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[26] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[27]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[27]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[27]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[27] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[27] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[27] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[28]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[28]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[28]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[28] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[28] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[28] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[29]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[29]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[29]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[29] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[29] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[29] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[2]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[2]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[2]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[2] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[2] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[2] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[30]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[30]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[30]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[30] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[30] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[30] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[31]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[31]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[31]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[31] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[31] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[31] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[3]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[3]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[3]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[3] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[3] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[3] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[4]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[4]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[4]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[4] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[4] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[4] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[5]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[5]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[5]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[5] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[5] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[5] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[6]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[6]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[6]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[6] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[6] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[6] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[7]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[7]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[7]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[7] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[7] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[7] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[8]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[8]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[8]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[8] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[8] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[8] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[9]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[9]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[9]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[9] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[9] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_hwdata_o__reg[9] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM u_sdram_to_RGB_u_ahb_master_hwrite_o__reg ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0722 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_u_ahb_master_hwrite_o__reg|Q_net  ) );
      defparam u_sdram_to_RGB_u_ahb_master_hwrite_o__reg.INIT = 0;
      defparam u_sdram_to_RGB_u_ahb_master_hwrite_o__reg.PLACE_LOCATION = "NONE";
      defparam u_sdram_to_RGB_u_ahb_master_hwrite_o__reg.PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[10]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0723 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0724 ), .Q( \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[10]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[10] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[10] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[10] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[11]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0725 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0724 ), .Q( \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[11]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[11] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[11] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[11] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[12]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0726 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0724 ), .Q( \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[12]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[12] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[12] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[12] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[13]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0727 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0724 ), .Q( \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[13]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[13] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[13] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[13] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[14]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0728 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0724 ), .Q( \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[14]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[14] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[14] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[14] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[15]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0729 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0724 ), .Q( \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[15]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[15] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[15] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[15] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[16]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0730 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0724 ), .Q( \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[16]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[16] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[16] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[16] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[17]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0731 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0724 ), .Q( \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[17]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[17] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[17] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[17] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[18]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0732 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0724 ), .Q( \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[18]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[18] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[18] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[18] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[19]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0733 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0724 ), .Q( \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[19]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[19] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[19] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[19] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[20]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0734 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0724 ), .Q( \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[20]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[20] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[20] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[20] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[21]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0735 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0724 ), .Q( \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[21]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[21] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[21] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[21] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[22]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0736 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0724 ), .Q( \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[22]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[22] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[22] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[22] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[23]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0737 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0724 ), .Q( \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[23]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[23] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[23] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[23] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[24]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0738 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0724 ), .Q( \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[24]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[24] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[24] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[24] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[25]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0739 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0724 ), .Q( \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[25]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[25] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[25] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[25] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[26]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0740 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0724 ), .Q( \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[26]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[26] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[26] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[26] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[27]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0741 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0724 ), .Q( \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[27]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[27] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[27] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[27] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[28]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0742 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0724 ), .Q( \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[28]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[28] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[28] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[28] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[29]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0743 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0724 ), .Q( \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[29]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[29] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[29] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[29] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[2]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0744 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0724 ), .Q( \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[2]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[2] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[2] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[2] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[30]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0745 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0724 ), .Q( \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[30]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[30] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[30] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[30] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[31]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0746 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0724 ), .Q( \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[31]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[31] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[31] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[31] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[3]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0747 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0724 ), .Q( \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[3]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[3] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[3] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[3] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[4]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0748 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0724 ), .Q( \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[4]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[4] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[4] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[4] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[5]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0749 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0724 ), .Q( \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[5]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[5] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[5] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[5] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[6]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0750 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0724 ), .Q( \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[6]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[6] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[6] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[6] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[7]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0751 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0724 ), .Q( \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[7]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[7] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[7] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[7] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[8]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0752 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0724 ), .Q( \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[8]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[8] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[8] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[8] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[9]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0753 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0724 ), .Q( \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[9]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[9] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[9] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_mx_addr__reg[9] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM u_sdram_to_RGB_u_ahb_master_mx_done_r__reg ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0648 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_u_ahb_master_mx_done_r__reg|Q_net  ) );
      defparam u_sdram_to_RGB_u_ahb_master_mx_done_r__reg.INIT = 0;
      defparam u_sdram_to_RGB_u_ahb_master_mx_done_r__reg.PLACE_LOCATION = "NONE";
      defparam u_sdram_to_RGB_u_ahb_master_mx_done_r__reg.PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_xfer_count__reg[0]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0756 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0757 ), .Q( \u_sdram_to_RGB_u_ahb_master_xfer_count__reg[0]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_xfer_count__reg[0] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_xfer_count__reg[0] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_xfer_count__reg[0] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_xfer_count__reg[1]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0776 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0757 ), .Q( \u_sdram_to_RGB_u_ahb_master_xfer_count__reg[1]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_xfer_count__reg[1] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_xfer_count__reg[1] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_xfer_count__reg[1] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_xfer_count__reg[2]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0777 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0757 ), .Q( \u_sdram_to_RGB_u_ahb_master_xfer_count__reg[2]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_xfer_count__reg[2] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_xfer_count__reg[2] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_xfer_count__reg[2] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_xfer_count__reg[3]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0778 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0757 ), .Q( \u_sdram_to_RGB_u_ahb_master_xfer_count__reg[3]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_xfer_count__reg[3] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_xfer_count__reg[3] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_xfer_count__reg[3] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_xfer_count__reg[4]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0779 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0757 ), .Q( \u_sdram_to_RGB_u_ahb_master_xfer_count__reg[4]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_xfer_count__reg[4] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_xfer_count__reg[4] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_xfer_count__reg[4] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_xfer_count__reg[5]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0780 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0757 ), .Q( \u_sdram_to_RGB_u_ahb_master_xfer_count__reg[5]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_xfer_count__reg[5] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_xfer_count__reg[5] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_xfer_count__reg[5] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_xfer_count__reg[6]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0781 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0757 ), .Q( \u_sdram_to_RGB_u_ahb_master_xfer_count__reg[6]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_xfer_count__reg[6] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_xfer_count__reg[6] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_xfer_count__reg[6] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_u_ahb_master_xfer_count__reg[7]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( nn0782 ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( nn0757 ), .Q( \u_sdram_to_RGB_u_ahb_master_xfer_count__reg[7]|Q_net  ) );
      defparam \u_sdram_to_RGB_u_ahb_master_xfer_count__reg[7] .INIT = 0;
      defparam \u_sdram_to_RGB_u_ahb_master_xfer_count__reg[7] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_u_ahb_master_xfer_count__reg[7] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_v_valid_r__reg[0]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_colorgen_v_valid__reg|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_v_valid_r__reg[0]|Q_net  ) );
      defparam \u_sdram_to_RGB_v_valid_r__reg[0] .INIT = 0;
      defparam \u_sdram_to_RGB_v_valid_r__reg[0] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_v_valid_r__reg[0] .PCK_LOCATION = "NONE";
    CS_REGA_PRIM \u_sdram_to_RGB_v_valid_r__reg[1]  ( .CLK( clkout1_u_pll_pll_u0 ), .D( \u_sdram_to_RGB_v_valid_r__reg[0]|Q_net  ), .RST( nn0462 ), .SET( \aa[0]_u_sdram_to_RGB_u_1kx16_0_u_emb5k_0  ), .CE( \fp0_m_ahb_prot[0]_u_arm_u_soc  ), .Q( \u_sdram_to_RGB_v_valid_r__reg[1]|Q_net  ) );
      defparam \u_sdram_to_RGB_v_valid_r__reg[1] .INIT = 0;
      defparam \u_sdram_to_RGB_v_valid_r__reg[1] .PLACE_LOCATION = "NONE";
      defparam \u_sdram_to_RGB_v_valid_r__reg[1] .PCK_LOCATION = "NONE";

endmodule


