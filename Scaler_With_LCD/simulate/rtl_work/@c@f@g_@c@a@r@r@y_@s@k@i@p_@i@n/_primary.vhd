library verilog;
use verilog.vl_types.all;
entity CFG_CARRY_SKIP_IN is
    generic(
        is_le_cin_below : string  := "false";
        le_skip_en      : string  := "false";
        is_le_cin_inv   : string  := "false"
    );
    port(
        mux_alt_cin     : in     vl_logic;
        c4_in           : in     vl_logic;
        c_skip4_in      : in     vl_logic;
        c_skip8_in      : in     vl_logic;
        r4_in_b         : in     vl_logic;
        p4_in_b         : in     vl_logic;
        p8_in_b         : in     vl_logic;
        c_in            : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of is_le_cin_below : constant is 1;
    attribute mti_svvh_generic_type of le_skip_en : constant is 1;
    attribute mti_svvh_generic_type of is_le_cin_inv : constant is 1;
end CFG_CARRY_SKIP_IN;
