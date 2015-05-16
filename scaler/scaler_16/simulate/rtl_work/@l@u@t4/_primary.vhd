library verilog;
use verilog.vl_types.all;
entity LUT4 is
    generic(
        config_data     : string  := "0000"
    );
    port(
        dx              : out    vl_logic;
        f3              : in     vl_logic;
        f2              : in     vl_logic;
        f1              : in     vl_logic;
        f0              : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of config_data : constant is 1;
end LUT4;
