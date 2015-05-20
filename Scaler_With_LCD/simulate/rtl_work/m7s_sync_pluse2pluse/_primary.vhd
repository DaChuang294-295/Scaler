library verilog;
use verilog.vl_types.all;
entity m7s_sync_pluse2pluse is
    port(
        src_rst_n       : in     vl_logic;
        src_clk         : in     vl_logic;
        dst_rst_n       : in     vl_logic;
        dst_clk         : in     vl_logic;
        src_pluse       : in     vl_logic;
        dst_pluse       : out    vl_logic
    );
end m7s_sync_pluse2pluse;
