library verilog;
use verilog.vl_types.all;
entity memory2c is
    port(
        data_out        : out    vl_logic_vector(15 downto 0);
        data_in         : in     vl_logic_vector(15 downto 0);
        addr            : in     vl_logic_vector(15 downto 0);
        enable          : in     vl_logic;
        wr              : in     vl_logic;
        createdump      : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic
    );
end memory2c;
