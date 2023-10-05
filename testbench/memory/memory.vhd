library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

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
signal memory_data : memory_type; 

begin 
    process(clk)
        begin
        if rising_edge(clk) then
            if load ='1' then
               memory_data(to_integer(unsigned(addr_in)))<=data_in; 
            end if;
        if out_enable = '1' then
            data_out<= memory_data(to_integer(unsigned(addr_in)));
        end if;            
        end if;
  
     end process;

end RTL;