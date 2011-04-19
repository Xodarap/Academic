library verilog;
use verilog.vl_types.all;
entity final_memory is
    port(
        data_out        : out    vl_logic_vector(15 downto 0);
        err             : out    vl_logic;
        data_in         : in     vl_logic_vector(15 downto 0);
        addr            : in     vl_logic_vector(12 downto 0);
        wr              : in     vl_logic;
        rd              : in     vl_logic;
        enable          : in     vl_logic;
        create_dump     : in     vl_logic;
        bank_id         : in     vl_logic_vector(1 downto 0);
        clk             : in     vl_logic;
        rst             : in     vl_logic
    );
end final_memory;
