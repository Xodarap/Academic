library verilog;
use verilog.vl_types.all;
entity onebitlookahead is
    port(
        a               : in     vl_logic;
        b               : in     vl_logic;
        g               : out    vl_logic;
        p               : out    vl_logic
    );
end onebitlookahead;
