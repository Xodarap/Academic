library verilog;
use verilog.vl_types.all;
entity control is
    port(
        instruction     : in     vl_logic_vector(15 downto 0);
        regdst          : out    vl_logic_vector(1 downto 0);
        regwrite        : out    vl_logic;
        alusrc          : out    vl_logic;
        memread         : out    vl_logic;
        memwrite        : out    vl_logic;
        memtoreg        : out    vl_logic;
        aluopcode       : out    vl_logic_vector(3 downto 0);
        immsrc          : out    vl_logic;
        setcode         : out    vl_logic_vector(2 downto 0);
        branchcode      : out    vl_logic_vector(2 downto 0);
        err             : out    vl_logic
    );
end control;
