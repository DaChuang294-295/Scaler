library verilog;
use verilog.vl_types.all;
entity Cal is
    generic(
        DATA_WIDTH      : integer := 16;
        ADDRESS_WIDTH   : integer := 11;
        SCALE_FRAC_WIDTH: integer := 6;
        SCALE_INT_WIDTH : integer := 2;
        BUFFER_SIZE     : integer := 4;
        INPUT_RES_WIDTH : integer := 11;
        OUTPUT_RES_WIDTH: integer := 11;
        BUFFER_SIZE_WIDTH: vl_notype;
        R_WIDTH         : vl_notype;
        G_WIDTH         : vl_notype;
        B_WIDTH         : vl_notype;
        SCALE_WIDTH     : vl_notype;
        CAL_WIDTH       : vl_notype
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        ramAddrIn       : in     vl_logic_vector;
        ramData00       : in     vl_logic_vector;
        ramData01       : in     vl_logic_vector;
        ramData10       : in     vl_logic_vector;
        ramData11       : in     vl_logic_vector;
        fifoNum         : in     vl_logic_vector;
        kX              : in     vl_logic_vector;
        kY              : in     vl_logic_vector;
        inXNum          : in     vl_logic_vector;
        inYNum          : in     vl_logic_vector;
        outXRes         : in     vl_logic_vector;
        outYRes         : in     vl_logic_vector;
        HS              : out    vl_logic;
        VS              : out    vl_logic;
        dOutEn          : out    vl_logic;
        jmp1            : out    vl_logic;
        jmp2            : out    vl_logic;
        ramRdAddr00     : out    vl_logic_vector;
        ramRdAddr01     : out    vl_logic_vector;
        ramRdAddr10     : out    vl_logic_vector;
        ramRdAddr11     : out    vl_logic_vector;
        dOut            : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of ADDRESS_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of SCALE_FRAC_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of SCALE_INT_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of BUFFER_SIZE : constant is 1;
    attribute mti_svvh_generic_type of INPUT_RES_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of OUTPUT_RES_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of BUFFER_SIZE_WIDTH : constant is 3;
    attribute mti_svvh_generic_type of R_WIDTH : constant is 3;
    attribute mti_svvh_generic_type of G_WIDTH : constant is 3;
    attribute mti_svvh_generic_type of B_WIDTH : constant is 3;
    attribute mti_svvh_generic_type of SCALE_WIDTH : constant is 3;
    attribute mti_svvh_generic_type of CAL_WIDTH : constant is 3;
end Cal;
