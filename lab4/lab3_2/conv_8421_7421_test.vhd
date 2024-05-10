--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:46:15 05/10/2024
-- Design Name:   
-- Module Name:   C:/Users/tabet/Desktop/un/SAPEVS/sem2/lab3/lab4/lab3_2/conv_8421_7421_test.vhd
-- Project Name:  lab3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: conv_8421_7421
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
 
ENTITY conv_8421_7421_test IS
END conv_8421_7421_test;
 
ARCHITECTURE behavior OF conv_8421_7421_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT conv_8421_7421
    PORT(
         X : IN  std_logic_vector(3 downto 0);
         Y : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal X : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Y : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: conv_8421_7421 PORT MAP (
          X => X,
          Y => Y
        );

   -- Clock process definitions
   clock_process :process
   begin
		wait for clock_period;
		if(X = "1001") then
			X <= "0000";
		else
			X <= std_logic_vector(unsigned(X) + "0001");
		end if;
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
