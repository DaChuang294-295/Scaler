library verilog;
use verilog.vl_types.all;
entity m7s_sync_trans2pluse is
    port(
        dst_rst_n       : in     vl_logic;
        dst_clk         : in     vl_logic;
        src_trans       : in     vl_logic;
        dst_pluse       : out    vl_logic
    );
end m7s_sync_trans2pluse;
