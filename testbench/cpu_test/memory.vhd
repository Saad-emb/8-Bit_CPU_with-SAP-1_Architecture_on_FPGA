library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

use ieee.std_logic_textio.all;
library std;
use std.textio.all;
entity  memory is port (

	clk : in std_logic;
    load: in std_logic;
    out_enable: in std_logic;
    addr_in : in std_logic_vector(3 downto 0);
    data_in: in std_logic_vector(7 downto 0);
    data_out: out std_logic_vector(7 downto 0)
);
end memory;

architecture RTL of memory is

type memory_type is array(0 to 15) of std_logic_vector(7 downto 0);
signal do_i : std_logic_vector(7 downto 0);


-- LDA #16
-- ADD #15 #16+ REGA
-- STR #15 A to ram #15
-- OUT #15

signal mem_obj: memory_type := (
  "00001111", "00101111", "00011111", "00101110",
  "00011110", "01000001", "00000000", "00000000",
  "00000000", "00000000", "00000000", "00000000",
  "00000000", "00000001", "00000001", "00000001"
);

begin 
    
process (clk)
begin
	if rising_edge(clk) then
		if load = '1' then
			mem_obj(to_integer(unsigned(addr_in)))<=data_in ;
		end if;
	end if;
end process;

--mem_obj(to_integer(unsigned(addr_in)))<=data_in when load = '1';

--process (clk)
--begin
--	if rising_edge(clk) then
--		if oe = '1' then
--			do_i <= mem_obj(to_integer(unsigned(addr_in))) ;
--		end if;
--	end if;
--end process;


do_i <= mem_obj(to_integer(unsigned(addr_in))) ;

data_out <= do_i when out_enable = '1' else (others=>'Z');


end RTL;
