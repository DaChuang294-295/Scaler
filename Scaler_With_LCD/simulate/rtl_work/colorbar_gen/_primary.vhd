library verilog;
use verilog.vl_types.all;
entity colorbar_gen is
    generic(
        REG_HS_PIX      : vl_logic_vector(0 to 10) := (Hi1, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        REG_VS_PIX      : vl_logic_vector(0 to 9) := (Hi1, Hi1, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        REG_HW_PIX      : vl_logic_vector(0 to 10) := (Hi1, Hi0, Hi1, Hi0, Hi1, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        REG_VW_PIX      : vl_logic_vector(0 to 9) := (Hi1, Hi1, Hi0, Hi0, Hi1, Hi0, Hi0, Hi1, Hi1, Hi0)
    );
    port(
        clk             : in     vl_logic;
        rstn            : in     vl_logic;
        h_valid         : out    vl_logic;
        v_valid         : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of REG_HS_PIX : constant is 1;
    attribute mti_svvh_generic_type of REG_VS_PIX : constant is 1;
    attribute mti_svvh_generic_type of REG_HW_PIX : constant is 1;
    attribute mti_svvh_generic_type of REG_VW_PIX : constant is 1;
end colorbar_gen;
