--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:54:52 09/25/2012
-- Design Name:   
-- Module Name:   Z:/github/tdt4255/oving1/tb_pc_handle.vhd
-- Project Name:  oving1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: pc_handle
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
 
ENTITY tb_pc_handle IS
END tb_pc_handle;
 
ARCHITECTURE behavior OF tb_pc_handle IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT pc_handle
    PORT(
         pc_current : IN  std_logic_vector(31 downto 0);
         offset : IN  std_logic_vector(31 downto 0);
         jump_inst : IN  std_logic_vector(25 downto 0);
			jump: IN std_logic;
         zero : IN  std_logic;
         branch : IN  std_logic;
         pc_next : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal pc_current : std_logic_vector(31 downto 0) := (others => '0');
   signal offset : std_logic_vector(31 downto 0) := (others => '0');
   signal jump_inst : std_logic_vector(25 downto 0) := (others => '0');
	signal jump : std_logic := '0';
   signal zero : std_logic := '0';
   signal branch : std_logic := '0';

 	--Outputs
   signal pc_next : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: pc_handle PORT MAP (
          pc_current => pc_current,
          offset => offset,
          jump_inst => jump_inst,
			 jump => jump,
          zero => zero,
          branch => branch,
          pc_next => pc_next
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
		
		offset ( 15 downto 12) <= "1111";
		
		--pc_current <= 0x"4";
		

      wait;
   end process;

END;
