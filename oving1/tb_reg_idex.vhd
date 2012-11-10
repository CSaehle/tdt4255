--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:01:29 10/20/2012
-- Design Name:   
-- Module Name:   Z:/git/GitHub/tdt4255/oving1/tb_reg_idex.vhd
-- Project Name:  oving1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: reg_idex
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
 
ENTITY tb_reg_idex IS
END tb_reg_idex;
 
ARCHITECTURE behavior OF tb_reg_idex IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT reg_idex
    PORT(
         reg_write_in : IN  std_logic;
         reg_write_out : OUT  std_logic;
         mem_to_reg_in : IN  std_logic;
         mem_to_reg_out : OUT  std_logic;
         branch_in : IN  std_logic;
         branch_out : OUT  std_logic;
         mem_read_in : IN  std_logic;
         mem_read_out : OUT  std_logic;
         mem_write_in : IN  std_logic;
         mem_write_out : OUT  std_logic;
         reg_dst_in : IN  std_logic;
         reg_dst_out : OUT  std_logic;
         alu_op_in : IN  std_logic_vector(1 downto 0);
         alu_op_out : OUT  std_logic_vector(1 downto 0);
         alu_src_in : IN  std_logic;
         alu_src_out : OUT  std_logic;
         pc_in : IN  std_logic_vector(31 downto 0);
         pc_out : OUT  std_logic_vector(31 downto 0);
         read_data_1_in : IN  std_logic_vector(31 downto 0);
         read_data_1_out : OUT  std_logic_vector(31 downto 0);
         read_data_2_in : IN  std_logic_vector(31 downto 0);
         read_data_2_out : OUT  std_logic_vector(31 downto 0);
         immediate_in : IN  std_logic_vector(31 downto 0);
         immediate_out : OUT  std_logic_vector(31 downto 0);
         rt_in : IN  std_logic_vector(4 downto 0);
         rt_out : OUT  std_logic_vector(4 downto 0);
         rd_in : IN  std_logic_vector(4 downto 0);
         rd_out : OUT  std_logic_vector(4 downto 0);
         clk : IN  std_logic;
         reset : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal reg_write_in : std_logic := '0';
   signal mem_to_reg_in : std_logic := '0';
   signal branch_in : std_logic := '0';
   signal jump_in : std_logic := '0';
   signal jump_target_in : std_logic_vector(25 downto 0) := (others => '0');
   signal mem_read_in : std_logic := '0';
   signal mem_write_in : std_logic := '0';
   signal reg_dst_in : std_logic := '0';
   signal alu_op_in : std_logic_vector(1 downto 0) := (others => '0');
   signal alu_src_in : std_logic := '0';
   signal pc_in : std_logic_vector(31 downto 0) := (others => '0');
   signal read_data_1_in : std_logic_vector(31 downto 0) := (others => '0');
   signal read_data_2_in : std_logic_vector(31 downto 0) := (others => '0');
   signal immediate_in : std_logic_vector(31 downto 0) := (others => '0');
   signal rt_in : std_logic_vector(4 downto 0) := (others => '0');
   signal rd_in : std_logic_vector(4 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal reg_write_out : std_logic;
   signal mem_to_reg_out : std_logic;
   signal branch_out : std_logic;
   signal jump_out : std_logic;
   signal jump_target_out : std_logic_vector(25 downto 0);
   signal mem_read_out : std_logic;
   signal mem_write_out : std_logic;
   signal reg_dst_out : std_logic;
   signal alu_op_out : std_logic_vector(1 downto 0);
   signal alu_src_out : std_logic;
   signal pc_out : std_logic_vector(31 downto 0);
   signal read_data_1_out : std_logic_vector(31 downto 0);
   signal read_data_2_out : std_logic_vector(31 downto 0);
   signal immediate_out : std_logic_vector(31 downto 0);
   signal rt_out : std_logic_vector(4 downto 0);
   signal rd_out : std_logic_vector(4 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: reg_idex PORT MAP (
          reg_write_in => reg_write_in,
          reg_write_out => reg_write_out,
          mem_to_reg_in => mem_to_reg_in,
          mem_to_reg_out => mem_to_reg_out,
          branch_in => branch_in,
          branch_out => branch_out,
          jump_in => jump_in,
          jump_out => jump_out,
          jump_target_in => jump_target_in,
          jump_target_out => jump_target_out,
          mem_read_in => mem_read_in,
          mem_read_out => mem_read_out,
          mem_write_in => mem_write_in,
          mem_write_out => mem_write_out,
          reg_dst_in => reg_dst_in,
          reg_dst_out => reg_dst_out,
          alu_op_in => alu_op_in,
          alu_op_out => alu_op_out,
          alu_src_in => alu_src_in,
          alu_src_out => alu_src_out,
          pc_in => pc_in,
          pc_out => pc_out,
          read_data_1_in => read_data_1_in,
          read_data_1_out => read_data_1_out,
          read_data_2_in => read_data_2_in,
          read_data_2_out => read_data_2_out,
          immediate_in => immediate_in,
          immediate_out => immediate_out,
          rt_in => rt_in,
          rt_out => rt_out,
          rd_in => rd_in,
          rd_out => rd_out,
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
