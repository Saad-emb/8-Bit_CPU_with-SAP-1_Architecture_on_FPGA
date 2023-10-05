library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity alu_tb  is 
	
end entity;

architecture behave of alu_tb  is

component alu is 
port(
	operation : in std_logic;
    enable: in std_logic;
    reg_a : in std_logic_vector(7 downto 0);
    reg_b : in std_logic_vector(7 downto 0);
    carry_out : out std_logic;
    output: out std_logic_vector(7 downto 0)
	);
	
end component;

signal operation_sig : std_logic;
signal enable_sig : std_logic;
signal carry_out_sig : std_logic;
signal reg_a_sig,reg_b_sig ,output_sig: std_logic_vector(7 downto 0);


begin

pc1: alu port map(operation=>operation_sig,
		enable=>enable_sig,
		reg_a=>reg_a_sig,
		reg_b=>reg_b_sig,
		carry_out=>carry_out_sig,
		output=>output_sig);








process
begin
enable_sig<='1';
operation_sig<='1';
reg_a_sig<="11111111";
reg_b_sig<="00000001";
wait for 5 ns;
reg_a_sig<="11111110";
reg_b_sig<="00000001";
wait for 5 ns;
enable_sig<='0';
wait for 5 ns;





end process;








end behave;
