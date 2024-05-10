----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:58:34 05/10/2024 
-- Design Name: 
-- Module Name:    sistol - Behavioral 
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

entity sistol is
	generic(
		N	: integer := 4
	);
	port(
		sum_in : in std_logic_vector(N*2-1 downto 0);
		mul_in_A : in std_logic_vector(N-1 downto 0);
		mul_in_B : in std_logic_vector(N*2-1 downto 0);
		
		sum_c_i : in std_logic;
		sum_c_o : out std_logic;
		
		mul_out : out std_logic_vector(N*4-1 downto 0)
		
	);
end sistol;

architecture Behavioral of sistol is

component mul 
		port(
		A : in std_logic_vector(1 downto 0);
		B : in std_logic_vector(1 downto 0);
		Y : out std_logic_vector(3 downto 0)
	);
end component;

component sum_2 
	port(
		A		: in std_logic;
		B		: in std_logic;
		Cin	: in std_logic;
		S		: out std_logic;
		Cout	: out std_logic
		);
end component;

signal sum_p1 		: std_logic_vector(N-1 downto 0);
signal sum_p2 		: std_logic_vector(N-1 downto 0);
signal sum_c_in  	: std_logic_vector(N-1 downto 0);
begin

	sum_gen: for i in 0 to N-1 generate
		sum2_gen: sum_2 port map(
			sum_in(i*2),
			sum_in((i*2)+1),
			sum_c_in(i),
			sum_p1(i),
			sum_p2(i)
		);
	end generate sum_gen;
	
	sum_c_in(N-1 downto 1) <= sum_p2(N-2 downto 0);
	
	sum_c_in(0) <= sum_c_i;
	sum_c_o <= sum_p2(N-1);
	
	mul_gen: for i in 0 to N-1 generate
		mul_genL: mul port map(
			A(0) => mul_in_B(i*2),
			A(1) => mul_in_B((i*2)+1),
			B(0) => mul_in_A(i),
			B(1) => sum_p1(i),
			Y => mul_out(((i+1)*4)-1 downto i*4)
		);
	end generate mul_gen;
end Behavioral;

