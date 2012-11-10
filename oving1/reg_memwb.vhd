----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:58:39 10/16/2012 
-- Design Name: 
-- Module Name:    reg_memwb - Behavioral 
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

entity reg_memwb is
    Port ( reg_write_in : in  STD_LOGIC;
           reg_write_out : out  STD_LOGIC;
           mem_to_reg_in : in  STD_LOGIC;
           mem_to_reg_out : out  STD_LOGIC;
           alu_res_in : in  STD_LOGIC_VECTOR (31 downto 0);
           alu_res_out : out  STD_LOGIC_VECTOR (31 downto 0);
           rd_selected_in : in  STD_LOGIC_VECTOR (4 downto 0);
           rd_selected_out : out  STD_LOGIC_VECTOR (4 downto 0);
			  clk : in STD_LOGIC;
			  reset : in STD_LOGIC);
end reg_memwb;

architecture Behavioral of reg_memwb is

begin
process (reg_write_in, mem_to_reg_in, alu_res_in, rd_selected_in, clk, reset)
	begin
		if (reset = '1') then
			reg_write_out <= '0';
			mem_to_reg_out <= '0';
			alu_res_out <= (others => '0');
			rd_selected_out <= (others => '0');
		elsif (rising_edge(clk)) then
			reg_write_out <= reg_write_in;
			mem_to_reg_out <= mem_to_reg_in;
			alu_res_out <= alu_res_in;
			rd_selected_out <= rd_selected_in;
		end if;
end process;

end Behavioral;

