----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:12:52 05/09/2024 
-- Design Name: 
-- Module Name:    behav - Behavioral 
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

entity behav is
	port(
			X : in std_logic_vector(3 downto 0);
			Y : out std_logic_vector(4 downto 0)
		);
end behav;

architecture Behavioral of behav is
	 --step1
	 signal N_1_1 		: std_logic;
	 signal N_1_2 		: std_logic;
	 signal N_1_3 		: std_logic;
	 signal N_1_4 		: std_logic;
	 signal N_1_5 		: std_logic;
	 signal NO2_1_1	: std_logic;
	 
	 --step2
	 signal NO2_2_1 	: std_logic;
	 signal O2_2_1 	: std_logic;
	 signal O2_2_2 	: std_logic;
	 signal N_2_1 		: std_logic;
	 signal NA4_2_1 	: std_logic;
	 signal NA3O2_2_1 : std_logic;
	 signal NO4_2_1 	: std_logic;
	 
	 --step3
	 signal NOAO2_3_1 : std_logic;
	 signal NO3_3_1 	: std_logic;
	 signal NAO3_3_1	: std_logic;
	 signal NA3O2_3_1 : std_logic;
begin

	N_1_1 <= not(NAO3_3_1) after 1 ns;
	N_1_2 <= not(X(0)) after 1 ns;
	N_1_3 <= not(X(3)) after 1 ns;
	N_1_4 <= not(X(2)) after 1 ns;
	N_1_5 <= not(X(1)) after 1 ns;
	NO2_1_1 <= not(X(1) or NO3_3_1) after 3 ns;
	
	O2_2_1 <= (X(0) or N_1_1) after 2 ns;
	O2_2_2 <= (X(0) or N_1_1) after 2 ns; --????
	N_2_1	 <= not(N_1_1) after 1 ns;
	NA4_2_1 <= not(X(2) and X(0) and N_1_5 and X(3)) after 5 ns;
	NO2_2_1 <= not(N_1_2 or X(3)) after 3 ns;
	NA3O2_2_1 <= not(N_1_3 and NO2_1_1 and (X(2) or X(0))) after 4 ns;
	NO4_2_1 <= not(N_1_4 or N_1_3 or X(0) or N_1_5) after 5 ns;
	
	NOAO2_3_1 <= not(N_1_3 or (O2_2_1 and(NO4_2_1 or N_2_1))) after 4 ns;
	NO3_3_1 <= not(N_1_4 or N_1_2 or X(3)) after 4 ns;
	NAO3_3_1 <= not(NA3O2_2_1 and (NO2_2_1 or X(2) or N_1_5)) after 5 ns;
	NA3O2_3_1 <= not(O2_2_2 and NA4_2_1 and (X(3) or N_1_5)) after 4 ns;

	Y(0) <= NAO3_3_1;
	Y(1) <= NOAO2_3_1;
	Y(2) <= NO4_2_1;
	Y(3) <= NO3_3_1;
	Y(4) <= NA3O2_3_1;
end Behavioral;

