library verilog;
use verilog.vl_types.all;
entity cla16b is
    port(
        a               : in     vl_logic_vector(15 downto 0);
        b               : in     vl_logic_vector(15 downto 0);
        cin             : in     vl_logic;
        sum             : out    vl_logic_vector(15 downto 0);
        cout            : out    vl_logic;
        pg              : out    vl_logic;
        gg              : out    vl_logic;
        cintomsb        : out    vl_logic
    );
end cla16b;
