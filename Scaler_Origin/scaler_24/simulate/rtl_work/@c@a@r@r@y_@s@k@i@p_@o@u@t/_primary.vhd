library verilog;
use verilog.vl_types.all;
entity CARRY_SKIP_OUT is
    generic(
        is_le_cin_below : string  := "false";
        le_skip_en      : string  := "false"
    );
    port(
        p4_in_b         : in     vl_logic;
        p0b             : in     vl_logic;
        p1b             : in     vl_logic;
        p2b             : in     vl_logic;
        p3b             : in     vl_logic;
        r4_out_b        : out    vl_logic;
        p4_out_b        : out    vl_logic;
        p8_out_b        : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of is_le_cin_below : constant is 1;
    attribute mti_svvh_generic_type of le_skip_en : constant is 1;
end CARRY_SKIP_OUT;
