library verilog;
use verilog.vl_types.all;
entity M7A_SPRAM is
    generic(
        spram_mode      : vl_logic_vector(0 to 1) := (Hi0, Hi1);
        init_file       : string  := ""
    );
    port(
        fp_r_data       : out    vl_logic_vector(31 downto 0);
        clk_mem_fp      : in     vl_logic;
        rst_mem_fp_n    : in     vl_logic;
        fp_ce_n         : in     vl_logic;
        fp_wr           : in     vl_logic;
        fp_w_data       : in     vl_logic_vector(31 downto 0);
        fp_addr         : in     vl_logic_vector(15 downto 0);
        fp_byte_en      : in     vl_logic_vector(3 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of spram_mode : constant is 1;
    attribute mti_svvh_generic_type of init_file : constant is 1;
end M7A_SPRAM;
