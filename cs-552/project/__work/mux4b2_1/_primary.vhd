library verilog;
use verilog.vl_types.all;
entity mux4b2_1 is
    port(
        ina             : in     vl_logic_vector(3 downto 0);
        inb             : in     vl_logic_vector(3 downto 0);
        s               : in     vl_logic;
        \Out\           : out    vl_logic_vector(3 downto 0)
    );
end mux4b2_1;
