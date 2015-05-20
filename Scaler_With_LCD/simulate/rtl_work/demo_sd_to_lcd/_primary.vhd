library verilog;
use verilog.vl_types.all;
entity demo_sd_to_lcd is
    port(
        clk_i           : in     vl_logic;
        rstn_i          : in     vl_logic;
        display_sel     : in     vl_logic;
        spi_ssn         : out    vl_logic;
        spi_sck         : out    vl_logic;
        spi_mosi        : out    vl_logic;
        spi_miso        : in     vl_logic;
        clk_out_p       : out    vl_logic;
        clk_out_n       : out    vl_logic;
        tx_out_p        : out    vl_logic_vector(3 downto 0);
        tx_out_n        : out    vl_logic_vector(3 downto 0);
        buttonIn2       : in     vl_logic;
        buttonIn3       : in     vl_logic;
        buttonIn4       : in     vl_logic
    );
end demo_sd_to_lcd;
