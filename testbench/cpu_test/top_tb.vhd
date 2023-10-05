library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity top_tb is
end entity;


architecture behave of top_tb is 


component cpu_8bits is
	port(
	clk : in std_logic;
    rst : in std_logic;
    op : out std_logic_vector(7 downto 0)
	);

end component;


signal clk_sig,rst_sig,load_sig :std_logic;
signal op_sig : std_logic_vector(7 downto 0);
begin

toptest :cpu_8bits port map(
clk=>clk_sig,
rst=>rst_sig,
op=>op_sig
);

process 
begin 
clk_sig<='1';

wait for 18.5 ns;

clk_sig<='0';
wait for 18.5 ns;
end process; 

end behave;
