library verilog;
use verilog.vl_types.all;
entity m7s_emb is
    port(
        clk             : in     vl_logic;
        a               : in     vl_logic_vector(8 downto 0);
        d               : in     vl_logic_vector(31 downto 0);
        ce              : in     vl_logic;
        we              : in     vl_logic;
        q               : out    vl_logic_vector(31 downto 0)
    );
end m7s_emb;
