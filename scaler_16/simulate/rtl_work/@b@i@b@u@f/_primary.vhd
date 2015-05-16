library verilog;
use verilog.vl_types.all;
entity BIBUF is
    port(
        i               : in     vl_logic;
        t               : in     vl_logic;
        o               : out    vl_logic;
        pad             : inout  vl_logic
    );
end BIBUF;
