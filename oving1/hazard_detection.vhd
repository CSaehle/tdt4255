----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:22:51 11/12/2012 
-- Design Name: 
-- Module Name:    hazard_detection - Behavioral 
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

entity hazard_detection is
    Port ( ex_mem_read : in  STD_LOGIC;
           ex_register_rt : in  STD_LOGIC_VECTOR (4 downto 0);
           id_register_rs : in  STD_LOGIC_VECTOR (4 downto 0);
           id_register_rt : in  STD_LOGIC_VECTOR (4 downto 0);
           reset_idex : out  STD_LOGIC;
           pc_write : out  STD_LOGIC;
           ifid_write : out  STD_LOGIC);
end hazard_detection;

architecture Behavioral of hazard_detection is

begin
	process(ex_mem_read,ex_register_rt,id_register_rs,id_register_rt)
	begin
		if ((ex_mem_read = '1') and ((ex_register_rt = id_register_rs) or (ex_register_rt = id_register_rt))) then
			-- stall the pipeline
			reset_idex <= '1';
			pc_write <= '0';
			ifid_write <= '0';
		else
			-- no stalling
			reset_idex <= '0';
			pc_write <= '1';
			ifid_write <= '1';
		end if;
	end process;

end Behavioral;

