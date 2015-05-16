library verilog;
use verilog.vl_types.all;
entity CFG_DYN_SWITCH_S3 is
    generic(
        sel             : vl_logic_vector(0 to 2) := (Hi1, Hi0, Hi0);
        gclk_mux        : integer := 0
    );
    port(
        \out\           : out    vl_logic;
        in0             : in     vl_logic;
        in1             : in     vl_logic;
        fp_sel          : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of sel : constant is 1;
    attribute mti_svvh_generic_type of gclk_mux : constant is 1;
end CFG_DYN_SWITCH_S3;
