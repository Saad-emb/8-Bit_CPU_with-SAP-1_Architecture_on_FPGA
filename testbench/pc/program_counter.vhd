library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity  program_counter is port (

	clk : in std_logic;
    rst : in std_logic;
    enable: in std_logic;
    load: in std_logic;
    input : in std_logic_vector(3 downto 0);
    output: out std_logic_vector(3 downto 0)
);
end program_counter;

architecture RTL of program_counter is 

signal counter: std_logic_vector(3 downto 0);

begin 
    process(clk,rst)
        begin
        if rst='1'then
            counter<=(others=>'0');
        elsif rising_edge(clk) then
            if load='1' then
                counter<=input;
            elsif enable='1' then
                counter<=counter+1;
            end if;
        end if;
        end process;

output<=counter;

end RTL;