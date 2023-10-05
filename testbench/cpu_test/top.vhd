library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity top is
port(
	clk : in std_logic;
    rst : in std_logic;
    load: in std_logic;
    op : out std_logic_vector(7 downto 0)

);

end entity;


architecture behave of top is 


component cpu_8bits is
	port(
	clk : in std_logic;
    rst : in std_logic;
    load: in std_logic;
    op : out std_logic_vector(7 downto 0)
	);

end component;

component divfreq is
PORT(
	clk_in : in std_logic;
	clk_out : out std_logic
);
end component;
signal clk_out_sig :std_logic;
begin


div_freq :divfreq port map(
clk_in=>clk,
clk_out=>clk_out_sig
);


cpu_obj		: cpu_8bits port map(
clk => clk_out_sig,
rst=>rst,
load=>load,
op=>op);


end behave;