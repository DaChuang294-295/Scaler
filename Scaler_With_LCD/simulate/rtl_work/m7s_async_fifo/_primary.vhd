library verilog;
use verilog.vl_types.all;
entity m7s_async_fifo is
    generic(
        DSIZE           : integer := 8;
        ASIZE           : integer := 4;
        AF_LEVEL        : integer := 12;
        AE_LEVEL        : integer := 4
    );
    port(
        clr             : in     vl_logic;
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
        waddr_mem       : out    vl_logic_vector;
        raddr_mem       : out    vl_logic_vector;
        wr_mem_n        : out    vl_logic;
        rd_mem_n        : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DSIZE : constant is 1;
    attribute mti_svvh_generic_type of ASIZE : constant is 1;
    attribute mti_svvh_generic_type of AF_LEVEL : constant is 1;
    attribute mti_svvh_generic_type of AE_LEVEL : constant is 1;
end m7s_async_fifo;
