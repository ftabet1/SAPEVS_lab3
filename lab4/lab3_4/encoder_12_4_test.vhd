--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:52:55 05/10/2024
-- Design Name:   
-- Module Name:   C:/Users/wared/Desktop/univ/SAPEVS/sem2/lab4/lab4/lab3_4/encoder_12_4_test.vhd
-- Project Name:  lab4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: encoder_12_4
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
use ieee.numeric_std.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY encoder_12_4_test IS
END encoder_12_4_test;
 
ARCHITECTURE behavior OF encoder_12_4_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT encoder_12_4
    PORT(
         input : IN  std_logic_vector(11 downto 0);
         output : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal input : std_logic_vector(11 downto 0) := "000000000001";

 	--Outputs
   signal output : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: encoder_12_4 PORT MAP (
          input => input,
          output => output
        );

   -- Clock process definitions
   clock_process :process
   begin
		wait for clock_period/2;
		input <= std_logic_vector(SHIFT_LEFT(unsigned(input), 1));
   end process;
 

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
