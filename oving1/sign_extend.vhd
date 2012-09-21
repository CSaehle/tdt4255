----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:44:55 09/21/2012 
-- Design Name: 
-- Module Name:    sign_extend - Behavioral 
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

entity sign_extend is
    Port ( in_addr : in  STD_LOGIC_VECTOR (15 downto 0);
           out_addr : out  STD_LOGIC_VECTOR (31 downto 0));
end sign_extend;

architecture Behavioral of sign_extend is
begin
	out_addr (15 downto 0) <= in_addr (15 downto 0);
	out_addr (31 downto 16) <= (others => in_addr(15));

end Behavioral;

