library verilog;
use verilog.vl_types.all;
entity LUT4C is
    generic(
        config_data     : string  := "0000";
        is_le_cin_inv   : string  := "false";
        is_ca_not_inv   : string  := "true";
        is_byp_used     : string  := "false";
        le_skip_en      : string  := "false";
        is_le_cin_below : string  := "false"
    );
    port(
        dx              : out    vl_logic;
        s               : out    vl_logic;
        co              : out    vl_logic;
        f3              : in     vl_logic;
        f2              : in     vl_logic;
        f1              : in     vl_logic;
        f0              : in     vl_logic;
        ci              : in     vl_logic;
        ca              : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of config_data : constant is 1;
    attribute mti_svvh_generic_type of is_le_cin_inv : constant is 1;
    attribute mti_svvh_generic_type of is_ca_not_inv : constant is 1;
    attribute mti_svvh_generic_type of is_byp_used : constant is 1;
    attribute mti_svvh_generic_type of le_skip_en : constant is 1;
    attribute mti_svvh_generic_type of is_le_cin_below : constant is 1;
end LUT4C;
