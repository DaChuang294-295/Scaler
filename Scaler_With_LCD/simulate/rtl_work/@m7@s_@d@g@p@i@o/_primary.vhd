library verilog;
use verilog.vl_types.all;
entity M7S_DGPIO is
    generic(
        io_type         : string  := "input";
        fast_input      : vl_logic := Hi0;
        fast_output     : vl_logic := Hi0;
        fast_oe         : vl_logic := Hi0;
        cfg_fclk_gate_sel: vl_logic := Hi0;
        cfg_fclk_en     : vl_logic := Hi0;
        cfg_fclk_inv    : vl_logic := Hi0;
        cfg_oen_inv     : vl_logic := Hi0;
        cfg_od_inv      : vl_logic := Hi0;
        cfg_oen_setn_en : vl_logic := Hi0;
        cfg_id_setn_en  : vl_logic := Hi0;
        cfg_od_setn_en  : vl_logic := Hi0;
        cfg_setn_inv    : vl_logic := Hi0;
        cfg_oen_rstn_en : vl_logic := Hi0;
        cfg_id_rstn_en  : vl_logic := Hi0;
        cfg_od_rstn_en  : vl_logic := Hi0;
        cfg_rstn_inv    : vl_logic := Hi0;
        optional_function: string  := ""
    );
    port(
        clk0            : in     vl_logic;
        rstn            : in     vl_logic;
        setn            : in     vl_logic;
        clk_en          : in     vl_logic;
        oen             : in     vl_logic;
        od_d            : in     vl_logic;
        id_q            : out    vl_logic;
        pad             : inout  vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of io_type : constant is 1;
    attribute mti_svvh_generic_type of fast_input : constant is 1;
    attribute mti_svvh_generic_type of fast_output : constant is 1;
    attribute mti_svvh_generic_type of fast_oe : constant is 1;
    attribute mti_svvh_generic_type of cfg_fclk_gate_sel : constant is 1;
    attribute mti_svvh_generic_type of cfg_fclk_en : constant is 1;
    attribute mti_svvh_generic_type of cfg_fclk_inv : constant is 1;
    attribute mti_svvh_generic_type of cfg_oen_inv : constant is 1;
    attribute mti_svvh_generic_type of cfg_od_inv : constant is 1;
    attribute mti_svvh_generic_type of cfg_oen_setn_en : constant is 1;
    attribute mti_svvh_generic_type of cfg_id_setn_en : constant is 1;
    attribute mti_svvh_generic_type of cfg_od_setn_en : constant is 1;
    attribute mti_svvh_generic_type of cfg_setn_inv : constant is 1;
    attribute mti_svvh_generic_type of cfg_oen_rstn_en : constant is 1;
    attribute mti_svvh_generic_type of cfg_id_rstn_en : constant is 1;
    attribute mti_svvh_generic_type of cfg_od_rstn_en : constant is 1;
    attribute mti_svvh_generic_type of cfg_rstn_inv : constant is 1;
    attribute mti_svvh_generic_type of optional_function : constant is 1;
end M7S_DGPIO;
