library verilog;
use verilog.vl_types.all;
entity cond_set is
    port(
        \In\            : in     vl_logic_vector(15 downto 0);
        control         : in     vl_logic_vector(2 downto 0);
        zero            : in     vl_logic;
        ofl             : in     vl_logic;
        sign            : in     vl_logic;
        \Out\           : out    vl_logic_vector(15 downto 0)
    );
end cond_set;
