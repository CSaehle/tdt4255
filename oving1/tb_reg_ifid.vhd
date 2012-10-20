--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:51:00 10/20/2012
-- Design Name:   
-- Module Name:   Z:/git/GitHub/tdt4255/oving1/tb_reg_ifid.vhd
-- Project Name:  oving1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: reg_ifid
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
 
ENTITY tb_reg_ifid IS
END tb_reg_ifid;
 
ARCHITECTURE behavior OF tb_reg_ifid IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT reg_ifid
    PORT(
         pc_in : IN  std_logic_vector(31 downto 0);
         pc_out : OUT  std_logic_vector(31 downto 0);
         instr_in : IN  std_logic_vector(31 downto 0);
         instr_out : OUT  std_logic_vector(31 downto 0);
         clk : IN  std_logic;
         reset : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal pc_in : std_logic_vector(31 downto 0) := (others => '0');
   signal instr_in : std_logic_vector(31 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal pc_out : std_logic_vector(31 downto 0);
   signal instr_out : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: reg_ifid PORT MAP (
          pc_in => pc_in,
          pc_out => pc_out,
          instr_in => instr_in,
          instr_out => instr_out,
          clk => clk,
          reset => reset
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
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 
		
		pc_in <=		"11111111111111111111111111111111";
		instr_in <=	"11111111111111111111111111111111";
		wait for clk_period;
		pc_in <=		"00000000000000000000000000000001";
		instr_in <=	"00000000000000000000000000000001";
		wait for clk_period;
		pc_in <=		"00000110010100101101001010111001";
		instr_in <=	"00011101000101011010010101101010";

      wait;
   end process;

END;
