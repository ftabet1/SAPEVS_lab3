--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:36:40 05/10/2024
-- Design Name:   
-- Module Name:   C:/Users/tabet/Desktop/un/SAPEVS/sem2/lab3/lab4/lab3_7/shift_reg_test.vhd
-- Project Name:  lab3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: shift_reg
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
 
ENTITY shift_reg_test IS
END shift_reg_test;
 
ARCHITECTURE behavior OF shift_reg_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT shift_reg
    PORT(
         clk : IN  std_logic;
         D_in : IN  std_logic;
         S : IN  std_logic_vector(2 downto 0);
         WE : IN  std_logic;
         OE : IN  std_logic;
         RES : IN  std_logic;
         D_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal D_in : std_logic := '0';
   signal S : std_logic_vector(2 downto 0) := (others => '0');
   signal WE : std_logic := '0';
   signal OE : std_logic := '0';
   signal RES : std_logic := '0';

 	--Outputs
   signal D_out : std_logic;
	signal D_num : std_logic_vector(7 downto 0) := "01110100"; -- after shift << 3 = 10100000
   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: shift_reg PORT MAP (
          clk => clk,
          D_in => D_in,
          S => S,
          WE => WE,
          OE => OE,
          RES => RES,
          D_out => D_out
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
      RES <= '1';
		wait for 101 ns;
		RES <= '0';
		WE <= '1';
		D_in <= D_num(0);
		wait for clk_period;
		D_in <= D_num(1);
		wait for clk_period;
		D_in <= D_num(2);
		wait for clk_period;
		D_in <= D_num(3);
		wait for clk_period;
		D_in <= D_num(4);
		wait for clk_period;
		D_in <= D_num(5);
		wait for clk_period;
		D_in <= D_num(6);
		wait for clk_period;
		D_in <= D_num(7);
		wait for clk_period;
		OE <= '1';
		WE <= '0';
		wait for clk_period;
		OE <= '0';
		wait for clk_period*8;
		S <= "011";
		wait for clk_period;
		S <= "000";
		OE <= '1';
		wait for clk_period;
		OE <= '0';
      wait for clk_period*9;
		RES <= '1';
		wait for clk_period;
		RES <= '0';
		
		
		
		
		
      -- insert stimulus here 

      wait;
   end process;

END;
