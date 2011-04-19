library verilog;
use verilog.vl_types.all;
entity cache is
    generic(
        cache_id        : integer := 0
    );
    port(
        enable          : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        createdump      : in     vl_logic;
        tag_in          : in     vl_logic_vector(4 downto 0);
        index           : in     vl_logic_vector(7 downto 0);
        offset          : in     vl_logic_vector(2 downto 0);
        data_in         : in     vl_logic_vector(15 downto 0);
        comp            : in     vl_logic;
        write           : in     vl_logic;
        valid_in        : in     vl_logic;
        tag_out         : out    vl_logic_vector(4 downto 0);
        data_out        : out    vl_logic_vector(15 downto 0);
        hit             : out    vl_logic;
        dirty           : out    vl_logic;
        valid           : out    vl_logic;
        err             : out    vl_logic
    );
end cache;
