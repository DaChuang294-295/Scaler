library verilog;
use verilog.vl_types.all;
entity coefCal is
    generic(
        INPUT_RES_WIDTH : integer := 11;
        OUTPUT_X_RES_WIDTH: integer := 11;
        OUTPUT_Y_RES_WIDTH: integer := 11;
        SCALE_BITS      : integer := 8
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        en              : in     vl_logic;
        xBgn            : in     vl_logic_vector;
        xEnd            : in     vl_logic_vector;
        yBgn            : in     vl_logic_vector;
        yEnd            : in     vl_logic_vector;
        inXRes          : in     vl_logic_vector;
        inYRes          : in     vl_logic_vector;
        outXRes         : in     vl_logic_vector;
        outYRes         : in     vl_logic_vector;
        kX              : out    vl_logic_vector;
        kY              : out    vl_logic_vector;
        calEn           : out    vl_logic;
        inEn            : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of INPUT_RES_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of OUTPUT_X_RES_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of OUTPUT_Y_RES_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of SCALE_BITS : constant is 1;
end coefCal;
