library verilog;
use verilog.vl_types.all;
entity reg16 is
    port(
        readdata        : out    vl_logic_vector(15 downto 0);
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        writedata       : in     vl_logic_vector(15 downto 0);
        write           : in     vl_logic
    );
end reg16;
