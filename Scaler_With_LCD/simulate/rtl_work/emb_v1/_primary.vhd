library verilog;
use verilog.vl_types.all;
entity emb_v1 is
    port(
        clkw            : in     vl_logic;
        cew             : in     vl_logic;
        aw              : in     vl_logic_vector(8 downto 0);
        dw              : in     vl_logic_vector(31 downto 0);
        clkr            : in     vl_logic;
        cer             : in     vl_logic;
        ar              : in     vl_logic_vector(9 downto 0);
        qr              : out    vl_logic_vector(15 downto 0)
    );
end emb_v1;
