----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:10:29 05/10/2024 
-- Design Name: 
-- Module Name:    shift_reg - Behavioral 
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

entity shift_reg is
port(
	clk	: in std_logic;
	D_in	: in std_logic;
	S		: in std_logic_vector(2 downto 0);
	WE		: in std_logic;
	OE		: in std_logic;
	RES	: in std_logic;
	D_out	: out std_logic
);
end shift_reg;

architecture Behavioral of shift_reg is

signal D	 : unsigned(7 downto 0) := "00000000";
signal Do : unsigned(7 downto 0) := "00000000";

begin

main: process(clk, RES) begin
	if(rising_edge(clk)) then
		if(OE = '1') then
			Do <= D;
		else
			Do <= SHIFT_RIGHT(Do, 1);
			D_out <= std_logic(Do(0));
		end if;
		
		if(WE = '1') then
			D <= SHIFT_RIGHT(D, 1);
			D(7) <= D_in;			
		else
			D <= SHIFT_LEFT(D, to_integer(unsigned(S)));
		end if;
	end if;
	
	if(res = '1') then
		D<="00000000";
	end if;
	
end process;

end Behavioral;

