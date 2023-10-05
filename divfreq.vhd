library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity divfreq is
    port 
    (
        clk : in std_logic;
        clk_out : out std_logic

    );

end entity;


architecture rtl of divfreq is
signal q : std_logic_vector(24 downto 0) := (others => '0');
begin
    process (clk)
    begin
        if(rising_edge(clk)) then
            q <= q+1;
        end if;
    end process;
    clk_out <= q(19);      --  1Hz freq



end rtl;