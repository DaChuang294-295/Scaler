library verilog;
use verilog.vl_types.all;
entity BIBUFDS is
    port(
        i               : in     vl_logic;
        t               : in     vl_logic;
        o               : out    vl_logic;
        padp            : inout  vl_logic;
        padn            : inout  vl_logic
    );
end BIBUFDS;
