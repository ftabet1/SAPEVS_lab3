--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:30:08 05/10/2024
-- Design Name:   
-- Module Name:   C:/Users/tabet/Desktop/un/SAPEVS/sem2/lab3/lab4/lab3_8/mili_machine_test.vhd
-- Project Name:  lab3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mili_machine
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
 
ENTITY mili_machine_test IS
END mili_machine_test;
 
ARCHITECTURE behavior OF mili_machine_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mili_machine
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         Z : IN  std_logic_vector(1 downto 0);
         W : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal Z : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal W : std_logic_vector(2 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mili_machine PORT MAP (
          clk => clk,
          reset => reset,
          Z => Z,
          W => W
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
		reset <= '1';
      wait for 101 ns;	
		reset <= '0';
		Z <= "01";		--a0 -> a2 (w3)
		wait for clk_period;
		Z <= "00";		--a2 -> a1 (w2)
		wait for clk_period;
		Z <= "10";		--a1 -> a3 (w3)
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
