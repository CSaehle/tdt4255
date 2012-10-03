----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:50:38 09/22/2012 
-- Design Name: 
-- Module Name:    control_unit - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity control_unit is
    Port (
			  opcode : in  STD_LOGIC_VECTOR (5 downto 0);
           reg_dst : out  STD_LOGIC;
			  alu_src : out  STD_LOGIC;
           mem_to_reg : out  STD_LOGIC;
           reg_write : out  STD_LOGIC;
           mem_read : out  STD_LOGIC;
           mem_write : out  STD_LOGIC;
			  branch: out STD_LOGIC;
			  alu_op : out  STD_LOGIC_VECTOR (1 downto 0);
			  jump: out STD_LOGIC
	);
end control_unit;

architecture Behavioral of control_unit is

begin

process(opcode)
begin
	case opcode is
		when "000000" =>			-- R-format instructions
			reg_dst <= 		'1';
			alu_src <= 		'0';
			mem_to_reg <= 	'0';
			reg_write <= 	'1';
			mem_read <= 	'0';
			mem_write <= 	'0';
			branch <= 		'0';
			alu_op <= 		"10";
			jump <=			'0';
		when "100011" =>			-- load word
			reg_dst <= 		'0';
			alu_src <= 		'1';
			mem_to_reg <= 	'1';
			reg_write <= 	'1';
			mem_read <= 	'1';
			mem_write <= 	'0';
			branch <= 		'0';
			alu_op <= 		"00";
			jump <=			'0';
		when "101011" =>			-- store word
		 --reg_dst <= 		'0';  -- don't care
			alu_src <= 		'1';
		 --mem_to_reg <= 	'0';  -- don't care
			reg_write <= 	'0';
			mem_read <= 	'0';
			mem_write <= 	'1';
			branch <= 		'0';
			alu_op <= 		"00";
			jump <=			'0';
		when "000100" =>			-- branch on equal
		 --reg_dst <= 		'0';  -- don't care
			alu_src <= 		'0';
		 --mem_to_reg <= 	'0';  -- don't care
			reg_write <= 	'0';
			mem_read <= 	'0';
			mem_write <= 	'0';
			branch <= 		'1';
			alu_op <= 		"01";
			jump <=			'0';
		when "001111" =>			-- LDI (lui in standard MIPS)
			reg_dst <= 		'0';
			alu_src <= 		'1';
			mem_to_reg <= 	'0';
			reg_write <= 	'1';
			mem_read <= 	'0';
			mem_write <= 	'0';
			branch <= 		'0';
			alu_op <= 		"00";
			jump <=			'0';	
		when "000010" =>			-- jump
			reg_dst <= 		'0';
			alu_src <= 		'0';
			mem_to_reg <= 	'0';
			reg_write <= 	'0';
			mem_read <= 	'0';
			mem_write <= 	'0';
			branch <= 		'0';
			alu_op <= 		"00";
			jump <=			'1';			
		when others =>
			-- do nothing
	end case;
end process;
		


end Behavioral;

