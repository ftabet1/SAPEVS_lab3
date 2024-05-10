----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:27:30 05/10/2024 
-- Design Name: 
-- Module Name:    mul - Behavioral 
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

entity mul is
	port(
		A : in std_logic_vector(1 downto 0);
		B : in std_logic_vector(1 downto 0);
		Y : out std_logic_vector(3 downto 0)
	);
end mul;

architecture Behavioral of mul is

component sum_2 
	port(
		A		: in std_logic;
		B		: in std_logic;
		Cin	: in std_logic;
		S		: out std_logic;
		Cout	: out std_logic
		);
end component;

signal and2_1_1 : std_logic;
signal and2_1_2 : std_logic;
signal and2_2_1 : std_logic;
signal and2_2_2 : std_logic;

signal sum2_1_c : std_logic;

begin

	and2_1_1 <= A(0) and B(0);
	and2_1_2 <= A(0) and B(1);
	and2_2_1 <= A(1) and B(0);
	and2_2_2 <= A(1) and B(1);
	
	sum2_1: sum_2 port map(and2_2_1, and2_1_2, '0', Y(1), sum2_1_c);
	sum2_2: sum_2 port map(sum2_1_c, and2_2_2, '0', Y(2), Y(3));
	Y(0) <= and2_1_1;
end Behavioral;

