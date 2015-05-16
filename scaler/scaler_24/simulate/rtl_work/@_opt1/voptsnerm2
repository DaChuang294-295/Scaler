library verilog;
use verilog.vl_types.all;
entity M7S_EMB5K is
    generic(
        modea_sel       : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi0);
        modeb_sel       : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi0);
        porta_wr_mode   : vl_logic_vector(0 to 1) := (Hi0, Hi0);
        portb_wr_mode   : vl_logic_vector(0 to 1) := (Hi0, Hi0);
        porta_reg_out   : vl_logic := Hi0;
        portb_reg_out   : vl_logic := Hi0;
        reset_value_a   : vl_logic_vector(0 to 8) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        reset_value_b   : vl_logic_vector(0 to 8) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        porta_data_width: integer := 18;
        portb_data_width: integer := 18;
        operation_mode  : string  := "simple_dual_port";
        init_file       : string  := " ";
        porta_prog      : vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        portb_prog      : vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        porta_addr_width: vl_notype;
        portb_addr_width: vl_notype
    );
    port(
        clka            : in     vl_logic;
        clkb            : in     vl_logic;
        rstna           : in     vl_logic;
        rstnb           : in     vl_logic;
        cea             : in     vl_logic;
        ceb             : in     vl_logic;
        wea             : in     vl_logic;
        web             : in     vl_logic;
        aa              : in     vl_logic_vector(11 downto 0);
        ab              : in     vl_logic_vector(11 downto 0);
        da              : in     vl_logic_vector(17 downto 0);
        db              : in     vl_logic_vector(17 downto 0);
        q               : out    vl_logic_vector(17 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of modea_sel : constant is 1;
    attribute mti_svvh_generic_type of modeb_sel : constant is 1;
    attribute mti_svvh_generic_type of porta_wr_mode : constant is 1;
    attribute mti_svvh_generic_type of portb_wr_mode : constant is 1;
    attribute mti_svvh_generic_type of porta_reg_out : constant is 1;
    attribute mti_svvh_generic_type of portb_reg_out : constant is 1;
    attribute mti_svvh_generic_type of reset_value_a : constant is 1;
    attribute mti_svvh_generic_type of reset_value_b : constant is 1;
    attribute mti_svvh_generic_type of porta_data_width : constant is 1;
    attribute mti_svvh_generic_type of portb_data_width : constant is 1;
    attribute mti_svvh_generic_type of operation_mode : constant is 1;
    attribute mti_svvh_generic_type of init_file : constant is 1;
    attribute mti_svvh_generic_type of porta_prog : constant is 1;
    attribute mti_svvh_generic_type of portb_prog : constant is 1;
    attribute mti_svvh_generic_type of porta_addr_width : constant is 3;
    attribute mti_svvh_generic_type of portb_addr_width : constant is 3;
end M7S_EMB5K;
