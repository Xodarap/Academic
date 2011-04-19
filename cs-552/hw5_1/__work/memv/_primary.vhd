library verilog;
use verilog.vl_types.all;
entity memv is
    port(
        data_out        : out    vl_logic;
        addr            : in     vl_logic_vector(7 downto 0);
        data_in         : in     vl_logic;
        write           : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        createdump      : in     vl_logic;
        file_id         : in     vl_logic_vector(4 downto 0)
    );
end memv;
