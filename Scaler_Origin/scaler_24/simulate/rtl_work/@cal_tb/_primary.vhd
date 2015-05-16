library verilog;
use verilog.vl_types.all;
entity Cal_tb is
    generic(
        DATA_WIDTH      : integer := 16;
        ADDRESS_WIDTH   : integer := 11;
        NUM_WIDTH       : integer := 8;
        FRACTION_WIDTH  : integer := 6;
        BUFFER_SIZE     : integer := 2;
        R_WIDTH         : vl_notype;
        G_WIDTH         : vl_notype;
        B_WIDTH         : vl_notype;
        CAL_WIDTH       : vl_notype;
        KINT_WIDTH      : vl_notype
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of ADDRESS_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of NUM_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of FRACTION_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of BUFFER_SIZE : constant is 1;
    attribute mti_svvh_generic_type of R_WIDTH : constant is 3;
    attribute mti_svvh_generic_type of G_WIDTH : constant is 3;
    attribute mti_svvh_generic_type of B_WIDTH : constant is 3;
    attribute mti_svvh_generic_type of CAL_WIDTH : constant is 3;
    attribute mti_svvh_generic_type of KINT_WIDTH : constant is 3;
end Cal_tb;
