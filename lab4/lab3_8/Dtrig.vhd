----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:08:13 05/10/2024 
-- Design Name: 
-- Module Name:    Dtrig - Behavioral 
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

entity Dtrig is
port(
	clk : in std_logic;
	D : in std_logic;
	R : in std_logic;
	Q : out std_logic
);
end Dtrig;

architecture Behavioral of Dtrig is

begin
	dtrig: process(clk) begin
		if(rising_edge(clk)) then
			if(R = '1') then
				Q <= '0';
			else
				Q <= D;
			end if;
			
		end if;
	end process;
end Behavioral;

