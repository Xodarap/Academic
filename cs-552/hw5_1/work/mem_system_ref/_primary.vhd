library verilog;
use verilog.vl_types.all;
entity mem_system_ref is
    port(
        DataOut         : out    vl_logic_vector(15 downto 0);
        Done            : out    vl_logic;
        Stall           : out    vl_logic;
        CacheHit        : out    vl_logic;
        Addr            : in     vl_logic_vector(15 downto 0);
        DataIn          : in     vl_logic_vector(15 downto 0);
        Rd              : in     vl_logic;
        Wr              : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic
    );
end mem_system_ref;
