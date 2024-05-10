--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:30:59 05/10/2024
-- Design Name:   
-- Module Name:   C:/Users/tabet/Desktop/un/SAPEVS/sem2/lab3/lab4/lab3_9/ram8x32_test.vhd
-- Project Name:  lab3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ram8x32
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
 
ENTITY ram8x32_test IS
END ram8x32_test;
 
ARCHITECTURE behavior OF ram8x32_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ram8x32
    PORT(
         clk : IN  std_logic;
         A : IN  std_logic_vector(4 downto 0);
         D : INOUT  std_logic_vector(7 downto 0) := "00000000";
         OE : IN  std_logic;
         nWE : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal A : std_logic_vector(4 downto 0) := "00000";
   signal OE : std_logic := '0';
   signal nWE : std_logic := '0';
	signal OEnWE : std_logic := '1';

	--BiDirs
   signal D : std_logic_vector(7 downto 0);
	
   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ram8x32 PORT MAP (
          clk => clk,
          A => A,
          D => D,
          OE => OEnWE,
          nWE => OEnWE
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
		OEnWE <= '1';
      -- hold reset state for 100 ns.
      wait for 101 ns;	
		D <= "00001111";
		OEnWE <= '0';
		wait for clk_period;
		D <= std_logic_vector(unsigned(D) + "00000001");
		A <= std_logic_vector(unsigned(A) + "00001");
		wait for clk_period;
		D <= std_logic_vector(unsigned(D) + "00000001");
		A <= std_logic_vector(unsigned(A) + "00001");
		wait for clk_period;
		D <= std_logic_vector(unsigned(D) + "00000001");
		A <= std_logic_vector(unsigned(A) + "00001");
		wait for clk_period;
		D <= std_logic_vector(unsigned(D) + "00000001");
		A <= std_logic_vector(unsigned(A) + "00001");
		wait for clk_period;
		OEnWE <= '1';
		D <= "ZZZZZZZZ";
		A <= "00000";
		wait for clk_period;
		A <= std_logic_vector(unsigned(A) + "00001");
      wait for clk_period;
		A <= std_logic_vector(unsigned(A) + "00001");
      wait for clk_period;
		A <= std_logic_vector(unsigned(A) + "00001");
      wait for clk_period;
		A <= std_logic_vector(unsigned(A) + "00001");
		wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
