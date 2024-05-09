----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:02:03 05/09/2024 
-- Design Name: 
-- Module Name:    mux_3_1 - Behavioral 
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

entity mux_3_1 is
port(
	S	: in std_logic_vector(1 downto 0);
	X	: in std_logic_vector(2 downto 0);
	Y	: out std_logic
);
end mux_3_1;

architecture Behavioral of mux_3_1 is

begin

Y <=	X(0) when S = "00" else
		X(1) when S = "01" else
		X(2) when S = "10" else
		'0'  when S = "11";

end Behavioral;

