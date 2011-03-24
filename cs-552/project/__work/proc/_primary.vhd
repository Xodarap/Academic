library verilog;
use verilog.vl_types.all;
entity proc is
    port(
        err             : out    vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic
    );
end proc;
