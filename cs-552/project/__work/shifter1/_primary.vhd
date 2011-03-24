library verilog;
use verilog.vl_types.all;
entity shifter1 is
    port(
        \In\            : in     vl_logic_vector(15 downto 0);
        op              : in     vl_logic_vector(1 downto 0);
        go              : in     vl_logic;
        \Out\           : out    vl_logic_vector(15 downto 0)
    );
end shifter1;
