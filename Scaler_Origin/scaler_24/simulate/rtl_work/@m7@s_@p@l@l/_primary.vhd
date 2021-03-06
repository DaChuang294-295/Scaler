library verilog;
use verilog.vl_types.all;
entity M7S_PLL is
    generic(
        cfg_nc          : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi0);
        cfg_ldo_cfg     : vl_logic_vector(0 to 4) := (Hi0, Hi0, Hi0, Hi0, Hi0);
        pll_sel         : string  := "auto";
        pwrmode         : vl_logic_vector(0 to 1) := (Hi0, Hi0);
        rst_pll_sel     : vl_logic_vector(0 to 1) := (Hi0, Hi0);
        sel_fbpath      : vl_logic := Hi0;
        pll_divm        : vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        pll_divn        : vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        pll_divc0       : vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        pll_divc1       : vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        pll_divc2       : vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        pll_divc3       : vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        pll_mken0       : vl_logic := Hi0;
        pll_mken1       : vl_logic := Hi0;
        pll_mken2       : vl_logic := Hi0;
        pll_mken3       : vl_logic := Hi0;
        pll_bps0        : vl_logic := Hi0;
        pll_bps1        : vl_logic := Hi0;
        pll_bps2        : vl_logic := Hi0;
        pll_bps3        : vl_logic := Hi0;
        pll_co0dly      : vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        pll_co1dly      : vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        pll_co2dly      : vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        pll_co3dly      : vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        pll_divmp       : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi0);
        pll_sel_c0phase : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi0);
        pll_sel_c1phase : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi0);
        pll_sel_c2phase : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi0);
        pll_sel_c3phase : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi0);
        dyn_pll_rst     : vl_logic := Hi0;
        dyn_pll_pwrdown : vl_logic := Hi1;
        pll_mp_autor_en : vl_logic := Hi0;
        pll_lpf         : vl_logic_vector(0 to 1) := (Hi0, Hi0);
        pll_vrsel       : vl_logic_vector(0 to 1) := (Hi0, Hi1);
        pll_cpsel_cr    : vl_logic_vector(0 to 1) := (Hi0, Hi0);
        pll_cpsel_fn    : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi0);
        pll_kvsel       : vl_logic_vector(0 to 1) := (Hi0, Hi0);
        pll_fldd        : vl_logic_vector(0 to 1) := (Hi0, Hi0);
        pll_force_lock  : vl_logic := Hi0;
        pll_atest_en    : vl_logic := Hi0;
        pll_dtest_en    : vl_logic := Hi0;
        pll_atest_sel   : vl_logic := Hi0;
        pll_dtest_sel   : vl_logic := Hi0;
        pll_bp_dvdd12   : vl_logic := Hi0;
        pll_divfb       : vl_logic := Hi0;
        pll_cksel       : vl_logic := Hi0;
        pll_ck_switch_en: vl_logic := Hi0;
        pll_lkd_tol     : vl_logic := Hi0;
        pll_lkd_hold    : vl_logic := Hi0;
        pll_ssen        : vl_logic := Hi0;
        pll_ssrg        : vl_logic_vector(0 to 1) := (Hi0, Hi0);
        pll_ssdivh      : vl_logic_vector(0 to 1) := (Hi0, Hi0);
        pll_ssdivl      : vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        pll_bk          : vl_logic_vector(0 to 1) := (Hi0, Hi0);
        pll_fbck_del    : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi0);
        amux_sel        : vl_logic_vector(0 to 5) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        inclk_period    : integer := 10000
    );
    port(
        clkin0          : in     vl_logic;
        clkin1          : in     vl_logic;
        fbclkin         : in     vl_logic;
        pwrdown         : in     vl_logic;
        pllrst          : in     vl_logic;
        fp_pll_rst      : in     vl_logic;
        ACTIVECK        : out    vl_logic;
        CKBAD0          : out    vl_logic;
        CKBAD1          : out    vl_logic;
        clkout0         : out    vl_logic;
        clkout1         : out    vl_logic;
        clkout2         : out    vl_logic;
        clkout3         : out    vl_logic;
        locked          : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of cfg_nc : constant is 1;
    attribute mti_svvh_generic_type of cfg_ldo_cfg : constant is 1;
    attribute mti_svvh_generic_type of pll_sel : constant is 1;
    attribute mti_svvh_generic_type of pwrmode : constant is 1;
    attribute mti_svvh_generic_type of rst_pll_sel : constant is 1;
    attribute mti_svvh_generic_type of sel_fbpath : constant is 1;
    attribute mti_svvh_generic_type of pll_divm : constant is 1;
    attribute mti_svvh_generic_type of pll_divn : constant is 1;
    attribute mti_svvh_generic_type of pll_divc0 : constant is 1;
    attribute mti_svvh_generic_type of pll_divc1 : constant is 1;
    attribute mti_svvh_generic_type of pll_divc2 : constant is 1;
    attribute mti_svvh_generic_type of pll_divc3 : constant is 1;
    attribute mti_svvh_generic_type of pll_mken0 : constant is 1;
    attribute mti_svvh_generic_type of pll_mken1 : constant is 1;
    attribute mti_svvh_generic_type of pll_mken2 : constant is 1;
    attribute mti_svvh_generic_type of pll_mken3 : constant is 1;
    attribute mti_svvh_generic_type of pll_bps0 : constant is 1;
    attribute mti_svvh_generic_type of pll_bps1 : constant is 1;
    attribute mti_svvh_generic_type of pll_bps2 : constant is 1;
    attribute mti_svvh_generic_type of pll_bps3 : constant is 1;
    attribute mti_svvh_generic_type of pll_co0dly : constant is 1;
    attribute mti_svvh_generic_type of pll_co1dly : constant is 1;
    attribute mti_svvh_generic_type of pll_co2dly : constant is 1;
    attribute mti_svvh_generic_type of pll_co3dly : constant is 1;
    attribute mti_svvh_generic_type of pll_divmp : constant is 1;
    attribute mti_svvh_generic_type of pll_sel_c0phase : constant is 1;
    attribute mti_svvh_generic_type of pll_sel_c1phase : constant is 1;
    attribute mti_svvh_generic_type of pll_sel_c2phase : constant is 1;
    attribute mti_svvh_generic_type of pll_sel_c3phase : constant is 1;
    attribute mti_svvh_generic_type of dyn_pll_rst : constant is 1;
    attribute mti_svvh_generic_type of dyn_pll_pwrdown : constant is 1;
    attribute mti_svvh_generic_type of pll_mp_autor_en : constant is 1;
    attribute mti_svvh_generic_type of pll_lpf : constant is 1;
    attribute mti_svvh_generic_type of pll_vrsel : constant is 1;
    attribute mti_svvh_generic_type of pll_cpsel_cr : constant is 1;
    attribute mti_svvh_generic_type of pll_cpsel_fn : constant is 1;
    attribute mti_svvh_generic_type of pll_kvsel : constant is 1;
    attribute mti_svvh_generic_type of pll_fldd : constant is 1;
    attribute mti_svvh_generic_type of pll_force_lock : constant is 1;
    attribute mti_svvh_generic_type of pll_atest_en : constant is 1;
    attribute mti_svvh_generic_type of pll_dtest_en : constant is 1;
    attribute mti_svvh_generic_type of pll_atest_sel : constant is 1;
    attribute mti_svvh_generic_type of pll_dtest_sel : constant is 1;
    attribute mti_svvh_generic_type of pll_bp_dvdd12 : constant is 1;
    attribute mti_svvh_generic_type of pll_divfb : constant is 1;
    attribute mti_svvh_generic_type of pll_cksel : constant is 1;
    attribute mti_svvh_generic_type of pll_ck_switch_en : constant is 1;
    attribute mti_svvh_generic_type of pll_lkd_tol : constant is 1;
    attribute mti_svvh_generic_type of pll_lkd_hold : constant is 1;
    attribute mti_svvh_generic_type of pll_ssen : constant is 1;
    attribute mti_svvh_generic_type of pll_ssrg : constant is 1;
    attribute mti_svvh_generic_type of pll_ssdivh : constant is 1;
    attribute mti_svvh_generic_type of pll_ssdivl : constant is 1;
    attribute mti_svvh_generic_type of pll_bk : constant is 1;
    attribute mti_svvh_generic_type of pll_fbck_del : constant is 1;
    attribute mti_svvh_generic_type of amux_sel : constant is 1;
    attribute mti_svvh_generic_type of inclk_period : constant is 1;
end M7S_PLL;
