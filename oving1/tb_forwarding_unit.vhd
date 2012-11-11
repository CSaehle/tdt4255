--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:11:57 11/11/2012
-- Design Name:   
-- Module Name:   C:/Users/chribru/Desktop/GitHub/tdt4255/oving1/tb_forwarding_unit.vhd
-- Project Name:  oving1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: forwarding_unit
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
 
ENTITY tb_forwarding_unit IS
END tb_forwarding_unit;
 
ARCHITECTURE behavior OF tb_forwarding_unit IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT forwarding_unit
    PORT(
         exmem_reg_write : IN  std_logic;
         memwb_reg_write : IN  std_logic;
         exmem_reg_rd : IN  std_logic_vector(4 downto 0);
         memwb_reg_rd : IN  std_logic_vector(4 downto 0);
         idex_reg_rs : IN  std_logic_vector(4 downto 0);
         idex_reg_rt : IN  std_logic_vector(4 downto 0);
         forward_a : OUT  std_logic_vector(1 downto 0);
         forward_b : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal exmem_reg_write : std_logic := '0';
   signal memwb_reg_write : std_logic := '0';
   signal exmem_reg_rd : std_logic_vector(4 downto 0) := (others => '0');
   signal memwb_reg_rd : std_logic_vector(4 downto 0) := (others => '0');
   signal idex_reg_rs : std_logic_vector(4 downto 0) := (others => '0');
   signal idex_reg_rt : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal forward_a : std_logic_vector(1 downto 0);
   signal forward_b : std_logic_vector(1 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: forwarding_unit PORT MAP (
          exmem_reg_write => exmem_reg_write,
          memwb_reg_write => memwb_reg_write,
          exmem_reg_rd => exmem_reg_rd,
          memwb_reg_rd => memwb_reg_rd,
          idex_reg_rs => idex_reg_rs,
          idex_reg_rt => idex_reg_rt,
          forward_a => forward_a,
          forward_b => forward_b
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
		
		exmem_reg_write <= '1';
		memwb_reg_write <= '0';
		exmem_reg_rd <= "00111";
		memwb_reg_rd <= "00000";
		idex_reg_rs <= "00111";
		idex_reg_rt <= "00000";
		
		wait for 10 ns;
		
		exmem_reg_write <= '1';
		memwb_reg_write <= '0';
		exmem_reg_rd <= "00111";
		memwb_reg_rd <= "00111";
		idex_reg_rs <= "00111";
		idex_reg_rt <= "00000";
		
		wait for 10 ns;
		
		exmem_reg_write <= '0';
		memwb_reg_write <= '1';
		exmem_reg_rd <= "00111";
		memwb_reg_rd <= "00111";
		idex_reg_rs <= "00111";
		idex_reg_rt <= "00000";		
		
		wait for 10 ns;
		
		exmem_reg_write <= '1';
		memwb_reg_write <= '1';
		exmem_reg_rd <= "00111";
		memwb_reg_rd <= "00111";
		idex_reg_rs <= "00111";
		idex_reg_rt <= "00000";
		
		wait for 10 ns;
		
		exmem_reg_write <= '0';
		memwb_reg_write <= '1';
		exmem_reg_rd <= "00111";
		memwb_reg_rd <= "00111";
		idex_reg_rs <= "00111";
		idex_reg_rt <= "00000";
		
		wait for 10 ns;
		
		exmem_reg_write <= '0';
		memwb_reg_write <= '0';
		exmem_reg_rd <= "00111";
		memwb_reg_rd <= "00111";
		idex_reg_rs <= "00111";
		idex_reg_rt <= "00000";
		
		wait for 10 ns;
		
		exmem_reg_write <= '0';
		memwb_reg_write <= '1';
		exmem_reg_rd <= "00111";
		memwb_reg_rd <= "00111";
		idex_reg_rs <= "00111";
		idex_reg_rt <= "00000";	

      wait;
   end process;

END;
