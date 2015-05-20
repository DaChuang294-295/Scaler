library verilog;
use verilog.vl_types.all;
entity m7s_ahb_bfm is
    generic(
        SIM_FIFO        : integer := 0;
        START_ADDR      : vl_logic_vector(31 downto 0) := (Hi1, Hi0, Hi1, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        ADDRESS_WIDTH   : integer := 9;
        DATA_WIDTH      : integer := 32;
        HADDR_WIDTH     : integer := 32
    );
    port(
        hclk            : in     vl_logic;
        haddr           : out    vl_logic_vector(31 downto 0);
        hburst          : out    vl_logic_vector(2 downto 0);
        hmasterlock     : out    vl_logic;
        hprot           : out    vl_logic_vector(3 downto 0);
        hsize           : out    vl_logic_vector(2 downto 0);
        htrans          : out    vl_logic_vector(1 downto 0);
        hwdata          : out    vl_logic_vector(31 downto 0);
        hwrite          : out    vl_logic;
        hsel            : out    vl_logic;
        hrdata          : in     vl_logic_vector(31 downto 0);
        hready          : in     vl_logic;
        hresp           : in     vl_logic;
        m_hclk          : in     vl_logic;
        m_hresetn       : in     vl_logic;
        m_haddr         : in     vl_logic_vector(31 downto 0);
        m_hburst        : in     vl_logic_vector(2 downto 0);
        m_hmasterlock   : in     vl_logic;
        m_hprot         : in     vl_logic_vector(3 downto 0);
        m_hsize         : in     vl_logic_vector(2 downto 0);
        m_htrans        : in     vl_logic_vector(1 downto 0);
        m_hwdata        : in     vl_logic_vector(31 downto 0);
        m_hwrite        : in     vl_logic;
        m_hsel          : in     vl_logic;
        m_hrdata        : out    vl_logic_vector(31 downto 0);
        m_hready        : out    vl_logic;
        m_hresp         : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of SIM_FIFO : constant is 1;
    attribute mti_svvh_generic_type of START_ADDR : constant is 1;
    attribute mti_svvh_generic_type of ADDRESS_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of HADDR_WIDTH : constant is 1;
end m7s_ahb_bfm;
