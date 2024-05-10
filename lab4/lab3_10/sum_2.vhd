----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:22:04 05/10/2024 
-- Design Name: 
-- Module Name:    sum_2 - Behavioral 
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

entity sum_2 is
	port(
		A		: in std_logic;
		B		: in std_logic;
		Cin	: in std_logic;
		S		: out std_logic;
		Cout	: out std_logic
		);
end sum_2;
	
architecture Behavioral of sum_2 is

signal xor1: std_logic;
	
begin

	xor1 <= A xor B;
	S <= xor1 xor Cin;
	Cout <= (A and B) or (xor1 and Cin);

end Behavioral;

