library verilog;
use verilog.vl_types.all;
entity M7A_FIFO_CTRL is
    generic(
        r_width         : vl_logic_vector(0 to 4) := (Hi0, Hi0, Hi0, Hi0, Hi0);
        w_width         : vl_logic_vector(0 to 4) := (Hi0, Hi0, Hi0, Hi0, Hi0);
        af_level        : vl_logic_vector(0 to 14) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        ae_level        : vl_logic_vector(0 to 14) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        fifo_en         : vl_logic := Hi0;
        async_en        : vl_logic := Hi0
    );
    port(
        clka            : in     vl_logic;
        clkb            : in     vl_logic;
        rstna           : in     vl_logic;
        rstnb           : in     vl_logic;
        fifo_clr        : in     vl_logic;
        wr_req_n        : in     vl_logic;
        rd_req_n        : in     vl_logic;
        wfull           : out    vl_logic;
        wfull_almost    : out    vl_logic;
        rempty          : out    vl_logic;
        rempty_almost   : out    vl_logic;
        overflow        : out    vl_logic;
        wr_ack          : out    vl_logic;
        underflow       : out    vl_logic;
        rd_ack          : out    vl_logic;
        fifo_rda        : out    vl_logic_vector(13 downto 0);
        fifo_rdn        : out    vl_logic;
        fifo_wra        : out    vl_logic_vector(13 downto 0);
        fifo_wrn        : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of r_width : constant is 1;
    attribute mti_svvh_generic_type of w_width : constant is 1;
    attribute mti_svvh_generic_type of af_level : constant is 1;
    attribute mti_svvh_generic_type of ae_level : constant is 1;
    attribute mti_svvh_generic_type of fifo_en : constant is 1;
    attribute mti_svvh_generic_type of async_en : constant is 1;
end M7A_FIFO_CTRL;
