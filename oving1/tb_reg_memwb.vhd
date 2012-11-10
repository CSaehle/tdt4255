--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:06:05 10/20/2012
-- Design Name:   
-- Module Name:   Z:/git/GitHub/tdt4255/oving1/tb_reg_memwb.vhd
-- Project Name:  oving1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: reg_memwb
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
 
ENTITY tb_reg_memwb IS
END tb_reg_memwb;
 
ARCHITECTURE behavior OF tb_reg_memwb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT reg_memwb
    PORT(
         reg_write_in : IN  std_logic;
         reg_write_out : OUT  std_logic;
         mem_to_reg_in : IN  std_logic;
         mem_to_reg_out : OUT  std_logic;
         alu_res_in : IN  std_logic_vector(31 downto 0);
         alu_res_out : OUT  std_logic_vector(31 downto 0);
         rd_selected_in : IN  std_logic_vector(4 downto 0);
         rd_selected_out : OUT  std_logic_vector(4 downto 0);
         clk : IN  std_logic;
         reset : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal reg_write_in : std_logic := '0';
   signal mem_to_reg_in : std_logic := '0';
   signal alu_res_in : std_logic_vector(31 downto 0) := (others => '0');
   signal rd_selected_in : std_logic_vector(4 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal reg_write_out : std_logic;
   signal mem_to_reg_out : std_logic;
   signal alu_res_out : std_logic_vector(31 downto 0);
   signal rd_selected_out : std_logic_vector(4 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: reg_memwb PORT MAP (
          reg_write_in => reg_write_in,
          reg_write_out => reg_write_out,
          mem_to_reg_in => mem_to_reg_in,
          mem_to_reg_out => mem_to_reg_out,
          alu_res_in => alu_res_in,
          alu_res_out => alu_res_out,
          rd_selected_in => rd_selected_in,
          rd_selected_out => rd_selected_out,
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

      wait;
   end process;

END;
