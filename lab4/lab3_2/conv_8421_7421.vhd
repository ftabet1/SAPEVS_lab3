----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:37:41 05/10/2024 
-- Design Name: 
-- Module Name:    conv_8421_7421 - Behavioral 
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

entity conv_8421_7421 is
port(
	X : in std_logic_vector(3 downto 0);
	Y : out std_logic_vector(3 downto 0)
);
end conv_8421_7421;

architecture Behavioral of conv_8421_7421 is

begin

Y <=  "0000" when X = "0000" else
		"0001" when X = "0001" else
		"0010" when X = "0010" else
		"0011" when X = "0011" else
		"0100" when X = "0100" else
		"0101" when X = "0101" else
		"0110" when X = "0110" else
		"1000" when X = "0111" else
		"1001" when X = "1000" else
		"1010" when X = "1001";

end Behavioral;