library verilog;
use verilog.vl_types.all;
entity mem_system_ref is
    port(
        dataout         : out    vl_logic_vector(15 downto 0);
        done            : out    vl_logic;
        stall           : out    vl_logic;
        cachehit        : out    vl_logic;
        addr            : in     vl_logic_vector(15 downto 0);
        datain          : in     vl_logic_vector(15 downto 0);
        rd              : in     vl_logic;
        wr              : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic
    );
end mem_system_ref;
