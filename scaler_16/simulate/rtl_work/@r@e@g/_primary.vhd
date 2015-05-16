library verilog;
use verilog.vl_types.all;
entity REG is
    generic(
        preset          : vl_logic := Hi0;
        ignore_shift    : string  := "true";
        use_reg_fdbk    : string  := "false";
        shift_direct    : string  := "up";
        is_en_used      : string  := "false";
        is_le_clk_inv   : string  := "false";
        is_le_has_clk   : string  := "true";
        le_lat_mode     : string  := "false";
        le_sync_mode    : string  := "false";
        le_sh0_always_en: string  := "false";
        le_sh1_always_en: string  := "false";
        is_le_en_not_inv: string  := "true";
        is_le_sr_inv    : string  := "false";
        is_le_sh0_en_not_inv: string  := "true";
        is_le_sh1_en_not_inv: string  := "true"
    );
    port(
        qx              : out    vl_logic;
        di              : in     vl_logic;
        a_sr            : in     vl_logic;
        en              : in     vl_logic;
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
    attribute mti_svvh_generic_type of use_reg_fdbk : constant is 1;
    attribute mti_svvh_generic_type of shift_direct : constant is 1;
    attribute mti_svvh_generic_type of is_en_used : constant is 1;
    attribute mti_svvh_generic_type of is_le_clk_inv : constant is 1;
    attribute mti_svvh_generic_type of is_le_has_clk : constant is 1;
    attribute mti_svvh_generic_type of le_lat_mode : constant is 1;
    attribute mti_svvh_generic_type of le_sync_mode : constant is 1;
    attribute mti_svvh_generic_type of le_sh0_always_en : constant is 1;
    attribute mti_svvh_generic_type of le_sh1_always_en : constant is 1;
    attribute mti_svvh_generic_type of is_le_en_not_inv : constant is 1;
    attribute mti_svvh_generic_type of is_le_sr_inv : constant is 1;
    attribute mti_svvh_generic_type of is_le_sh0_en_not_inv : constant is 1;
    attribute mti_svvh_generic_type of is_le_sh1_en_not_inv : constant is 1;
end REG;
