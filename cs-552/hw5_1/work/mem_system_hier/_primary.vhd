library verilog;
use verilog.vl_types.all;
entity mem_system_hier is
    generic(
        mem_type        : integer := 0
    );
    port(
        DataOut         : out    vl_logic_vector(15 downto 0);
        Done            : out    vl_logic;
        Stall           : out    vl_logic;
        CacheHit        : out    vl_logic;
        Addr            : in     vl_logic_vector(15 downto 0);
        DataIn          : in     vl_logic_vector(15 downto 0);
        Rd              : in     vl_logic;
        Wr              : in     vl_logic;
        createdump      : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of mem_type : constant is 1;
end mem_system_hier;
