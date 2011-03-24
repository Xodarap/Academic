library verilog;
use verilog.vl_types.all;
entity quadmux4_1 is
    port(
        ina             : in     vl_logic_vector(3 downto 0);
        inb             : in     vl_logic_vector(3 downto 0);
        inc             : in     vl_logic_vector(3 downto 0);
        ind             : in     vl_logic_vector(3 downto 0);
        s               : in     vl_logic_vector(1 downto 0);
        \Out\           : out    vl_logic_vector(3 downto 0)
    );
end quadmux4_1;
