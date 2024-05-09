----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:25:30 05/09/2024 
-- Design Name: 
-- Module Name:    counter - Behavioral 
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
use IEEE.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter is
port(
	clk : in std_logic;
	cnt : out std_logic_vector(4 downto 0)
);
	
end counter;

architecture Behavioral of counter is
	signal counter : unsigned(4 downto 0) := "00000";
begin

	clock: process(clk) begin
		if(rising_edge(clk)) then
			counter <= counter + "00001";
			if(counter = "10111") then
				counter <= "00000";
			end if;
		end if;
	end process;
	 cnt <= std_logic_vector(counter);
end Behavioral;

