/*
* This is a file generated by EMB wizard.
* Please do not edit this file!
* Generated time: 05/30/2014 17:34:15
* Version: Primace 6.0 master
* Wizard name: EMB 1.0b
*
*/
// ============================================================
// File Name: emb_v1.v
// IP core : emb
// Device name: M7A12N0F484C7
// ============================================================

module emb_v1(
    clkw,
    cew,
    aw,
    dw,
    clkr,
    cer,
    ar,
    qr
);

input clkw;
input cew;
input [8:0] aw;
input [31:0] dw;
input clkr;
input cer;
input [9:0] ar;
output [15:0] qr;

wire [17:0] qr0;
wire [17:0] qr1;
wire [17:0] qr2;
wire [17:0] qr3;
assign qr = {qr3[3], qr2[3], qr1[3], qr0[3], qr3[2], qr2[2], qr1[2], qr0[2], qr3[1], qr2[1], qr1[1], qr0[1], qr3[0], qr2[0], qr1[0], qr0[0]};

M7S_EMB5K #(
        .modea_sel (4'b1100),
        .modeb_sel (4'b1000),
        .porta_wr_mode (2'b01),
        .portb_wr_mode (2'b01),
        .porta_reg_out (1'b0),
        .portb_reg_out (1'b0),
        .reset_value_a (9'b000000000),
        .reset_value_b (9'b000000000),
        .porta_data_width (4),
        .portb_data_width (8),
        .operation_mode ("simple_dual_port"),
        .init_file (""),
        .porta_prog (8'b11110000),
        .portb_prog (8'b00001111)
)
u_emb5k_0 (
        .clka (clkr),
        .clkb (clkw),
        .rstna (1'b1),
        .rstnb (1'b1),
        .cea (cer),
        .ceb (cew),
        .wea (1'b0),
        .web (1'b1),
        .aa ({ar[9:0], 2'b0}),
        .ab ({aw[8:0], 3'b0}),
        .da (),
        .db ({2'b0, dw[28], dw[24], dw[20], dw[16], dw[12], dw[8], dw[4], dw[0], dw[28], dw[24], dw[20], dw[16], dw[12], dw[8], dw[4], dw[0]}),
        .q (qr0)
);

M7S_EMB5K #(
        .modea_sel (4'b1100),
        .modeb_sel (4'b1000),
        .porta_wr_mode (2'b01),
        .portb_wr_mode (2'b01),
        .porta_reg_out (1'b0),
        .portb_reg_out (1'b0),
        .reset_value_a (9'b000000000),
        .reset_value_b (9'b000000000),
        .porta_data_width (4),
        .portb_data_width (8),
        .operation_mode ("simple_dual_port"),
        .init_file (""),
        .porta_prog (8'b11110000),
        .portb_prog (8'b00001111)
)
u_emb5k_1 (
        .clka (clkr),
        .clkb (clkw),
        .rstna (1'b1),
        .rstnb (1'b1),
        .cea (cer),
        .ceb (cew),
        .wea (1'b0),
        .web (1'b1),
        .aa ({ar[9:0], 2'b0}),
        .ab ({aw[8:0], 3'b0}),
        .da (),
        .db ({2'b0, dw[29], dw[25], dw[21], dw[17], dw[13], dw[9], dw[5], dw[1], dw[29], dw[25], dw[21], dw[17], dw[13], dw[9], dw[5], dw[1]}),
        .q (qr1)
);

M7S_EMB5K #(
        .modea_sel (4'b1100),
        .modeb_sel (4'b1000),
        .porta_wr_mode (2'b01),
        .portb_wr_mode (2'b01),
        .porta_reg_out (1'b0),
        .portb_reg_out (1'b0),
        .reset_value_a (9'b000000000),
        .reset_value_b (9'b000000000),
        .porta_data_width (4),
        .portb_data_width (8),
        .operation_mode ("simple_dual_port"),
        .init_file (""),
        .porta_prog (8'b11110000),
        .portb_prog (8'b00001111)
)
u_emb5k_2 (
        .clka (clkr),
        .clkb (clkw),
        .rstna (1'b1),
        .rstnb (1'b1),
        .cea (cer),
        .ceb (cew),
        .wea (1'b0),
        .web (1'b1),
        .aa ({ar[9:0], 2'b0}),
        .ab ({aw[8:0], 3'b0}),
        .da (),
        .db ({2'b0, dw[30], dw[26], dw[22], dw[18], dw[14], dw[10], dw[6], dw[2], dw[30], dw[26], dw[22], dw[18], dw[14], dw[10], dw[6], dw[2]}),
        .q (qr2)
);

M7S_EMB5K #(
        .modea_sel (4'b1100),
        .modeb_sel (4'b1000),
        .porta_wr_mode (2'b01),
        .portb_wr_mode (2'b01),
        .porta_reg_out (1'b0),
        .portb_reg_out (1'b0),
        .reset_value_a (9'b000000000),
        .reset_value_b (9'b000000000),
        .porta_data_width (4),
        .portb_data_width (8),
        .operation_mode ("simple_dual_port"),
        .init_file (""),
        .porta_prog (8'b11110000),
        .portb_prog (8'b00001111)
)
u_emb5k_3 (
        .clka (clkr),
        .clkb (clkw),
        .rstna (1'b1),
        .rstnb (1'b1),
        .cea (cer),
        .ceb (cew),
        .wea (1'b0),
        .web (1'b1),
        .aa ({ar[9:0], 2'b0}),
        .ab ({aw[8:0], 3'b0}),
        .da (),
        .db ({2'b0, dw[31], dw[27], dw[23], dw[19], dw[15], dw[11], dw[7], dw[3], dw[31], dw[27], dw[23], dw[19], dw[15], dw[11], dw[7], dw[3]}),
        .q (qr3)
);

endmodule

// ============================================================
//                  emb Setting
//
// Warning: This part is read by Primace, please don't modify it.
// ============================================================
// Device          : M7A12N0F484C7
// Module          : emb_v1
// IP core         : emb
// IP Version      : 1

// EmbType         : sdp
// EmbResource     : emb5k
// AHBMode         : ahb_unused
// BaseAddr        : a0000000
// DataUsedA       : 16
// DataUsedB       : 32
// AddrUsedA       : 10
// InitFile        : 
// WriteModeA      : write_first
// WriteModeB      : write_first
// OutResetA       : false
// OutResetB       : false
// OutResetValA    : 
// OutResetValB    : 
// RegoutA         : false
// RegoutB         : false
// Emb18kWidth     : false
// Emb18kDepth     : false
// AddrWidthB      : 9
// ModeA           : 1kx4
// ModeB           : 512x9
// DataExtA        : 4
// AddrExtA        : 1
// DataExtB        : 4
// AddrExtB        : 1
// BaseModeA       : 1024x4
// BaseModeB       : 512x8
// Synthesis Files : 
// Simulation Files: 
