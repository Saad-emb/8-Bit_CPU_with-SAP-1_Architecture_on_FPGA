library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity  alu is port (

	operation : in std_logic;
    enable: in std_logic;
    reg_a : in std_logic_vector(7 downto 0);
    reg_b : in std_logic_vector(7 downto 0);
    carry_out : out std_logic;
    output: out std_logic_vector(7 downto 0)
);
end alu;

architecture RTL of  alu is 

    signal result : std_logic_vector(8 downto 0);
    signal carry : std_logic := '0';
begin
    process (reg_a, reg_b, operation)
    begin

            if operation = '1' then
                -- Addition
                result <= ('0' & reg_a) + ('0' & reg_b);       
            else
                -- Subtraction (Two's Complement)
                result <= ('0' & reg_a) - ('0' & reg_b);
                
            end if;

    end process;
 output <= result(7 downto 0)when enable ='1' else (others=>'Z');
carry_out <= result(8);

end RTL;
