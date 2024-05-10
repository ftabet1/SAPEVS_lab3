----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:09:16 05/10/2024 
-- Design Name: 
-- Module Name:    ram8x32 - Behavioral 
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

entity ram8x32 is
port(
	clk : in std_logic;
	A	: in std_logic_vector(4 downto 0);
	D	: inout std_logic_vector(7 downto 0) := "00000000";
	OE	: in std_logic;
	nWE: in std_logic
);
end ram8x32;

architecture Behavioral of ram8x32 is

type mem_array is array(0 to 31) of  std_logic_vector(7 downto 0);
signal mem: mem_array := (others=>(others=>'0'));

signal nWEs : std_logic;

begin
		
		nWEs <= not(nWE);

		main: process(clk) begin
			if(rising_edge(clk) and (nWE = '0')) then
				mem(to_integer(unsigned(A))) <= D; 
			end if;
		end process;

		D <= mem(to_integer(unsigned(A))) when (OE = '1') else "ZZZZZZZZ";
		
end Behavioral;

