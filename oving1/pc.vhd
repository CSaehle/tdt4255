----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:05:17 09/23/2012 
-- Design Name: 
-- Module Name:    pc - Behavioral 
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

entity pc is
    Port ( CLK : in  STD_LOGIC;
           W : in  STD_LOGIC;
           addr_put : in  STD_LOGIC_VECTOR (31 downto 0);
           addr_get : out  STD_LOGIC_VECTOR (31 downto 0));
end pc;

architecture Behavioral of pc is

begin

process(CLK, W)
begin
	if (rising_edge(CLK)) and (W = '1') then
		addr_get <= addr_put;
	end if;
end process;


end Behavioral;

