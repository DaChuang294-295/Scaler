library verilog;
use verilog.vl_types.all;
entity TBUFDS is
    port(
        i               : in     vl_logic;
        t               : in     vl_logic;
        padp            : out    vl_logic;
        padn            : out    vl_logic
    );
end TBUFDS;
