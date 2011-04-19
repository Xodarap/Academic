library verilog;
use verilog.vl_types.all;
entity mem_interface is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        createdump      : in     vl_logic;
        addr            : in     vl_logic_vector(15 downto 0);
        data_in         : in     vl_logic_vector(15 downto 0);
        wr              : in     vl_logic;
        rd              : in     vl_logic;
        data_out        : out    vl_logic_vector(15 downto 0);
        stall           : out    vl_logic;
        err             : out    vl_logic
    );
end mem_interface;
