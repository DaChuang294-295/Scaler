library verilog;
use verilog.vl_types.all;
entity CLKBUF is
    port(
        pad             : in     vl_logic;
        o               : out    vl_logic
    );
end CLKBUF;
