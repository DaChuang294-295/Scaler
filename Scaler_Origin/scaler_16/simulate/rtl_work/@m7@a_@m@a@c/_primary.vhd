library verilog;
use verilog.vl_types.all;
entity M7A_MAC is
    generic(
        modea_sel       : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi0);
        modeb_sel       : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi0);
        adinx_input_mode: vl_logic := Hi0;
        adiny_input_mode: vl_logic := Hi0;
        adinz_input_mode: vl_logic := Hi0;
        amac_output_mode: vl_logic := Hi0;
        bdinx_input_mode: vl_logic := Hi0;
        bdiny_input_mode: vl_logic := Hi0;
        bdinz_input_mode: vl_logic := Hi0;
        bmac_output_mode: vl_logic := Hi0;
        a_in_rstn_sel   : vl_logic := Hi0;
        a_in_setn_sel   : vl_logic := Hi0;
        a_sr_syn_sel    : vl_logic := Hi0;
        a_ovf_rstn_sel  : vl_logic := Hi0;
        a_out_rstn_sel  : vl_logic_vector(47 downto 0) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        a_out_setn_sel  : vl_logic_vector(47 downto 0) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        a_out_rstn_sel_h: vl_logic_vector(0 to 23) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        a_out_rstn_sel_l: vl_logic_vector(0 to 23) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        a_out_setn_sel_h: vl_logic_vector(0 to 23) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        a_out_setn_sel_l: vl_logic_vector(0 to 23) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        b_in_rstn_sel   : vl_logic := Hi0;
        b_in_setn_sel   : vl_logic := Hi0;
        b_sr_syn_sel    : vl_logic := Hi0;
        b_ovf_rstn_sel  : vl_logic := Hi0;
        b_out_rstn_sel  : vl_logic_vector(0 to 27) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        b_out_setn_sel  : vl_logic_vector(0 to 27) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0)
    );
    port(
        a_mac_out       : out    vl_logic_vector(24 downto 0);
        b_mac_out       : out    vl_logic_vector(24 downto 0);
        a_overflow      : out    vl_logic;
        b_overflow      : out    vl_logic;
        a_dinxy_cen     : in     vl_logic;
        b_dinxy_cen     : in     vl_logic;
        a_dinz_cen      : in     vl_logic;
        b_dinz_cen      : in     vl_logic;
        a_mac_out_cen   : in     vl_logic;
        b_mac_out_cen   : in     vl_logic;
        a_in_sr         : in     vl_logic;
        b_in_sr         : in     vl_logic;
        a_out_sr        : in     vl_logic;
        b_out_sr        : in     vl_logic;
        a_dinx          : in     vl_logic_vector(13 downto 0);
        a_diny          : in     vl_logic_vector(9 downto 0);
        b_dinx          : in     vl_logic_vector(13 downto 0);
        b_diny          : in     vl_logic_vector(9 downto 0);
        a_dinz          : in     vl_logic_vector(24 downto 0);
        b_dinz          : in     vl_logic_vector(24 downto 0);
        clk             : in     vl_logic;
        a_sload         : in     vl_logic;
        b_sload         : in     vl_logic;
        a_acc_en        : in     vl_logic;
        a_dinz_en       : in     vl_logic;
        b_acc_en        : in     vl_logic;
        b_dinz_en       : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of modea_sel : constant is 1;
    attribute mti_svvh_generic_type of modeb_sel : constant is 1;
    attribute mti_svvh_generic_type of adinx_input_mode : constant is 1;
    attribute mti_svvh_generic_type of adiny_input_mode : constant is 1;
    attribute mti_svvh_generic_type of adinz_input_mode : constant is 1;
    attribute mti_svvh_generic_type of amac_output_mode : constant is 1;
    attribute mti_svvh_generic_type of bdinx_input_mode : constant is 1;
    attribute mti_svvh_generic_type of bdiny_input_mode : constant is 1;
    attribute mti_svvh_generic_type of bdinz_input_mode : constant is 1;
    attribute mti_svvh_generic_type of bmac_output_mode : constant is 1;
    attribute mti_svvh_generic_type of a_in_rstn_sel : constant is 1;
    attribute mti_svvh_generic_type of a_in_setn_sel : constant is 1;
    attribute mti_svvh_generic_type of a_sr_syn_sel : constant is 1;
    attribute mti_svvh_generic_type of a_ovf_rstn_sel : constant is 1;
    attribute mti_svvh_generic_type of a_out_rstn_sel : constant is 2;
    attribute mti_svvh_generic_type of a_out_setn_sel : constant is 2;
    attribute mti_svvh_generic_type of a_out_rstn_sel_h : constant is 1;
    attribute mti_svvh_generic_type of a_out_rstn_sel_l : constant is 1;
    attribute mti_svvh_generic_type of a_out_setn_sel_h : constant is 1;
    attribute mti_svvh_generic_type of a_out_setn_sel_l : constant is 1;
    attribute mti_svvh_generic_type of b_in_rstn_sel : constant is 1;
    attribute mti_svvh_generic_type of b_in_setn_sel : constant is 1;
    attribute mti_svvh_generic_type of b_sr_syn_sel : constant is 1;
    attribute mti_svvh_generic_type of b_ovf_rstn_sel : constant is 1;
    attribute mti_svvh_generic_type of b_out_rstn_sel : constant is 1;
    attribute mti_svvh_generic_type of b_out_setn_sel : constant is 1;
end M7A_MAC;
