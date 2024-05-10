----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:51:32 05/10/2024 
-- Design Name: 
-- Module Name:    encoder_12_4 - Behavioral 
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

entity encoder_12_4 is
port(
		input		: in	std_logic_vector(11 downto 0);
		output	: out std_logic_vector(3 downto 0)
		);
end encoder_12_4;

architecture Behavioral of encoder_12_4 is

begin
	output(0) <= input(0) or input(2) or input(4) or input(6) or input(8) or input(10);
	output(1) <= input(1) or input(2) or input(5) or input(6) or input(9) or input(10);
	output(2) <= input(3) or input(4) or input(5) or input(6) or input(11);
	output(3) <= input(7) or input(8) or input(9) or input(10) or input(11);
end Behavioral;

