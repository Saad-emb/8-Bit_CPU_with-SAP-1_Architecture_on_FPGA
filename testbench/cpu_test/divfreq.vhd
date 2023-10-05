library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity divfreq is port (
	clk_in : in std_logic;
	clk_out : out std_logic);
end divfreq;

architecture RTL of divfreq is 
	
signal count : integer range 0 to 27456798;
-- 50MHZ KHASS HADI DAR INTEGER RANGE 0 TO 53456789

begin 

process(clk_in)
begin

				if (clk_in'event and clk_in='1') then 
		if (count = 27000000) then 
--IF(s1 = 50000000) THEN
			count <= 0;
		else 
			count <= count + 1;

	end if;
end if;
end process;

process(clk_in)
begin
	
	if (clk_in'event and clk_in='1') then 
		if (count = 13500000) then 
-- POUR 50MHZ IF(s1 <= 25000000) THEN
			clk_out <= '1';

		else 
			clk_out <= '0';
		end if;
	end if;
end process;

end RTL;