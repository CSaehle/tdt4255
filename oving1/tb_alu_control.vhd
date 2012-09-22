--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:09:20 09/22/2012
-- Design Name:   
-- Module Name:   Z:/git/GitHub/tdt4255/oving1/tb_alu_control.vhd
-- Project Name:  oving1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: alu_control
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
 
ENTITY tb_alu_control IS
END tb_alu_control;
 
ARCHITECTURE behavior OF tb_alu_control IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT alu_control
    PORT(
         alu_op : IN  std_logic_vector(1 downto 0);
         funct : IN  std_logic_vector(5 downto 0);
         alu_control_input : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal alu_op : std_logic_vector(1 downto 0) := (others => '0');
   signal funct : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal alu_control_input : std_logic_vector(3 downto 0);
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: alu_control PORT MAP (
          alu_op => alu_op,
          funct => funct,
          alu_control_input => alu_control_input
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
		-- LW / SW
		alu_op <= "00";
		funct <= "000001"; -- (0010)
		wait for 25 ns;
		funct <= "111111"; -- (0010)
		wait for 25 ns;
		funct <= "000001"; -- (0010)
		wait for 25 ns;
		funct <= "000000"; -- (0010)
		wait for 25 ns;
		-- beq
		alu_op <= "01"; -- (0110)
		wait for 100 ns;
		-- R-type
		alu_op <= "10";
		funct <= "100000"; -- add (0010)
		wait for 50 ns;
		funct <= "100010"; -- subtract (0110)
		wait for 50 ns;
		funct <= "100100"; -- AND (0000)
		wait for 50 ns;
		funct <= "100101"; -- OR (0001)
		wait for 50 ns;
		funct <= "101010"; -- set on less than (0111)

      wait;
   end process;

END;
