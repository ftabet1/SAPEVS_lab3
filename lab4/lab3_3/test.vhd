--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:36:16 05/09/2024
-- Design Name:   
-- Module Name:   C:/Users/wared/Desktop/univ/SAPEVS/sem2/lab4/lab4/lab3_3/test.vhd
-- Project Name:  lab4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: behav
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
USE ieee.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test IS
END test;
 
ARCHITECTURE behavior OF test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT behav
    PORT(
         X : IN  std_logic_vector(3 downto 0);
         Y : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    
	 COMPONENT struct
    PORT(
         X : IN  std_logic_vector(3 downto 0);
         Y : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;

   --Inputs
   signal X : std_logic_vector(3 downto 0) := (others => '0');
	signal sum : unsigned(3 downto 0) := "0000";

 	--Outputs
   signal Y1 : std_logic_vector(4 downto 0);
	signal Y2 : std_logic_vector(4 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clock_period : time := 50 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: behav PORT MAP (
          X => X,
          Y => Y1
        );
		 
	uut2: behav PORT MAP (
          X => X,
          Y => Y2
        );

   -- Clock process definitions
   clock_process :process
   begin
		wait for clock_period/2;
		wait for clock_period/2;
		sum <= sum + "1";
   end process;
 
	X <= std_logic_vector(sum);
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
      wait for clock_period*10;
		
      -- insert stimulus here 

      wait;
   end process;

END;
