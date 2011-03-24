library verilog;
use verilog.vl_types.all;
entity fetch is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        pcsrc           : in     vl_logic;
        newpc           : in     vl_logic_vector(15 downto 0);
        instruction     : out    vl_logic_vector(15 downto 0)
    );
end fetch;
