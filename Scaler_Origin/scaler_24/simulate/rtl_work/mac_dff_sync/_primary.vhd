library verilog;
use verilog.vl_types.all;
entity mac_dff_sync is
    port(
        q               : out    vl_logic;
        clk             : in     vl_logic;
        d               : in     vl_logic;
        rstn            : in     vl_logic;
        setn            : in     vl_logic;
        cen             : in     vl_logic
    );
end mac_dff_sync;
