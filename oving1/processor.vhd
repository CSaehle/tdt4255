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
	
	signal current_state: state_type := STALL;
	signal next_state: state_type := EXEC;
	
	--control unit
	signal reg_dst: STD_LOGIC := ZERO1b;
	signal alu_src: STD_LOGIC := ZERO1b;
	signal mem_to_reg: STD_LOGIC := ZERO1b;
	signal reg_write: STD_LOGIC := ZERO1b;
	signal mem_read: STD_LOGIC := ZERO1b;
	signal mem_write: STD_LOGIC := ZERO1b;
	signal branch: STD_LOGIC := ZERO1b;
	signal alu_op: STD_LOGIC_VECTOR (1 downto 0) := "00";
	signal jump: STD_LOGIC := ZERO1b;
	
	--alu
	signal alu_x: STD_LOGIC_VECTOR (31 downto 0) := ZERO32b;
	signal alu_y: STD_LOGIC_VECTOR (31 downto 0) := ZERO32b;
	signal alu_in: ALU_INPUT := (others => '0');
	signal alu_out: STD_LOGIC_VECTOR (31 downto 0) := ZERO32b;
	signal flags: ALU_FLAGS := (others => '0');
	
	--pc handle
	signal pc_current: STD_LOGIC_VECTOR (31 downto 0) := ZERO32b;
	signal offset: STD_LOGIC_VECTOR (31 downto 0) := ZERO32b;
	signal pc_next: STD_LOGIC_VECTOR (31 downto 0) := ZERO32b;
	
	--register file
	signal rs: STD_LOGIC_VECTOR (31 downto 0) := ZERO32b;
	signal rt: STD_LOGIC_VECTOR (31 downto 0) := ZERO32b;
	signal rd_addr: STD_LOGIC_VECTOR (4 downto 0) := "00000";
	signal data_to_write: STD_LOGIC_VECTOR (31 downto 0) := ZERO32b;
	
	signal exec_state: STD_LOGIC := '0';
	signal testetest: STD_LOGIC := '0';

begin

	testetest <= processor_enable;

	exec_state <= '1' when (current_state = EXEC) and (processor_enable = '1') else '0';
	alu_x <= rs;
	alu_y <= rt when alu_src = '1' else offset;
	dmem_address <= alu_out;
	dmem_address_rw <= alu_out;
	rd_addr <= imem_data_in (15 downto 11) when reg_dst = '1' else imem_data_in(20 downto 16);
	data_to_write <= dmem_data_in when mem_to_reg = '1' else alu_out;
	dmem_data_out <= rt;
	dmem_write_enable <= mem_write;
	imem_address <= pc_current;
	
	
	process (CLK)
	begin
		if (rising_edge(CLK)) then
			if (processor_enable = '1') then
				current_state <= next_state;
				if (current_state = STALL) then
					next_state <= EXEC;
				else
					next_state <= STALL;
				end if;
			end if;
		end if;
	end process;

	inst_control_unit: control_unit
	port map ( 
			opcode => imem_data_in (31 downto 26),
			reg_dst => reg_dst,
			alu_src => alu_src,
			mem_to_reg => mem_to_reg,
			reg_write => reg_write,
			mem_read => mem_read,
			mem_write => mem_write,
			branch => branch,
			alu_op => alu_op,
			jump => jump
		);
		
	inst_alu: alu
	generic map (N => 32)
	port map (
			x => alu_x,
			y => alu_y,
			alu_in => alu_in,
			r => alu_out,
			flags => flags
		);

	inst_alu_control: alu_control
	port map (
			alu_op => alu_op,
			funct => imem_data_in(5 downto 0),
			alu_in => alu_in
		);
		
	inst_pc: pc
	port map (
			clk => clk,
			WE => exec_state,
			RESET => RESET,
			addr_get => pc_current,
			addr_put => pc_next
		);
		
	inst_pc_handle: pc_handle
	port map (
			pc_current => pc_current,
			offset => offset,
			jump_inst => imem_data_in (25 downto 0),
			jump => jump,
			zero => flags.zero,
			branch => branch,
			pc_next => pc_next
		);
		
	inst_register_file: register_file
	port map(
			clk => clk,
			reset => reset,
			rw => reg_write,
			rs_addr => imem_data_in (25 downto 21),
			rt_addr => imem_data_in (20 downto 16),
			rd_addr => rd_addr,
			write_data => data_to_write,
			rs => rs,
			rt => rt
		);
		
	inst_sign_extend: sign_extend
	port map(
			in_addr => imem_data_in (15 downto 0),
			out_addr => offset
		);

end Behavioral;

