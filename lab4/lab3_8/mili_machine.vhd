----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:12:57 05/10/2024 
-- Design Name: 
-- Module Name:    mili_machine - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mili_machine is
	port(
			clk : in std_logic;
			reset : in std_logic;
			Z : in std_logic_vector(1 downto 0);
			W : out std_logic_vector(2 downto 0)
	);
end mili_machine;

architecture Behavioral of mili_machine is

	component Dtrig 
		port(
			clk : in std_logic;
			D : in std_logic;
			R : in std_logic;
			Q : out std_logic
		);
	end component;
	
	signal Da_in : std_logic_vector(1 downto 0);
	signal Da_out : std_logic_vector(1 downto 0);

begin

	a1: Dtrig port map(clk, Da_in(1), reset, Da_out(1));
	a0: Dtrig port map(clk, Da_in(0), reset, Da_out(0));
	
	Da_in(1) <= (not(Da_out(1)) and not(Da_out(0)) and not(Z(1))) or
					(not(Da_out(0)) and Z(0)) or
					(Da_out(0) and Z(1)) or
					(Da_out(1) and Z(1));
					
	Da_in(0) <= (not(Da_out(0)) and not(Z(0))) or
					(Da_out(1) and not(Z(0))) or
					(not(Da_out(1)) and Da_out(0) and Z(0)) or
					Z(1);
	
	W(2) <= (not(Da_out(1)) and Da_out(0) and Z(0)) or
			  (Da_out(1) and not(Da_out(0)) and Z(0)) or
			  (Da_out(1) and Da_out(0) and Z(1));
			  
	W(1) <= (not(Da_out(1)) and not(Da_out(0)) and not(Z(1))) or
			  (not(Da_out(1)) and  Da_out(0) and Z(1)) or
			  (Da_out(1) and not(Da_out(0)) and Z(1)) or
			  (Da_out(1) and Da_out(0) and not(Z(1)) and not(Z(0)));
			  
	W(0) <= (not(Z(1)) and not(Z(0))) or
			  (not(Da_out(0)) and not(Z(0))) or
			  (Da_out(1) and Da_out(0) and not(Z(1)));

end Behavioral;

