library verilog;
use verilog.vl_types.all;
entity branchlogic is
    port(
        branchcode      : in     vl_logic_vector(2 downto 0);
        a               : in     vl_logic_vector(15 downto 0);
        \Out\           : out    vl_logic
    );
end branchlogic;
