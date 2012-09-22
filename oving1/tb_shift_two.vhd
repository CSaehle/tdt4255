--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:50:15 09/22/2012
-- Design Name:   
-- Module Name:   Z:/git/GitHub/tdt4255/oving1/tb_shift_two.vhd
-- Project Name:  oving1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: shift_two
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
 
ENTITY tb_shift_two IS
END tb_shift_two;
 
ARCHITECTURE behavior OF tb_shift_two IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT shift_two
    PORT(
         in_addr : IN  std_logic_vector(31 downto 0);
         out_addr : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal in_addr : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal out_addr : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: shift_two PORT MAP (
          in_addr => in_addr,
          out_addr => out_addr
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;

      -- insert stimulus here 
		in_addr <= "00000000"&"00000000"&"00000000"&"00000001";
		wait for 100 ns;
		in_addr <= "11111111"&"11111111"&"11111111"&"11110111";
		wait for 100 ns;
		in_addr <= "00000000"&"00000000"&"01100111"&"00101101";
		wait for 100 ns;
		in_addr <= "11111111"&"11111111"&"11111111"&"11111111";
		wait for 100 ns;

      wait;
   end process;

END;
