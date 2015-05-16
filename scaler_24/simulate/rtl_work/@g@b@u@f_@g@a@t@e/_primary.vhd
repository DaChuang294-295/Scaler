library verilog;
use verilog.vl_types.all;
entity GBUF_GATE is
    port(
        clk             : in     vl_logic;
        en              : in     vl_logic;
        clk_out         : out    vl_logic
    );
end GBUF_GATE;
