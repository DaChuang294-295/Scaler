library verilog;
use verilog.vl_types.all;
entity CONST is
    generic(
        sel             : vl_logic := Hi0
    );
    port(
        \out\           : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of sel : constant is 1;
end CONST;
