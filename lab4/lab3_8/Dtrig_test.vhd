--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:53:34 05/10/2024
-- Design Name:   
-- Module Name:   C:/Users/tabet/Desktop/un/SAPEVS/sem2/lab3/lab4/lab3_8/Dtrig_test.vhd
-- Project Name:  lab3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Dtrig
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
 
ENTITY Dtrig_test IS
END Dtrig_test;
 
ARCHITECTURE behavior OF Dtrig_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Dtrig
    PORT(
         clk : IN  std_logic;
         D : IN  std_logic;
         R : IN  std_logic;
         Q : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal D : std_logic := '0';
   signal R : std_logic := '0';

 	--Outputs
   signal Q : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Dtrig PORT MAP (
          clk => clk,
          D => D,
          R => R,
          Q => Q
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		R <= '1';
      wait for 101 ns;	
		R <= '0';
		D <= '0';
		wait for clk_period;
		D <= '1';
		wait for clk_period;
		D <= '0';
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
