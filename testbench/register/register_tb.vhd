library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity register_8bits_tb  is 
	
end entity;

architecture behave of register_8bits_tb  is

component register_8bits is 
port(
	clk : in std_logic;
    rst : in std_logic;
    out_enable: in std_logic;
    load: in std_logic;
    input : in std_logic_vector(7 downto 0);
    output_alu: out std_logic_vector(7 downto 0);
    output: out std_logic_vector(7 downto 0)
	);
	
end component;

signal clk_sig : std_logic;
signal rst_sig : std_logic;
signal out_enable_sig : std_logic;
signal load_sig : std_logic;
signal input_sig : std_logic_vector(7 downto 0);
signal output_sig,output_alu_sig : std_logic_vector(7 downto 0);

begin

pc1: register_8bits port map(clk=>clk_sig,
		rst=>rst_sig,
		out_enable=>out_enable_sig,
		load=>load_sig,
		input=>input_sig,
		output_alu=>output_alu_sig,
		output=>output_sig);


process
begin

clk_sig<='0';
wait for 1 ns;
clk_sig<= not clk_sig;
wait for 1 ns;
end process;



process
begin
rst_sig<='0';
wait for 50 ns;
rst_sig<='1';
wait for 10 ns;


end process;


process
begin
input_sig<="10101010";
load_sig<='1';
out_enable_sig<='0';
wait for 5 ns;
load_sig<='0';
out_enable_sig<='1';
wait for 5 ns;





end process;








end behave;
