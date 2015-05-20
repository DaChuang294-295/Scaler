library verilog;
use verilog.vl_types.all;
entity sdram_to_RGB is
    port(
        clk_ahb         : in     vl_logic;
        rst_ahb_n       : in     vl_logic;
        m_ahb_mastlock  : out    vl_logic;
        m_ahb_prot      : out    vl_logic_vector(3 downto 0);
        m_ahb_size      : out    vl_logic_vector(2 downto 0);
        m_ahb_addr      : out    vl_logic_vector(31 downto 0);
        m_ahb_write     : out    vl_logic;
        m_ahb_burst     : out    vl_logic_vector(2 downto 0);
        m_ahb_trans     : out    vl_logic_vector(1 downto 0);
        m_ahb_wdata     : out    vl_logic_vector(31 downto 0);
        m_ahb_ready     : in     vl_logic;
        m_ahb_resp      : in     vl_logic;
        m_ahb_rdata     : in     vl_logic_vector(31 downto 0);
        display_sel     : in     vl_logic;
        gpio_out        : in     vl_logic_vector(31 downto 0);
        tx_sclk         : in     vl_logic;
        h_valid         : in     vl_logic;
        v_valid         : in     vl_logic;
        de_o            : out    vl_logic;
        pixel_r         : out    vl_logic_vector(7 downto 0);
        pixel_g         : out    vl_logic_vector(7 downto 0);
        pixel_b         : out    vl_logic_vector(7 downto 0);
        buttonIn2       : in     vl_logic;
        buttonIn3       : in     vl_logic;
        buttonIn4       : in     vl_logic
    );
end sdram_to_RGB;
