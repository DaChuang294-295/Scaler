library verilog;
use verilog.vl_types.all;
entity ramFifo is
    generic(
        DATA_WIDTH      : integer := 16;
        ADDRESS_WIDTH   : integer := 11;
        BUFFER_SIZE     : integer := 3;
        BUFFER_SIZE_WIDTH: vl_notype
    );
    port(
        clka            : in     vl_logic;
        clkb            : in     vl_logic;
        rst             : in     vl_logic;
        advanceRead1    : in     vl_logic;
        advanceRead2    : in     vl_logic;
        advanceWrite    : in     vl_logic;
        writeData       : in     vl_logic_vector;
        writeAddress    : in     vl_logic_vector;
        writeEnable     : in     vl_logic;
        fillCount       : out    vl_logic_vector;
        readData00      : out    vl_logic_vector;
        readData01      : out    vl_logic_vector;
        readData10      : out    vl_logic_vector;
        readData11      : out    vl_logic_vector;
        readAddress00   : in     vl_logic_vector;
        readAddress01   : in     vl_logic_vector;
        readAddress10   : in     vl_logic_vector;
        readAddress11   : in     vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of ADDRESS_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of BUFFER_SIZE : constant is 1;
    attribute mti_svvh_generic_type of BUFFER_SIZE_WIDTH : constant is 3;
end ramFifo;
