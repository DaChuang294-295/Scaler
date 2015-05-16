library verilog;
use verilog.vl_types.all;
entity tb is
    generic(
        DATA_WIDTH      : integer := 16;
        INPUT_RES_WIDTH : integer := 11;
        SCALE_FRAC_BITS : integer := 6;
        SCALE_INT_BITS  : integer := 2;
        RAM_SIZE_WIDTH  : integer := 11;
        SCALE_BITS      : vl_notype;
        CAL_BITS        : vl_notype;
        INI             : vl_logic_vector(2 downto 0) := (Hi0, Hi0, Hi0);
        SWITCH_FRAME    : vl_logic_vector(2 downto 0) := (Hi0, Hi0, Hi1);
        SWITCH_ROW      : vl_logic_vector(2 downto 0) := (Hi0, Hi1, Hi0);
        PIX_IN          : vl_logic_vector(2 downto 0) := (Hi0, Hi1, Hi1);
        END_FRAME       : vl_logic_vector(2 downto 0) := (Hi1, Hi0, Hi0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of INPUT_RES_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of SCALE_FRAC_BITS : constant is 1;
    attribute mti_svvh_generic_type of SCALE_INT_BITS : constant is 1;
    attribute mti_svvh_generic_type of RAM_SIZE_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of SCALE_BITS : constant is 3;
    attribute mti_svvh_generic_type of CAL_BITS : constant is 3;
    attribute mti_svvh_generic_type of INI : constant is 2;
    attribute mti_svvh_generic_type of SWITCH_FRAME : constant is 2;
    attribute mti_svvh_generic_type of SWITCH_ROW : constant is 2;
    attribute mti_svvh_generic_type of PIX_IN : constant is 2;
    attribute mti_svvh_generic_type of END_FRAME : constant is 2;
end tb;
