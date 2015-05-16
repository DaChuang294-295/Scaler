library verilog;
use verilog.vl_types.all;
entity OBUF is
    port(
        i               : in     vl_logic;
        pad             : out    vl_logic
    );
end OBUF;
