library verilog;
use verilog.vl_types.all;
entity fourbitlookahead is
    port(
        a               : in     vl_logic_vector(3 downto 0);
        b               : in     vl_logic_vector(3 downto 0);
        g               : out    vl_logic;
        p               : out    vl_logic
    );
end fourbitlookahead;
