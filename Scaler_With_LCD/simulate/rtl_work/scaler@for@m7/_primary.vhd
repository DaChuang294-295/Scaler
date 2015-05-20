library verilog;
use verilog.vl_types.all;
entity scalerForM7 is
    generic(
        INPUT_RES_WIDTH : integer := 11;
        SCALE_FRAC_WIDTH: integer := 6;
        SCALE_INT_WIDTH : integer := 2;
        SCALE_BITS      : vl_notype;
        DATA_WIDTH      : integer := 16;
        RAM_ADDR_WIDTH  : integer := 11;
        OUTPUT_RES_WIDTH: integer := 11
    );
    port(
        clka            : in     vl_logic;
        clkb            : in     vl_logic;
        rst             : in     vl_logic;
        en              : in     vl_logic;
        h_valid         : out    vl_logic;
        v_valid         : out    vl_logic;
        dIn             : in     vl_logic_vector;
        dInEn           : in     vl_logic;
        dOut            : out    vl_logic_vector;
        dOutEn          : out    vl_logic;
        HS              : out    vl_logic;
        VS              : out    vl_logic;
        yEnd            : in     vl_logic_vector;
        button2         : in     vl_logic;
        button3         : in     vl_logic;
        button4         : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of INPUT_RES_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of SCALE_FRAC_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of SCALE_INT_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of SCALE_BITS : constant is 3;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of RAM_ADDR_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of OUTPUT_RES_WIDTH : constant is 1;
end scalerForM7;
