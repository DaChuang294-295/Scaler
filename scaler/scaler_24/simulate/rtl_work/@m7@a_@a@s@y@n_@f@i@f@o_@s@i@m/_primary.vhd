library verilog;
use verilog.vl_types.all;
entity M7A_ASYN_FIFO_SIM is
    generic(
        DWSIZE          : integer := 5;
        DRSIZE          : integer := 5;
        ASIZE           : integer := 14
    );
    port(
        fifo_clr        : in     vl_logic;
        w_width         : in     vl_logic_vector;
        r_width         : in     vl_logic_vector;
        af_level        : in     vl_logic_vector;
        ae_level        : in     vl_logic_vector;
        wr_req_n        : in     vl_logic;
        wclk            : in     vl_logic;
        wrst_n          : in     vl_logic;
        rd_req_n        : in     vl_logic;
        rclk            : in     vl_logic;
        rrst_n          : in     vl_logic;
        wfull           : out    vl_logic;
        wfull_almost    : out    vl_logic;
        rempty          : out    vl_logic;
        rempty_almost   : out    vl_logic;
        overflow        : out    vl_logic;
        underflow       : out    vl_logic;
        wr_ack          : out    vl_logic;
        rd_ack          : out    vl_logic;
        waddr_mem       : out    vl_logic_vector;
        raddr_mem       : out    vl_logic_vector;
        wr_mem_n        : out    vl_logic;
        rd_mem_n        : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DWSIZE : constant is 1;
    attribute mti_svvh_generic_type of DRSIZE : constant is 1;
    attribute mti_svvh_generic_type of ASIZE : constant is 1;
end M7A_ASYN_FIFO_SIM;
