----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:38:34 10/13/2012 
-- Design Name: 
-- Module Name:    reg_32 - Behavioral 
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

entity reg_32 is
    Port ( reg_in : in  STD_LOGIC_VECTOR (31 downto 0);
           reg_out : out  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end reg_32;

architecture Behavioral of reg_32 is

begin
	process (clk, reset, reg_in)
	begin
		if (reset = '1') then
			reg_out <= (others => '0');
		elsif (rising_edge(clk)) then
			reg_out <= reg_in;
		end if;
	end process;

end Behavioral;

