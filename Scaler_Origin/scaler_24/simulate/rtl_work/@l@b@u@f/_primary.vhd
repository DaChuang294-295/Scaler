library verilog;
use verilog.vl_types.all;
entity LBUF is
    generic(
        is_en_used      : string  := "true";
        is_le_clk_inv   : string  := "false";
        is_le_has_clk   : string  := "false";
        le_lat_mode     : string  := "false";
        le_sh0_always_en: string  := "false";
        le_sh1_always_en: string  := "false";
        le_sync_mode    : string  := "false";
        is_le_en_not_inv: string  := "true";
        is_le_sr_inv    : string  := "false";
        is_le_sh0_en_not_inv: string  := "true";
        is_le_sh1_en_not_inv: string  := "true"
    );
    port(
        clk             : in     vl_logic;
        en              : in     vl_logic;
        sr              : in     vl_logic;
        rc              : in     vl_logic_vector(1 downto 0);
        sh              : out    vl_logic_vector(1 downto 0);
        a_sr            : out    vl_logic;
        mclk_b          : out    vl_logic;
        sclk            : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of is_en_used : constant is 1;
    attribute mti_svvh_generic_type of is_le_clk_inv : constant is 1;
    attribute mti_svvh_generic_type of is_le_has_clk : constant is 1;
    attribute mti_svvh_generic_type of le_lat_mode : constant is 1;
    attribute mti_svvh_generic_type of le_sh0_always_en : constant is 1;
    attribute mti_svvh_generic_type of le_sh1_always_en : constant is 1;
    attribute mti_svvh_generic_type of le_sync_mode : constant is 1;
    attribute mti_svvh_generic_type of is_le_en_not_inv : constant is 1;
    attribute mti_svvh_generic_type of is_le_sr_inv : constant is 1;
    attribute mti_svvh_generic_type of is_le_sh0_en_not_inv : constant is 1;
    attribute mti_svvh_generic_type of is_le_sh1_en_not_inv : constant is 1;
end LBUF;
