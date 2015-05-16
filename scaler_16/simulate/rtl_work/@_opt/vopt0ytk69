library verilog;
use verilog.vl_types.all;
entity scaler is
    generic(
        INPUT_RES_WIDTH : integer := 11;
        SCALE_FRAC_BITS : integer := 6;
        SCALE_INT_BITS  : integer := 2;
        SCALE_BITS      : vl_notype;
        DATA_WIDTH      : integer := 16;
        RAM_ADDR_WIDTH  : integer := 11;
        OUTPUT_X_RES_WIDTH: integer := 11;
        OUTPUT_Y_RES_WIDTH: integer := 11;
        BUFFER_SIZE     : integer := 2
    );
    port(
        clka            : in     vl_logic;
        clkb            : in     vl_logic;
        rst             : in     vl_logic;
        en              : in     vl_logic;
        iHsyn           : in     vl_logic;
        iVsyn           : in     vl_logic;
        dIn             : in     vl_logic_vector;
        dInEn           : in     vl_logic;
        dOut            : out    vl_logic_vector;
        dOutEn          : out    vl_logic;
        HS              : out    vl_logic;
        VS              : out    vl_logic;
        xBgn            : in     vl_logic_vector;
        xEnd            : in     vl_logic_vector;
        yBgn            : in     vl_logic_vector;
        yEnd            : in     vl_logic_vector;
        inYRes          : in     vl_logic_vector;
        inXRes          : in     vl_logic_vector;
        outYRes         : in     vl_logic_vector;
        outXRes         : in     vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of INPUT_RES_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of SCALE_FRAC_BITS : constant is 1;
    attribute mti_svvh_generic_type of SCALE_INT_BITS : constant is 1;
    attribute mti_svvh_generic_type of SCALE_BITS : constant is 3;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of RAM_ADDR_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of OUTPUT_X_RES_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of OUTPUT_Y_RES_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of BUFFER_SIZE : constant is 1;
end scaler;
