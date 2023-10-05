library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity  mar is port (

	clk : in std_logic;
    rst : in std_logic;
    load: in std_logic;
    input : in std_logic_vector(3 downto 0);
    output: out std_logic_vector(3 downto 0)
);
end mar;

architecture RTL of mar is 

signal output_value: std_logic_vector(3 downto 0):=(others=>'Z');

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

output<=output_value;

end RTL;