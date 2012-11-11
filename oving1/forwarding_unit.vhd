----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:18:02 11/11/2012 
-- Design Name: 
-- Module Name:    forwarding_unit - Behavioral 
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

entity forwarding_unit is
    Port ( exmem_reg_write : in  STD_LOGIC;
           memwb_reg_write : in  STD_LOGIC;
           exmem_reg_rd : in  STD_LOGIC_VECTOR (4 downto 0);
           memwb_reg_rd : in  STD_LOGIC_VECTOR (4 downto 0);
           idex_reg_rs : in  STD_LOGIC_VECTOR (4 downto 0);
           idex_reg_rt : in  STD_LOGIC_VECTOR (4 downto 0);
           forward_a : out  STD_LOGIC_VECTOR (1 downto 0);
           forward_b : out  STD_LOGIC_VECTOR (1 downto 0));
end forwarding_unit;

architecture Behavioral of forwarding_unit is

begin

process (exmem_reg_write, memwb_reg_write, exmem_reg_rd, memwb_reg_rd, idex_reg_rs, idex_reg_rt)
begin
	-- 1a
	if ((exmem_reg_write = '1') and (exmem_reg_rd /= "00000") and (exmem_reg_rd = idex_reg_rs)) then
		forward_a <= "10";
	-- 2a
	elsif ((memwb_reg_write = '1') and (memwb_reg_rd /= "00000") and (exmem_reg_rd /= idex_reg_rs) and (memwb_reg_rd = idex_reg_rs)) then
		forward_a <= "01";
	-- default
	else
		forward_a <= "00";
	end if;
	
	-- 1b
	if ((exmem_reg_write = '1') and (exmem_reg_rd /= "00000") and (exmem_reg_rd = idex_reg_rt)) then
		forward_b <= "10";
	-- 2b
	elsif ((memwb_reg_write = '1') and (memwb_reg_rd /= "00000") and (memwb_reg_rd /= idex_reg_rt) and (memwb_reg_rd = idex_reg_rt)) then
		forward_b <= "01";
	-- default
	else
		forward_b <= "00";
	end if;

end process;

end Behavioral;

