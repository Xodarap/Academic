library verilog;
use verilog.vl_types.all;
entity pc_plus2_plusimm is
    port(
        pc              : in     vl_logic_vector(15 downto 0);
        imm             : in     vl_logic_vector(15 downto 0);
        branchaddr      : out    vl_logic_vector(15 downto 0)
    );
end pc_plus2_plusimm;
