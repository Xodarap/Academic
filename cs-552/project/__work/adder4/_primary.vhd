library verilog;
use verilog.vl_types.all;
entity adder4 is
    port(
        a               : in     vl_logic_vector(3 downto 0);
        b               : in     vl_logic_vector(3 downto 0);
        cin             : in     vl_logic;
        s               : out    vl_logic_vector(3 downto 0)
    );
end adder4;
