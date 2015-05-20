library verilog;
use verilog.vl_types.all;
entity pll_v1 is
    port(
        clkin0          : in     vl_logic;
        clkout0         : out    vl_logic;
        clkout1         : out    vl_logic;
        clkout2         : out    vl_logic;
        locked          : out    vl_logic
    );
end pll_v1;
