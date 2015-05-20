library verilog;
use verilog.vl_types.all;
entity m7s_sync_single is
    generic(
        SYNC_BW         : integer := 1;
        DEFAULT_VALUE   : integer := 0
    );
    port(
        dst_rst_n       : in     vl_logic;
        dst_clk         : in     vl_logic;
        src_dat         : in     vl_logic_vector;
        dst_dat         : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of SYNC_BW : constant is 1;
    attribute mti_svvh_generic_type of DEFAULT_VALUE : constant is 1;
end m7s_sync_single;
