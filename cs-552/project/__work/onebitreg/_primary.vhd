library verilog;
use verilog.vl_types.all;
entity onebitreg is
    port(
        readdata        : out    vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        writedata       : in     vl_logic;
        write           : in     vl_logic
    );
end onebitreg;
