library verilog;
use verilog.vl_types.all;
entity CLK_GATING is
    port(
        clk             : in     vl_logic;
        en              : in     vl_logic;
        clk_out         : out    vl_logic
    );
end CLK_GATING;
