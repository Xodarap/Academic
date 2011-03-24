library verilog;
use verilog.vl_types.all;
entity execute is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        reg1            : in     vl_logic_vector(15 downto 0);
        reg2            : in     vl_logic_vector(15 downto 0);
        imm             : in     vl_logic_vector(15 downto 0);
        alusrc          : in     vl_logic;
        aluop           : in     vl_logic_vector(3 downto 0);
        condop          : in     vl_logic_vector(2 downto 0);
        branchcode      : in     vl_logic_vector(2 downto 0);
        output          : out    vl_logic_vector(15 downto 0);
        pcsrc           : out    vl_logic
    );
end execute;
