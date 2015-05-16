`timescale 1ns/1ns
`include "../../mcu_behave.v"

module test;

reg clk_i;
reg rstn_i;
reg display_sel;

comp cmp0(
    .clk_i      (clk_i      ),
    .rstn_i     (rstn_i     ),
    .display_sel(display_sel),
    .spi_ssn    (),
    .spi_sck    (),
    .spi_mosi   (),
    .spi_miso   (),
    .clk_out_p  (),
    .clk_out_n  (),
    .tx_out_p   (),
    .tx_out_n   ()
);

initial begin
    clk_i = 0;
    forever #25 clk_i = ~clk_i;
end
initial begin
    rstn_i = 0;
    display_sel = 1;
    repeat(10) @(negedge clk_i);
    #333 rstn_i = 1;
    repeat(100) @(negedge clk_i);
    repeat(5) @(negedge clk_i);

    repeat(4000)@(negedge clk_i);

    $finish;
end

endmodule

