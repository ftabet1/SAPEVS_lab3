----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:25:08 05/09/2024 
-- Design Name: 
-- Module Name:    NA3O2 - Behavioral 
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

entity NA3O2 is
port(
	A : in std_logic;
	B : in std_logic;
	C : in std_logic;
	D : in std_logic;
	Y : out std_logic
);
end NA3O2;

architecture Behavioral of NA3O2 is

begin

Y <= not(A and B and (C or D)) after 4 ns;

end Behavioral;

