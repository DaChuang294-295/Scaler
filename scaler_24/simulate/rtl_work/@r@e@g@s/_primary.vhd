library verilog;
use verilog.vl_types.all;
entity REGS is
    generic(
        preset          : vl_logic := Hi0;
        ignore_shift    : string  := "false";
        shift_direct    : string  := "down";
        use_reg_fdbk    : string  := "false"
    );
    port(
        qx              : out    vl_logic;
        di              : in     vl_logic;
        a_sr            : in     vl_logic;
        mclk_b          : in     vl_logic;
        sclk            : in     vl_logic;
        shift           : in     vl_logic;
        qs              : out    vl_logic;
        up_i            : in     vl_logic;
        up_o            : out    vl_logic;
        down_i          : in     vl_logic;
        down_o          : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of preset : constant is 1;
    attribute mti_svvh_generic_type of ignore_shift : constant is 1;
    attribute mti_svvh_generic_type of shift_direct : constant is 1;
    attribute mti_svvh_generic_type of use_reg_fdbk : constant is 1;
end REGS;
