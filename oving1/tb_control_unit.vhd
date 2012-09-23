--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:22:53 09/22/2012
-- Design Name:   
-- Module Name:   Z:/github/tdt4255/oving1/tb_control_unit.vhd
-- Project Name:  oving1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: control_unit
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
 
ENTITY tb_control_unit IS
END tb_control_unit;
 
ARCHITECTURE behavior OF tb_control_unit IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT control_unit
    PORT(
         opcode : IN  std_logic_vector(5 downto 0);
         reg_dst : OUT  std_logic;
         alu_src : OUT  std_logic;
         mem_to_reg : OUT  std_logic;
         reg_write : OUT  std_logic;
         mem_read : OUT  std_logic;
         mem_write : OUT  std_logic;
         branch : OUT  std_logic;
         alu_op : OUT  std_logic_vector(1 downto 0);
			jump : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal opcode : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal reg_dst : std_logic;
   signal alu_src : std_logic;
   signal mem_to_reg : std_logic;
   signal reg_write : std_logic;
   signal mem_read : std_logic;
   signal mem_write : std_logic;
   signal branch : std_logic;
   signal alu_op : std_logic_vector(1 downto 0);
	signal jump : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: control_unit PORT MAP (
          opcode => opcode,
          reg_dst => reg_dst,
          alu_src => alu_src,
          mem_to_reg => mem_to_reg,
          reg_write => reg_write,
          mem_read => mem_read,
          mem_write => mem_write,
          branch => branch,
          alu_op => alu_op,
			 jump => jump
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		opcode <= "000000";
		
		wait for 100 ns;
		
		opcode <= "100011";
		
		wait for 100 ns;
		
		opcode <= "101011";
		
		wait for 100 ns;
		
		opcode <= "000100";
		
		wait for 100 ns;
		
		opcode <= "000010";
		
      wait for 100 ns;	
		
		opcode <= "000000";

      wait;
   end process;

END;
