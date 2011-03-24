library verilog;
use verilog.vl_types.all;
entity decode is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        reg1            : in     vl_logic_vector(2 downto 0);
        reg2            : in     vl_logic_vector(2 downto 0);
        reg3            : in     vl_logic_vector(2 downto 0);
        regwrite        : in     vl_logic;
        regdest         : in     vl_logic_vector(1 downto 0);
        writedata       : in     vl_logic_vector(15 downto 0);
        regval1         : out    vl_logic_vector(15 downto 0);
        regval2         : out    vl_logic_vector(15 downto 0)
    );
end decode;
