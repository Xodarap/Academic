library verilog;
use verilog.vl_types.all;
entity add2 is
    port(
        pc              : in     vl_logic_vector(15 downto 0);
        pcprime         : out    vl_logic_vector(15 downto 0)
    );
end add2;
