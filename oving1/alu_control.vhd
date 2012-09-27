----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:17:04 09/22/2012 
-- Design Name: 
-- Module Name:    alu_control - Behavioral 
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

library WORK;
use WORK.MIPS_CONSTANT_PKG.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu_control is
    Port ( alu_op : in  STD_LOGIC_VECTOR (1 downto 0);
           funct : in  STD_LOGIC_VECTOR (5 downto 0);
           alu_control_input : out  ALU_INPUT);
end alu_control;


architecture Behavioral of alu_control is

begin
process (alu_op, funct)
	begin
		if (alu_op = "00") THEN alu_control_input <= "0010";
		elsif (alu_op = "01") THEN alu_control_input <= "0110";
		elsif (alu_op = "10" AND funct(3 downto 0) = "0000") THEN alu_control_input <= "0010";
		elsif (alu_op = "10" AND funct(3 downto 0) = "0010") THEN alu_control_input <= "0110";
		elsif (alu_op = "10" AND funct(3 downto 0) = "0100") THEN alu_control_input <= "0000";
		elsif (alu_op = "10" AND funct(3 downto 0) = "0101") THEN alu_control_input <= "0001";
		elsif (alu_op = "10" AND funct(3 downto 0) = "1010") THEN alu_control_input <= "0111";
		elsif (alu_op = "10") THEN alu_control_input <= "----";
		elsif (alu_op = "11") THEN alu_control_input <= "----";
		end if;
	end process;
end Behavioral;

