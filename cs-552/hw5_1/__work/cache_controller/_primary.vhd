library verilog;
use verilog.vl_types.all;
entity cache_controller is
    generic(
        reset           : integer := 0;
        compread        : integer := 1;
        compwrite       : integer := 2;
        cache2mem0      : integer := 3;
        cache2mem1      : integer := 4;
        cache2mem2      : integer := 5;
        cache2mem3      : integer := 6;
        cache2mem4      : integer := 7;
        mem2cache0      : integer := 8;
        mem2cache1      : integer := 9;
        mem2cache2      : integer := 10;
        mem2cache3      : integer := 11;
        mem2cache4      : integer := 12;
        mem2cache5      : integer := 13;
        \DONE\          : integer := 14
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        rd              : in     vl_logic;
        wr              : in     vl_logic;
        stall           : in     vl_logic;
        m2c             : in     vl_logic;
        c2m             : in     vl_logic;
        h               : in     vl_logic;
        addr            : in     vl_logic_vector(15 downto 0);
        mem_wr          : out    vl_logic;
        mem_rd          : out    vl_logic;
        offsetsel       : out    vl_logic;
        index           : out    vl_logic_vector(7 downto 0);
        tag             : out    vl_logic_vector(4 downto 0);
        word            : out    vl_logic_vector(1 downto 0);
        mem_word        : out    vl_logic_vector(1 downto 0);
        enable          : out    vl_logic;
        comp            : out    vl_logic;
        write           : out    vl_logic;
        writesrc        : out    vl_logic;
        done            : out    vl_logic;
        cache_wr        : out    vl_logic;
        stall_out       : out    vl_logic;
        hit_out         : out    vl_logic
    );
end cache_controller;
