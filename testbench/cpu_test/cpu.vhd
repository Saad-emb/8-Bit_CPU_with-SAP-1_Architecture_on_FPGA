library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity  cpu_8bits is port (

	clk : in std_logic;
    rst : in std_logic;
    op : out std_logic_vector(7 downto 0)
);
end cpu_8bits;

architecture RTL of cpu_8bits is 

component alu is port (

	operation : in std_logic;
    enable: in std_logic;
    reg_a : in std_logic_vector(7 downto 0);
    reg_b : in std_logic_vector(7 downto 0);
    carry_out : out std_logic;
    zero_flag : out std_logic;
    output: out std_logic_vector(7 downto 0)
);
end component;

component control_unit is
Port ( 
clk: in std_logic;
rst: in std_logic;
inst: in std_logic_vector(3 downto 0);
do : out std_logic_vector(16 downto 0)
);
end component;

component  mar is port (

	clk : in std_logic;
    rst : in std_logic;
    load: in std_logic;
    input : in std_logic_vector(3 downto 0);
    output: out std_logic_vector(3 downto 0)
);
end component;

component memory is port (

	clk : in std_logic;
    load: in std_logic;
    out_enable: in std_logic;
    addr_in : in std_logic_vector(3 downto 0);
    data_in: in std_logic_vector(7 downto 0);
    data_out: out std_logic_vector(7 downto 0)
);
end component;

component program_counter is port (

	clk : in std_logic;
    rst : in std_logic;
    enable: in std_logic;
    out_enable: in std_logic;
    load: in std_logic;
    input : in std_logic_vector(3 downto 0);
    output: out std_logic_vector(3 downto 0)
);
end component;

component register_8bits is port (

	clk : in std_logic;
    rst : in std_logic;
    out_enable: in std_logic;
    load: in std_logic;
    input : in std_logic_vector(7 downto 0);
    output_alu: out std_logic_vector(7 downto 0);
    output: out std_logic_vector(7 downto 0)
);
end component;

signal clk_sig :std_logic;
-- main busstd_logic;
signal main_bus :std_logic_vector(7 downto 0);
--pc signals
signal pc_enable_sig : std_logic;
signal pc_out_enable_sig :std_logic;
signal pc_load_sig :std_logic;
--singal pc_input_sig :std_logic;
--singal pc_output_sig:std_logic;
-- ins:
signal cpu_out_sig:std_logic_vector(16 downto 0);
--MAR
signal mar_load_sig:std_logic;
signal mar_memory_sig:std_logic_vector(3 downto 0);
--Memory
signal memory_load_enable_sig:std_logic;
signal memory_out_enable_sig:std_logic;
--reg
signal inst_out_enable_sig:std_logic;
signal inst_out_sig:std_logic_vector(7 downto 0);
signal inst_load_sig:std_logic;
 --reg a
signal  reg_a_out_enable_sig:std_logic;
signal reg_a_load_sig:std_logic;
signal reg_a_alu_sig:std_logic_vector(7 downto 0);

 --reg b
signal  reg_b_out_enable_sig:std_logic;
signal reg_b_load_sig:std_logic;
signal reg_b_alu_sig:std_logic_vector(7 downto 0);

 --reg op
signal  reg_op_out_enable_sig:std_logic;
signal reg_op_load_sig:std_logic;

--ALU
signal alu_oe_sig:std_logic;
signal alu_enable_sig:std_logic;
 

signal inst_out: std_logic_vector(3 downto 0);
signal halt_sig : std_logic;
begin

program_counter_inst : program_counter port map(
	clk=> clk_sig,
    rst=> rst, 
    enable=>pc_enable_sig,
    out_enable=>pc_out_enable_sig,
    load=>pc_load_sig,
    input=>main_bus(3 downto 0),
    output=>main_bus(3 downto 0)

);

ALU_inst : alu port map(
	operation=> alu_oe_sig,
    enable => alu_enable_sig,
    reg_a => reg_a_alu_sig,
    reg_b => reg_b_alu_sig,
    carry_out =>  open,
    zero_flag =>open,
    output => main_bus

);

control_unit_inst : control_unit port map(

clk=> clk_sig,
rst => rst, 
inst => inst_out,
do => cpu_out_sig
);


Mar_inst : mar port map(
	clk=> clk_sig,
    rst => rst, 
    load => mar_load_sig,
    input=>main_bus(3 downto 0),
    output=>mar_memory_sig
);

memory_inst : memory port map(

	clk=> clk_sig,
    load=> memory_load_enable_sig,
    out_enable=> memory_out_enable_sig,
    addr_in => mar_memory_sig,
    data_in=>main_bus,
    data_out=>main_bus
);

register_8bits_inst : register_8bits port map(
	clk=> clk_sig,
    rst => rst, 
    out_enable => inst_out_enable_sig,
    load => inst_load_sig,
    input=>main_bus,
    output_alu=> inst_out_sig
);
inst_out<=inst_out_sig(7 downto 4);
main_bus(3 downto 0) <= inst_out_sig(3 downto 0) when inst_out_enable_sig='1' else (others =>'Z');

register_8bits_a_inst : register_8bits port map(
	clk=> clk_sig,
    rst => rst, 
    out_enable=>reg_a_out_enable_sig,
    load=> reg_a_load_sig,
    input=>main_bus,
    output=> main_bus,
    output_alu => reg_a_alu_sig
);

register_8bits_b_inst : register_8bits port map(
	clk=> clk_sig, 
    rst => rst, 
    out_enable=>reg_b_out_enable_sig,
    load=> reg_b_load_sig,
    input=>main_bus,
    output=>main_bus,
    output_alu=> reg_b_alu_sig
);

register_8bits_op_inst : register_8bits port map(
	clk=> clk_sig, 
    rst => rst, 
    out_enable=>reg_op_out_enable_sig,
    load=> reg_op_load_sig,
    input=>main_bus,
    output=>open,
    output_alu=> op
);
clk_sig<=clk and(not halt_sig);

halt_sig 	<= cpu_out_sig(16);
reg_op_load_sig 	<=cpu_out_sig(15);
reg_op_out_enable_sig	<=cpu_out_sig(14);
alu_oe_sig	<= cpu_out_sig(13);
alu_enable_sig	<= cpu_out_sig(12);
pc_enable_sig 	<= cpu_out_sig(11);
pc_load_sig	<= cpu_out_sig(10);
pc_out_enable_sig 	<= cpu_out_sig(9);
mar_load_sig 	<= cpu_out_sig(8);
memory_load_enable_sig	<= cpu_out_sig(7);
memory_out_enable_sig	<= cpu_out_sig(6);
reg_a_load_sig<= cpu_out_sig(5);
reg_a_out_enable_sig<= cpu_out_sig(4);
reg_b_load_sig<= cpu_out_sig(3);
reg_b_out_enable_sig<= cpu_out_sig(2);
inst_load_sig	<= cpu_out_sig(1);
inst_out_enable_sig	<= cpu_out_sig(0);

end rtl;


