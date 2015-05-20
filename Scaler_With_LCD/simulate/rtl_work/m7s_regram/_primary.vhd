library verilog;
use verilog.vl_types.all;
entity m7s_regram is
    generic(
        DATASIZE        : integer := 8;
        ADDRSIZE        : integer := 4
    );
    port(
        A_clk           : in     vl_logic;
        A_rst_n         : in     vl_logic;
        A_d             : in     vl_logic_vector;
        A_addr          : in     vl_logic_vector;
        A_wr_n          : in     vl_logic;
        B_clk           : in     vl_logic;
        B_rst_n         : in     vl_logic;
        B_q             : out    vl_logic_vector;
        B_addr          : in     vl_logic_vector;
        B_rd_n          : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATASIZE : constant is 1;
    attribute mti_svvh_generic_type of ADDRSIZE : constant is 1;
end m7s_regram;
