----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:15:36 09/21/2012 
-- Design Name: 
-- Module Name:    processor - Behavioral 
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

entity processor is
	Port ( 
		clk : in STD_LOGIC;
		reset					: in STD_LOGIC;
		processor_enable	: in  STD_LOGIC;
		imem_address 		: out  STD_LOGIC_VECTOR (31 downto 0);
		imem_data_in 		: in  STD_LOGIC_VECTOR (31 downto 0);
		dmem_data_in 		: in  STD_LOGIC_VECTOR (31 downto 0);
		dmem_address 		: out  STD_LOGIC_VECTOR (31 downto 0);
		dmem_address_wr	: out  STD_LOGIC_VECTOR (31 downto 0);
		dmem_data_out		: out  STD_LOGIC_VECTOR (31 downto 0);
		dmem_write_enable	: out  STD_LOGIC
	);
end processor;

architecture Behavioral of processor is

	component CONTROL_UNIT is
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
			  jump: out STD_LOGIC;
			  exec_state: out STD_LOGIC
	);
	end component CONTROL_UNIT;
	
	component ALU is
	generic ( N : natural := 32);
		port(
		X			: in STD_LOGIC_VECTOR(N-1 downto 0);
		Y			: in STD_LOGIC_VECTOR(N-1 downto 0);
		ALU_IN	: in ALU_INPUT;
		R			: out STD_LOGIC_VECTOR(N-1 downto 0);
		FLAGS		: out ALU_FLAGS
	);
	end component ALU;

	component ALU_CONTROL is
    Port ( alu_op : in  STD_LOGIC_VECTOR (1 downto 0);
           funct : in  STD_LOGIC_VECTOR (5 downto 0);
           alu_in : out  ALU_INPUT
	);
	end component ALU_CONTROL;
	
	component PC is
	    Port ( CLK : in  STD_LOGIC;
           W : in  STD_LOGIC;
           addr_put : in  STD_LOGIC_VECTOR (31 downto 0);
           addr_get : out  STD_LOGIC_VECTOR (31 downto 0));
	end component PC;
	
	component PC_HANDLE is
	    Port ( pc_current : in  STD_LOGIC_VECTOR (31 downto 0);
           offset : in  STD_LOGIC_VECTOR (31 downto 0);
           jump_inst : in  STD_LOGIC_VECTOR (25 downto 0);
			  jump: in STD_LOGIC;
           zero : in  STD_LOGIC;
           branch : in  STD_LOGIC;
           pc_next : out  STD_LOGIC_VECTOR (31 downto 0));
	end component PC_HANDLE;
	
	component SIGN_EXTEND is
	    Port ( in_addr : in  STD_LOGIC_VECTOR (15 downto 0);
           out_addr : out  STD_LOGIC_VECTOR (31 downto 0));
	end component SIGN_EXTEND;
	
	signal alu_op_line: STD_LOGIC_VECTOR (31 downto 0);
	signal pc_current_line: STD_LOGIC_VECTOR (31 downto 0);
	signal offset_line: STD_LOGIC_VECTOR (31 downto 0);
	signal alu_in_line: ALU_INPUT;

begin

	imem_address <= pc_current_line;

	inst_control_unit: control_unit
	port map ( 
			alu_op => alu_op_line,
			opcode => imem_data_in (31 downto 26)
		);
		
	inst_alu: alu
	generic map (N => 32)
	port map (
			alu_in => alu_in_line
		);

	inst_alu_control: alu_control
	port map (
			alu_op => alu_op_line
		);
		
	inst_pc: pc
	port map (
			addr_get => pc_current_line
		);
		
	inst_pc_handle: pc_handle
	port map (
			pc_current => pc_current_line
		);
		
	inst_sign_extend: sign_extend
	port map(
			out_addr => offset_line
		);

end Behavioral;

