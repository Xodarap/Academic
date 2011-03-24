library verilog;
use verilog.vl_types.all;
entity writeback is
    port(
        aludata         : in     vl_logic_vector(15 downto 0);
        memorydata      : in     vl_logic_vector(15 downto 0);
        memtoreg        : in     vl_logic;
        halt            : in     vl_logic;
        writedata       : out    vl_logic_vector(15 downto 0)
    );
end writeback;
