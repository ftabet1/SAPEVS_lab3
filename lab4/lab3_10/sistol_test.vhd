--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:41:45 05/10/2024
-- Design Name:   
-- Module Name:   C:/Users/wared/Desktop/univ/SAPEVS/sem2/lab4/lab4/sistol_test.vhd
-- Project Name:  lab4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: sistol
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
 
ENTITY sistol_test IS
END sistol_test;
 
ARCHITECTURE behavior OF sistol_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sistol
    PORT(
         sum_in : IN  std_logic_vector(7 downto 0);
         mul_in_A : IN  std_logic_vector(3 downto 0);
         mul_in_B : IN  std_logic_vector(7 downto 0);
         sum_c_i : IN  std_logic;
			sum_c_o : OUT  std_logic;
         mul_out : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal sum_in : std_logic_vector(7 downto 0) := (others => '0');
   signal mul_in_A : std_logic_vector(3 downto 0) := (others => '0');
   signal mul_in_B : std_logic_vector(7 downto 0) := (others => '0');
	signal sum_c_i : std_logic := '0';
	
 	--Outputs
   signal sum_c_o : std_logic;
   signal mul_out : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sistol PORT MAP (
          sum_in => sum_in,
          mul_in_A => mul_in_A,
          mul_in_B => mul_in_B,
          sum_c_i => sum_c_i,
			 sum_c_o => sum_c_o,
          mul_out => mul_out
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
		mul_in_a <= "0010";
		mul_in_b <= "10101010";
		wait for clock_period;
		sum_in <= "00100110";
		wait for clock_period;
		mul_in_a <= "0001";
		mul_in_b <= "00100010";
      sum_in <= "00101100";
		wait for clock_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
