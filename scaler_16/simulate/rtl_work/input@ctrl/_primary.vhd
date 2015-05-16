library verilog;
use verilog.vl_types.all;
entity inputCtrl is
    generic(
        DATA_WIDTH      : integer := 24;
        INPUT_RES_WIDTH : integer := 10;
        SCALE_FRAC_BITS : integer := 6;
        SCALE_INT_BITS  : integer := 2;
        RAM_SIZE_WIDTH  : integer := 12;
        SCALE_BITS      : vl_notype;
        CAL_BITS        : vl_notype
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        xBgn            : in     vl_logic_vector;
        xEnd            : in     vl_logic_vector;
        yBgn            : in     vl_logic_vector;
        yEnd            : in     vl_logic_vector;
        dInEn           : in     vl_logic;
        dIn             : in     vl_logic_vector;
        iHsyn           : in     vl_logic;
        iVsyn           : in     vl_logic;
        En              : in     vl_logic;
        kX              : in     vl_logic_vector;
        kY              : in     vl_logic_vector;
        ramWrtAddr      : out    vl_logic_vector;
        ramWrtEn        : out    vl_logic;
        dataOut         : out    vl_logic_vector;
        jmp             : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of INPUT_RES_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of SCALE_FRAC_BITS : constant is 1;
    attribute mti_svvh_generic_type of SCALE_INT_BITS : constant is 1;
    attribute mti_svvh_generic_type of RAM_SIZE_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of SCALE_BITS : constant is 3;
    attribute mti_svvh_generic_type of CAL_BITS : constant is 3;
end inputCtrl;
