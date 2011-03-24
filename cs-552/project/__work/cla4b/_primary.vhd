library verilog;
use verilog.vl_types.all;
entity cla4b is
    port(
        a               : in     vl_logic_vector(3 downto 0);
        b               : in     vl_logic_vector(3 downto 0);
        cin             : in     vl_logic;
        sum             : out    vl_logic_vector(3 downto 0);
        pg              : out    vl_logic;
        gg              : out    vl_logic;
        cintomsb        : out    vl_logic
    );
end cla4b;
