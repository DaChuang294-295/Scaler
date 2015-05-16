library verilog;
use verilog.vl_types.all;
entity ramFIFO_tb is
    generic(
        DATA_WIDTH      : integer := 16;
        BUFFER_SIZE     : integer := 3;
        ADDRESS_WIDTH   : integer := 11;
        BUFFER_SIZE_WIDTH: integer := 2
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of BUFFER_SIZE : constant is 1;
    attribute mti_svvh_generic_type of ADDRESS_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of BUFFER_SIZE_WIDTH : constant is 1;
end ramFIFO_tb;
