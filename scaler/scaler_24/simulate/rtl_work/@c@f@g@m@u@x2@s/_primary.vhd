library verilog;
use verilog.vl_types.all;
entity CFGMUX2S is
    port(
        \out\           : out    vl_logic;
        in0             : in     vl_logic;
        in1             : in     vl_logic;
        sel             : in     vl_logic
    );
end CFGMUX2S;
