library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity  register_8bits is port (

	clk : in std_logic;
    rst : in std_logic;
    out_enable: in std_logic;
    load: in std_logic;
    input : in std_logic_vector(7 downto 0);
    output_alu: out std_logic_vector(7 downto 0);
    output: out std_logic_vector(7 downto 0)
);
end register_8bits;

architecture RTL of register_8bits is 

signal output_value: std_logic_vector(7 downto 0);

begin 
    process(clk,rst)
        begin
        if rst='1'then
            output_value<=(others=>'Z');
        elsif rising_edge(clk) then
            if load='1' then
                output_value<=input;
            end if;
        end if;
        end process;
output<=output_value when out_enable ='1' else (others=>'Z');
output_alu<=output_value;

end RTL;