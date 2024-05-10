--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:46:17 05/10/2024
-- Design Name:   
-- Module Name:   C:/Users/wared/Desktop/univ/SAPEVS/sem2/lab4/lab4/lab3_10/mul_test.vhd
-- Project Name:  lab4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mul
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
 
ENTITY mul_test IS
END mul_test;
 
ARCHITECTURE behavior OF mul_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mul
    PORT(
         A : IN  std_logic_vector(1 downto 0);
         B : IN  std_logic_vector(1 downto 0);
         Y : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(1 downto 0) := (others => '0');
   signal B : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal Y : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mul PORT MAP (
          A => A,
          B => B,
          Y => Y
        );

   -- Clock process definitions
   clock_process :process
   begin		
		wait for clock_period;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		A <= "00";
		B <= "00";
		wait for clock_period;
		A <= "01";
		wait for clock_period;
		A <= "10";
		wait for clock_period;
		A <= "11";
		wait for clock_period;
		A <= "00";
		B <= "01";
		wait for clock_period;
		A <= "01";
		wait for clock_period;
		A <= "10";
		wait for clock_period;
		A <= "11";
		wait for clock_period;
		A <= "00";
		B <= "10";
		wait for clock_period;
		A <= "01";
		wait for clock_period;
		A <= "10";
		wait for clock_period;
		A <= "11";
		wait for clock_period;
		A <= "00";
		B <= "11";
		wait for clock_period;
		A <= "01";
		wait for clock_period;
		A <= "10";
		wait for clock_period;
		A <= "11";
		wait for clock_period;
		
      wait for clock_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
