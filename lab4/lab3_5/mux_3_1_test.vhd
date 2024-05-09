--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:05:40 05/09/2024
-- Design Name:   
-- Module Name:   C:/Users/wared/Desktop/univ/SAPEVS/sem2/lab4/lab4/lab3_5/mux_3_1_test.vhd
-- Project Name:  lab4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux_3_1
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY mux_3_1_test IS
END mux_3_1_test;
 
ARCHITECTURE behavior OF mux_3_1_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux_3_1
    PORT(
         S : IN  std_logic_vector(1 downto 0);
         X : IN  std_logic_vector(2 downto 0);
         Y : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal S : std_logic_vector(1 downto 0) := (others => '0');
   signal X : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal Y : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux_3_1 PORT MAP (
          S => S,
          X => X,
          Y => Y
        );

   -- Clock process definitions
   clock_process :process
   begin
		--clock <= '0';
		wait for clock_period/2;
		--clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 50 ns;	
		X<="000";
		S<="00";
		wait for 50 ns;
		S<="01";
		wait for 50 ns;
		S<="10";
		wait for 50 ns;
		S<="11";
		wait for 100 ns;
		
		X<="001";
		S<="00";
		wait for 50 ns;
		S<="01";
		wait for 50 ns;
		S<="10";
		wait for 50 ns;
		S<="11";
		wait for 100 ns;
		
		X<="010";
		S<="00";
		wait for 50 ns;
		S<="01";
		wait for 50 ns;
		S<="10";
		wait for 50 ns;
		S<="11";
		wait for 100 ns;
		
		X<="100";
		S<="00";
		wait for 50 ns;
		S<="01";
		wait for 50 ns;
		S<="10";
		wait for 50 ns;
		S<="11";
		wait for 100 ns;
		wait for clock_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
