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
			  jump: out STD_LOGIC
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
    Port ( 
			  alu_op : in  STD_LOGIC_VECTOR (1 downto 0);
           funct : in  STD_LOGIC_VECTOR (5 downto 0);
           alu_in : out  ALU_INPUT
	);
	end component ALU_CONTROL;
	
	component PC is
	    Port (
			  CLK : in  STD_LOGIC;
           WE : in  STD_LOGIC;
			  RESET : in STD_LOGIC;
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
	
	component REGISTER_FILE is
		port(
			CLK 			:	in	STD_LOGIC;				
			RESET			:	in	STD_LOGIC;				
			RW				:	in	STD_LOGIC;				
			RS_ADDR 		:	in	STD_LOGIC_VECTOR (RADDR_BUS-1 downto 0); 
			RT_ADDR 		:	in	STD_LOGIC_VECTOR (RADDR_BUS-1 downto 0); 
			RD_ADDR 		:	in	STD_LOGIC_VECTOR (RADDR_BUS-1 downto 0);
			WRITE_DATA	:	in	STD_LOGIC_VECTOR (DDATA_BUS-1 downto 0); 
			RS				:	out	STD_LOGIC_VECTOR (DDATA_BUS-1 downto 0);
			RT				:	out	STD_LOGIC_VECTOR (DDATA_BUS-1 downto 0)
		);
	end component REGISTER_FILE;
	
	component SIGN_EXTEND is
		Port ( 
			in_addr : in  STD_LOGIC_VECTOR (15 downto 0);
			out_addr : out  STD_LOGIC_VECTOR (31 downto 0));
	end component SIGN_EXTEND;
	
	component reg_ifid is
		Port ( pc_in : in  STD_LOGIC_VECTOR (31 downto 0);
			pc_out : out  STD_LOGIC_VECTOR (31 downto 0);
			instr_in : in  STD_LOGIC_VECTOR (31 downto 0);
			instr_out : out  STD_LOGIC_VECTOR (31 downto 0);
			clk : in  STD_LOGIC;
			reset : in  STD_LOGIC);
	end component reg_ifid;
	
	component reg_idex is
		Port ( reg_write_in : in  STD_LOGIC;
           reg_write_out : out  STD_LOGIC;
			  mem_to_reg_in : in STD_LOGIC;
			  mem_to_reg_out : out STD_LOGIC;
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
	end component reg_idex;
	
	component reg_exmem is
		Port ( reg_write_in : in  STD_LOGIC;
           reg_write_out : out  STD_LOGIC;
			  mem_to_reg_in : in STD_LOGIC;
			  mem_to_reg_out : out STD_LOGIC;
           branch_in : in  STD_LOGIC;
           branch_out : out  STD_LOGIC;
           mem_read_in : in  STD_LOGIC;
           mem_read_out : out  STD_LOGIC;
           mem_write_in : in  STD_LOGIC;
           mem_write_out : out  STD_LOGIC;
           pc_in : in  STD_LOGIC_VECTOR (31 downto 0);
           pc_out : out  STD_LOGIC_VECTOR (31 downto 0);
           alu_res_in : in  STD_LOGIC_VECTOR (31 downto 0);
           alu_res_out : out  STD_LOGIC_VECTOR (31 downto 0);
           read_data_2_in : in  STD_LOGIC_VECTOR (31 downto 0);
           read_data_2_out : out  STD_LOGIC_VECTOR (31 downto 0);
           rd_selected_in : in  STD_LOGIC_VECTOR (4 downto 0);
           rd_selected_out : out  STD_LOGIC_VECTOR (4 downto 0);
			  clk : in STD_LOGIC;
			  reset : in STD_LOGIC);
	end component reg_exmem;
	
	component reg_memwb is
		Port ( reg_write_in : in  STD_LOGIC;
           reg_write_out : out  STD_LOGIC;
           mem_to_reg_in : in  STD_LOGIC;
           mem_to_reg_out : out  STD_LOGIC;
           read_data_in : in  STD_LOGIC_VECTOR (31 downto 0);
           read_data_out : out  STD_LOGIC_VECTOR (31 downto 0);
           alu_res_in : in  STD_LOGIC_VECTOR (31 downto 0);
           alu_res_out : out  STD_LOGIC_VECTOR (31 downto 0);
           rd_selected_in : in  STD_LOGIC_VECTOR (4 downto 0);
           rd_selected_out : out  STD_LOGIC_VECTOR (4 downto 0);
			  clk : in STD_LOGIC;
			  reset : in STD_LOGIC);
	end component reg_memwb;
	
	signal current_state: state_type := STALL;
	signal next_state: state_type := EXEC;
	
	--control unit
	----WB
	signal id_reg_write: STD_LOGIC := ZERO1b;
	signal ex_reg_write: STD_LOGIC := ZERO1b;
	signal mem_reg_write: STD_LOGIC := ZERO1b;
	signal wb_reg_write: STD_LOGIC := ZERO1b;
	
	signal id_mem_to_reg: STD_LOGIC := ZERO1b;
	signal ex_mem_to_reg: STD_LOGIC := ZERO1b;
	signal mem_mem_to_reg: STD_LOGIC := ZERO1b;
	signal wb_mem_to_reg: STD_LOGIC := ZERO1b;
	----/WB
	----MEM
	signal id_branch: STD_LOGIC := ZERO1b;
	signal ex_branch: STD_LOGIC := ZERO1b;
	signal mem_branch: STD_LOGIC := ZERO1b;
	
	signal id_mem_read: STD_LOGIC := ZERO1b;
	signal ex_mem_read: STD_LOGIC := ZERO1b;
	signal mem_mem_read: STD_LOGIC := ZERO1b;
	
	signal id_mem_write: STD_LOGIC := ZERO1b;
	signal ex_mem_write: STD_LOGIC := ZERO1b;
	signal mem_mem_write: STD_LOGIC := ZERO1b;
	----/MEM
	----EX
	signal id_reg_dst: STD_LOGIC := ZERO1b;
	signal ex_reg_dst: STD_LOGIC := ZERO1b;
	
	signal id_alu_op: STD_LOGIC_VECTOR (1 downto 0) := "00";
	signal ex_alu_op: STD_LOGIC_VECTOR (1 downto 0) := "00";
	
	signal id_alu_src: STD_LOGIC := ZERO1b;
	signal ex_alu_src: STD_LOGIC := ZERO1b;
	----/EX
	--/control unit
	
	--alu
	signal alu_y: STD_LOGIC_VECTOR (31 downto 0) := ZERO32b;
	signal alu_in: ALU_INPUT := (others => '0');
	
	signal ex_alu_out: STD_LOGIC_VECTOR (31 downto 0) := ZERO32b;
	signal mem_alu_out: STD_LOGIC_VECTOR (31 downto 0) := ZERO32b;
	signal wb_alu_out: STD_LOGIC_VECTOR (31 downto 0) := ZERO32b;
	
	signal flags: ALU_FLAGS := (others => '0');
	--/alu
	
	--pc handle
	signal pc_current: STD_LOGIC_VECTOR (31 downto 0) := ZERO32b;
	
	signal id_offset: STD_LOGIC_VECTOR (31 downto 0) := ZERO32b;
	signal ex_offset: STD_LOGIC_VECTOR (31 downto 0) := ZERO32b;
	
	signal if_pc_next: STD_LOGIC_VECTOR (31 downto 0) := ZERO32b;
	signal id_pc_next: STD_LOGIC_VECTOR (31 downto 0) := ZERO32b;
	signal ex_pc_next: STD_LOGIC_VECTOR (31 downto 0) := ZERO32b;
	--/pc handle
	
	--register file
	signal reg_write_exec : STD_LOGIC := ZERO1b;
	
	signal id_read_data_1: STD_LOGIC_VECTOR (31 downto 0) := ZERO32b;
	signal ex_read_data_1: STD_LOGIC_VECTOR (31 downto 0) := ZERO32b;
	
	signal id_read_data_2: STD_LOGIC_VECTOR (31 downto 0) := ZERO32b;
	signal ex_read_data_2: STD_LOGIC_VECTOR (31 downto 0) := ZERO32b;
	
	signal ex_rd_addr: STD_LOGIC_VECTOR (4 downto 0) := "00000";
	signal mem_rd_addr: STD_LOGIC_VECTOR (4 downto 0) := "00000";
	signal wb_rd_addr: STD_LOGIC_VECTOR (4 downto 0) := "00000";
	
	
	signal data_to_write: STD_LOGIC_VECTOR (31 downto 0) := ZERO32b;
	--/register file
	
	signal jump: STD_LOGIC := ZERO1b;
	
	signal pc_write_enable: STD_LOGIC := '0';
	
	signal ex_rt: STD_LOGIC_VECTOR (4 downto 0) := ZERO32b;
	signal ex_rd: STD_LOGIC_VECTOR (4 downto 0) := ZERO32b;
	
	signal wb_dmem_data_in : STD_LOGIC_VECTOR (31 downto 0) := ZERO32b;
	

begin
	-- This one updates the PC when the next state is a FETCH to make sure the instruction is ready for the next EXEC
	pc_write_enable <= '1' when (next_state = FETCH) and (processor_enable = '1') else '0';
	
	--
	reg_write_exec <= reg_write when (current_state /= FETCH) else '0';
	
	-- This one multiplexes - if ALU_SRC is set, the ALU takes the value of the second input register. If not, it takes the sign-extended offset of the instruction - for branches
	alu_y <= ex_offset when ex_alu_src = '1' else ex_rt;
	
	-- The ALU gets us the addrses for load/stores. It could be either, but this is not determined here so both are set as the result.
	dmem_address <= mem_alu_out;
	dmem_address_wr <= mem_alu_out;
	
	-- This one decides whether to read or write from memory.
	dmem_write_enable <= mem_write;
	
	-- This one determines the read address - if REG_DST is set, it's three-operand, if not, only two.
	ex_rd_addr <= ex_rd when ex_reg_dst = '1' else ex_rt;
	-- Choose whether to use ALU or memory to source for writing to register.
	data_to_write <= wb_dmem_data_in when wb_mem_to_reg = '1' else wb_alu_out;
	
	-- Using address from PC to address instruction memory.
	imem_address <= pc_current;
	
	
	-- Here's our state machine:
	-- This first part just updates the state on rising clock edge.
	process(CLK, processor_enable, next_state)
	begin
		if (rising_edge(CLK)) and (processor_enable = '1') then
			current_state <= next_state;
		end if;
	end process;
	
	-- This one determines which state is the next one, depending on opcodes, current state. If the processor is not enabled, it prepares to fetch.
	process(processor_enable, current_state, imem_data_in)
	begin
		if (processor_enable = '1') then 
			if (current_state = FETCH) then
				next_state <= EXEC;
			elsif (current_state = EXEC) and (imem_data_in (31 downto 26) = "100011") then
				next_state <= STALL;
			else
				next_state <= FETCH;
			end if;
		else
			next_state <= FETCH;
		end if;
	end process;

	-- PIPELINE REGISTERS
	inst_reg_ifid : reg_ifid
	Port map(
			pc_in => if_pc_next,
			pc_out => id_pc_next,
			instr_in => imem_data_in,
			instr_out => id_instruction,
			clk => clk,
			reset => reset
		);
	
	inst_reg_idex : reg_idex
	Port map(
			reg_write_in => id_reg_write,
			reg_write_out => ex_reg_write,
			mem_to_reg_in => id_mem_to_reg,
			mem_to_reg_out => ex_mem_to_reg,
			branch_in => id_branch,
			branch_out => ex_branch,
			mem_read_in => id_mem_read,
			mem_read_out => ex_mem_read,
			mem_write_in => id_mem_write,
			mem_write_out => ex_mem_write,
			reg_dst_in => id_reg_dst,
			reg_dst_out => ex_reg_dst,
			alu_op_in => id_alu_op,
			alu_op_out => ex_alu_op,
			alu_src_in => id_alu_src,
			alu_src_out => ex_alu_src,
			pc_in => id_pc_next,
			pc_out => ex_pc_next,
			read_data_1_in => id_read_data_1,
			read_data_1_out => ex_read_data_1,
			read_data_2_in => id_read_data_2,
			read_data_2_out => ex_read_data_2,
			immediate_in => id_offset,
			immediate_out => ex_offset,
			rt_in => id_instruction (20 downto 16),
			rt_out => ex_rt,
			rd_in => id_instruction (15 downto 11),
			rd_out => ex_rd,
			clk => clk,
			reset => reset
		);

	inst_reg_exmem : reg_exmem
	Port map (
			reg_write_in => ex_reg_write,
			reg_write_out => mem_reg_write,
			mem_to_reg_in => ex_mem_to_reg,
			mem_to_reg_out => mem_mem_to_reg,
			branch_in => ex_branch,
			branch_out => mem_branch,
			mem_read_in => ex_mem_read,
			mem_read_out => mem_mem_read,
			mem_write_in => ex_mem_write,
			mem_write_out => mem_mem_write,
			pc_in => ,
			pc_out => ,
			alu_res_in => ex_alu_out,
			alu_res_out => mem_alu_out,
			read_data_2_in => ex_read_data_2,
			read_data_2_out => dmem_data_out,
			rd_selected_in => ex_rd_addr,
			rd_selected_out => mem_rd_addr,
			clk => clk,
			reset => reset
		);
	
	inst_reg_memwb : reg_memwb
		Port map(
			reg_write_in => mem_reg_write,
			reg_write_out => wb_reg_write,
			mem_to_reg_in => mem_mem_to_reg,
			mem_to_reg_out => wb_mem_to_reg,
			read_data_in => dmem_data_in,
			read_data_out => wb_dmem_data_in,
			alu_res_in => mem_alu_out,
			alu_res_out => wb_alu_out,
			rd_selected_in => mem_rd_addr,
			rd_selected_out => wb_rd_addr,
			clk => clk,
			reset => reset
		);
	-- /pipeline registers


	inst_control_unit: control_unit
	port map ( 
			opcode => id_instruction (31 downto 26),
			reg_dst => id_reg_dst,
			alu_src => id_alu_src,
			mem_to_reg => id_mem_to_reg,
			reg_write => id_reg_write,
			mem_read => id_mem_read,
			mem_write => id_mem_write,
			branch => id_branch,
			alu_op => id_alu_op,
			jump => jump
		);
		
	inst_alu: alu
	generic map (N => 32)
	port map (
			x => ex_read_data_1,
			y => alu_y,
			alu_in => alu_in,
			r => ex_alu_out,
			flags => flags
		);

	inst_alu_control: alu_control
	port map (
			alu_op => ex_alu_op,
			funct => ex_offset(5 downto 0),
			alu_in => alu_in
		);
		
	inst_pc: pc
	port map (
			clk => clk,
			WE => pc_write_enable,
			RESET => RESET,
			addr_get => pc_current,
			addr_put => if_pc_next
		);
		
	inst_pc_handle: pc_handle
	port map (
			pc_current => pc_current,
			offset => offset,
			jump_inst => imem_data_in (25 downto 0),
			jump => jump,
			zero => flags.zero,
			branch => branch,
			pc_next => if_pc_next
		);
		
	inst_register_file: register_file
	port map(
			clk => clk,
			reset => reset,
			rw => reg_write_exec,
			rs_addr => imem_data_in (25 downto 21),
			rt_addr => imem_data_in (20 downto 16),
			rd_addr => wb_rd_addr,
			write_data => data_to_write,
			rs => id_rs,
			rt => id_rt
		);
		
	inst_sign_extend: sign_extend
	port map(
			in_addr => imem_data_in (15 downto 0),
			out_addr => offset
		);

end Behavioral;

