library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity B_Registradores is
	port(
		RegWrite: in std_logic;
		R_Register1: in std_logic_vector(4 downto 0);
		R_Register2: in std_logic_vector(4 downto 0);
		W_Register: in std_logic_vector(4 downto 0);
		W_Data: in std_logic_vector(31 downto 0);
		R_Data1: out std_logic_vector(31 downto 0);
		R_Data2: out std_logic_vector(31 downto 0)
	);
end entity;	
	
	
architecture arch_B_Registradores of B_Registradores is

type Matriz_Register is array(31 downto 0) of std_logic_vector(31 downto 0);
signal B_Register: Matriz_Register;

begin
	process(RegWrite, R_Register1, R_Register2, W_Register, W_Data)
	begin
		if(RegWrite = '1')then
		
			B_Register(conv_integer(W_Register)) <= W_Data;
			B_Register(0) <= "00000000000000000000000000000000"; -- Mesmo mandando escrever no registrador zero, ele sempre receberá 0;
			
		end if;
		
		if(R_Register1 = "00000")then
			R_Data1 <= "00000000000000000000000000000000";
		else
			R_Data1 <= B_Register(conv_integer(R_Register1));
		end if;


		if(R_Register2 = "00000")then
			R_Data2 <= "00000000000000000000000000000000";
		else
			R_Data2 <= B_Register(conv_integer(R_Register2));
		end if;


	end process;
end architecture;
