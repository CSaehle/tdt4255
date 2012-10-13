----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:55:32 10/13/2012 
-- Design Name: 
-- Module Name:    idex - Behavioral 
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

entity idex is
    Port ( reg_write_in : in  STD_LOGIC;
           reg_write_out : out  STD_LOGIC;
           branch_in : in  STD_LOGIC;
           branch_out : out  STD_LOGIC;
           mem_read_in : in  STD_LOGIC;
           mem_read_out : out  STD_LOGIC;
           mem_write_in : in  STD_LOGIC;
           mem_write_out : out  STD_LOGIC;
           reg_dst_in : in  STD_LOGIC;
           reg_dst_out : out  STD_LOGIC;
           alu_op_in : in  STD_LOGIC_VECTOR (1 downto 0);
           alu_op_out : out  STD_LOGIC_VECTOR (1 downto 0);
           alu_src_in : in  STD_LOGIC;
           alu_src_out : out  STD_LOGIC;
           pc_in : in  STD_LOGIC_VECTOR (31 downto 0);
           pc_out : out  STD_LOGIC_VECTOR (31 downto 0);
           read_data_1_in : in  STD_LOGIC_VECTOR (31 downto 0);
           read_data_1_out : out  STD_LOGIC_VECTOR (31 downto 0);
           read_data_2_in : in  STD_LOGIC_VECTOR (31 downto 0);
           read_data_2_out : out  STD_LOGIC_VECTOR (31 downto 0);
           immediate_in : in  STD_LOGIC_VECTOR (31 downto 0);
           immediate_out : out  STD_LOGIC_VECTOR (31 downto 0);
           rt_in : in  STD_LOGIC_VECTOR (4 downto 0);
           rt_out : out  STD_LOGIC_VECTOR (4 downto 0);
           rd_in : in  STD_LOGIC_VECTOR (4 downto 0);
           rd_out : out  STD_LOGIC_VECTOR (4 downto 0);
			  clk : in STD_LOGIC;
			  reset : in STD_LOGIC);
			  
end idex;

architecture Behavioral of idex is

begin

process (reg_write_in, branch_in, mem_read_in, mem_write_in, reg_dst_in, alu_op_in, alu_src_in,
				pc_in, read_data_1_in, read_data_2_in, immediate_in, rt_in, rd_in, clk, reset)
	begin
		if (reset = '1') then
			reg_write_out <= (others => '0');
			branch_out <= (others => '0');
			mem_read_out <= (others => '0');
			mem_write_out <= (others => '0');
			reg_dst_out <= (others => '0');
			alu_op_out <= (others => '0');
			alu_src_out <= (others => '0');
			pc_out <= (others => '0');
			read_data_1_out <= (others => '0');
			read_data_2_out <= (others => '0');
			immediate_out <= (others => '0');
			rt_out <= (others => '0');
			rd_out <= (others => '0');
		elsif (rising_edge(clk)) then
			reg_write_out <= reg_write_in;
			branch_out <= branch_in;
			mem_read_out <= mem_read_in;
			mem_write_out <= mem_write_in;
			reg_dst_out <= reg_dst_in;
			alu_op_out <= alu_op_in;
			alu_src_out <= alu_src_in;
			pc_out <= pc_in;
			read_data_1_out <= read_data_1_in;
			read_data_2_out <= read_data_2_in;
			immediate_out <= immediate_in;
			rt_out <= rt_in;
			rd_out <= rd_in;
		end if;
end process;

end Behavioral;

