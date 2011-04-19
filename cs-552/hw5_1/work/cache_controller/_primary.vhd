library verilog;
use verilog.vl_types.all;
entity cache_controller is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        rd              : in     vl_logic;
        wr              : in     vl_logic;
        stall           : in     vl_logic;
        M2C             : in     vl_logic;
        C2M             : in     vl_logic;
        H               : in     vl_logic;
        addr            : in     vl_logic_vector(15 downto 0);
        mem_wr          : out    vl_logic;
        mem_rd          : out    vl_logic;
        index           : out    vl_logic_vector(7 downto 0);
        tag             : out    vl_logic_vector(4 downto 0);
        word            : out    vl_logic_vector(1 downto 0);
        enable          : out    vl_logic;
        comp            : out    vl_logic;
        write           : out    vl_logic;
        writesrc        : out    vl_logic;
        cache_wr        : out    vl_logic
    );
end cache_controller;
