----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:32:42 05/09/2024 
-- Design Name: 
-- Module Name:    struct - Behavioral 
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
use work.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity struct is
	port(
		X : in std_logic_vector(3 downto 0);
		Y : out std_logic_vector(4 downto 0)
	);
end struct;

architecture Behavioral of struct is
	component N 
		port(
			X : in std_logic;
			Y : out std_logic);
	end component;
	
	component NA3O2 
		port(
			A : in std_logic;
			B : in std_logic;
			C : in std_logic;
			D : in std_logic;
			Y : out std_logic);
	 end component;
	
	component NA4 
		port(
			A : in std_logic;
			B : in std_logic;
			C : in std_logic;
			D : in std_logic;
			Y : out std_logic);
	 end component;
	 
	 component NAO3
		port(
			A : in std_logic;
			B : in std_logic;
			C : in std_logic;
			D : in std_logic;
			Y : out std_logic);
	 end component;
	 
	 component NO2
		port(
			A : in std_logic;
			B : in std_logic;
			Y : out std_logic);
	 end component;
	 
	 component NO3
		port(
			A : in std_logic;
			B : in std_logic;
			C : in std_logic;
			Y : out std_logic);
	 end component;
	 
	 component NO4
		port(
			A : in std_logic;
			B : in std_logic;
			C : in std_logic;
			D : in std_logic;
			Y : out std_logic);
	 end component;
	 
	 component NOAO2
		port(
			A : in std_logic;
			B : in std_logic;
			C : in std_logic;
			D : in std_logic;
			Y : out std_logic);
	 end component;
	 
	 component O2
		port(
			A : in std_logic;
			B : in std_logic;
			Y : out std_logic);
	 end component;
	 
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
	--step1
	N_1_1L:	 N port map(NAO3_3_1, N_1_1);
	N_1_2L:	 N port map(X(0), N_1_2);
	N_1_3L:	 N port map(X(3), N_1_3);
	N_1_4L:	 N port map(X(2), N_1_4);
	N_1_5L:	 N port map(X(1), N_1_5);
	NO2_1_1L: NO2 port map(X(1), NO3_3_1, NO2_1_1);
	
	--step2
	O2_2_1L:	O2 port map(X(0), N_1_1, O2_2_1);
	O2_2_2L: O2 port map(X(0), N_1_1, O2_2_2);
	N_2_1L: 	N  port map(N_1_1, N_2_1);
	NA4_2_1L: NA4 port map(X(2), X(0), N_1_5, X(3), NA4_2_1);
	NO2_2_1L: NO2 port map(N_1_2, X(3), NO2_2_1);
	NA3O2_2_1L: NA3O2 port map(N_1_3, NO2_1_1, X(2), X(0), NA3O2_2_1);
	NO4_2_1L:	NO4 port map(N_1_4, N_1_3, X(0), N_1_5, NO4_2_1);
	
	--step3
	NOAO2_3_1L:	NOAO2 port map(N_1_3, O2_2_1, NO4_2_1, N_2_1, NOAO2_3_1);
	NO3_3_1L:	NO3 port map(N_1_4, N_1_2, X(3), NO3_3_1);
	NAO3_3_1L:	NAO3 port map(NA3O2_2_1, NO2_2_1, X(2), N_1_5, NAO3_3_1);
	NA3O2_3_1L:	NA3O2 port map(O2_2_2, NA4_2_1, X(3), N_1_5, NA3O2_3_1);
	
	--out
	Y(0) <= NAO3_3_1;
	Y(1) <= NOAO2_3_1;
	Y(2) <= NO4_2_1;
	Y(3) <= NO3_3_1;
	Y(4) <= NA3O2_3_1;

end Behavioral;

