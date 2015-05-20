library verilog;
use verilog.vl_types.all;
entity lvds_tx_v1 is
    port(
        clk             : in     vl_logic;
        rstn            : in     vl_logic;
        clk_out_p       : out    vl_logic;
        clk_out_n       : out    vl_logic;
        tx_out_p        : out    vl_logic_vector(3 downto 0);
        tx_out_n        : out    vl_logic_vector(3 downto 0);
        tx_sclk         : out    vl_logic;
        tx_out          : in     vl_logic_vector(27 downto 0);
        tx_data_align_rstn: in     vl_logic
    );
end lvds_tx_v1;
