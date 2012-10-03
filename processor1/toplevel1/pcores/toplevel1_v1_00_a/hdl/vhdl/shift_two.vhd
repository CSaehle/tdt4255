----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:46:07 09/22/2012 
-- Design Name: 
-- Module Name:    shift_two - Behavioral 
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

entity shift_two is
    Port ( in_addr : in  STD_LOGIC_VECTOR (31 downto 0);
           out_addr : out  STD_LOGIC_VECTOR (31 downto 0));
end shift_two;

architecture Behavioral of shift_two is

begin
	out_addr(31 downto 2) <= in_addr(29 downto 0);
	out_addr(1 downto 0) <= (others => '0');
end Behavioral;
