--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:30:21 09/29/2012
-- Design Name:   
-- Module Name:   Z:/github/tdt4255/oving1/tb_pc.vhd
-- Project Name:  oving1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: pc
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
 
ENTITY tb_pc IS
END tb_pc;
 
ARCHITECTURE behavior OF tb_pc IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT pc
    PORT(
         CLK : IN  std_logic;
         W : IN  std_logic;
         addr_put : IN  std_logic_vector(31 downto 0);
         addr_get : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal W : std_logic := '0';
   signal addr_put : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal addr_get : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: pc PORT MAP (
          CLK => CLK,
          W => W,
          addr_put => addr_put,
          addr_get => addr_get
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;
		W <= '0';
		wait for CLK_period*5;
		addr_put (7 downto 0) <= "10010110";
		wait for CLK_period*5;
		addr_put (7 downto 0) <= "01101001";
		wait for CLK_period*5;
		W <= '1';
		wait for CLK_period*5;
		addr_put (15 downto 8) <= "10010110";
      -- insert stimulus here 

      wait;
   end process;

END;
