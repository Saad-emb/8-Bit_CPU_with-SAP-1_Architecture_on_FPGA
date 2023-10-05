library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity memory_tb  is 
	
end entity;

architecture behave of memory_tb  is

component memory is 
port(
    clk : in std_logic;
    load: in std_logic;
    out_enable: in std_logic;
    addr_in : in std_logic_vector(3 downto 0);
    data_in: in std_logic_vector(7 downto 0);
    data_out: out std_logic_vector(7 downto 0)
	);
	
end component;

signal clk_sig : std_logic;
signal out_enable_sig : std_logic;
signal load_sig : std_logic;
signal addr_in_sig : std_logic_vector(3 downto 0);
signal data_in_sig,data_out_sig : std_logic_vector(7 downto 0);

begin

pc1: memory port map(clk=>clk_sig,
		out_enable=>out_enable_sig,
		load=>load_sig,
		addr_in=>addr_in_sig,
		data_in=>data_in_sig,	
		data_out=>data_out_sig);


process
begin

clk_sig<='0';
wait for 1 ns;
clk_sig<= not clk_sig;
wait for 1 ns;
end process;









process
begin
data_in_sig<="10110100";
addr_in_sig<="1011";
out_enable_sig<='0';
load_sig<='1';
wait for 5 ns;
out_enable_sig<='1';
load_sig<='0';
wait for 5 ns;
out_enable_sig<='0';
load_sig<='1';
data_in_sig<="00000000";
addr_in_sig<="0000";
wait for 5 ns;
out_enable_sig<='1';
load_sig<='0';
wait for 5 ns;



end process;








end behave;
