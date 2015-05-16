library verilog;
use verilog.vl_types.all;
entity DDR_IO is
    generic(
        oen_sel         : vl_logic_vector(0 to 1) := (Hi0, Hi0);
        od_sel          : vl_logic_vector(0 to 1) := (Hi0, Hi0);
        is_oen_reg      : vl_logic := Hi0;
        is_clk_inv      : vl_logic := Hi0;
        is_clk_gate_en  : vl_logic := Hi0;
        is_setn_inv     : vl_logic := Hi0;
        is_setn_sync    : vl_logic := Hi0;
        is_oen_setn_en  : vl_logic := Hi0;
        is_od_setn_en   : vl_logic := Hi0;
        is_id_setn_en   : vl_logic := Hi0;
        is_rstn_inv     : vl_logic := Hi0;
        is_rstn_sync    : vl_logic := Hi0;
        is_oen_rstn_en  : vl_logic := Hi0;
        is_od_rstn_en   : vl_logic := Hi0;
        is_id_rstn_en   : vl_logic := Hi0
    );
    port(
        idp             : out    vl_logic;
        idn             : out    vl_logic;
        odp             : in     vl_logic;
        odn             : in     vl_logic;
        oen             : in     vl_logic;
        clk             : in     vl_logic;
        rstn            : in     vl_logic;
        setn            : in     vl_logic;
        clk_en          : in     vl_logic;
        pad             : inout  vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of oen_sel : constant is 1;
    attribute mti_svvh_generic_type of od_sel : constant is 1;
    attribute mti_svvh_generic_type of is_oen_reg : constant is 1;
    attribute mti_svvh_generic_type of is_clk_inv : constant is 1;
    attribute mti_svvh_generic_type of is_clk_gate_en : constant is 1;
    attribute mti_svvh_generic_type of is_setn_inv : constant is 1;
    attribute mti_svvh_generic_type of is_setn_sync : constant is 1;
    attribute mti_svvh_generic_type of is_oen_setn_en : constant is 1;
    attribute mti_svvh_generic_type of is_od_setn_en : constant is 1;
    attribute mti_svvh_generic_type of is_id_setn_en : constant is 1;
    attribute mti_svvh_generic_type of is_rstn_inv : constant is 1;
    attribute mti_svvh_generic_type of is_rstn_sync : constant is 1;
    attribute mti_svvh_generic_type of is_oen_rstn_en : constant is 1;
    attribute mti_svvh_generic_type of is_od_rstn_en : constant is 1;
    attribute mti_svvh_generic_type of is_id_rstn_en : constant is 1;
end DDR_IO;
