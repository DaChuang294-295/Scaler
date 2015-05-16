library verilog;
use verilog.vl_types.all;
entity TBUF is
    port(
        i               : in     vl_logic;
        t               : in     vl_logic;
        pad             : out    vl_logic
    );
end TBUF;
