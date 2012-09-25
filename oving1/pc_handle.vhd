----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:20:14 09/25/2012 
-- Design Name: 
-- Module Name:    pc_handle - Behavioral 
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

entity pc_handle is
    Port ( pc_current : in  STD_LOGIC_VECTOR (31 downto 0);
           offset : in  STD_LOGIC_VECTOR (31 downto 0);
           jump_inst : in  STD_LOGIC_VECTOR (25 downto 0);
			  jump: in STD_LOGIC;
           zero : in  STD_LOGIC;
           branch : in  STD_LOGIC;
           pc_next : out  STD_LOGIC_VECTOR (31 downto 0));
end pc_handle;

architecture Behavioral of pc_handle is

component shift_two is
	port ( in_addr : in  STD_LOGIC_VECTOR (31 downto 0);
          out_addr : out  STD_LOGIC_VECTOR (31 downto 0)
	);
end component;

component adder
	generic ( N : natural := 32);
	port(
		X	: in	STD_LOGIC_VECTOR(N-1 downto 0);
		Y	: in	STD_LOGIC_VECTOR(N-1 downto 0);
		CIN	: in	STD_LOGIC;
		COUT	: out	STD_LOGIC;
		R	: out	STD_LOGIC_VECTOR(N-1 downto 0)
	);
end component;

--constants
signal FOUR: STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
signal ZERO1B: STD_LOGIC := '0';

--signals
signal pc_added: STD_LOGIC_VECTOR (31 downto 0);
signal jump_addr: STD_LOGIC_VECTOR (31 downto 0);
signal branch_bytes: STD_LOGIC_VECTOR (31 downto 0);
signal branch_addr: STD_LOGIC_VECTOR (31 downto 0);
signal branch_selected: STD_LOGIC_VECTOR (31 downto 0); 

begin
jump_addr (1 downto 0) <= "00";
jump_addr (27 downto 2) <= jump_inst;
jump_addr (31 downto 28) <= pc_added (31 downto 28);

branch_selected <= branch_addr when (branch = '1' and zero = '1') else pc_added;
--pc_next <= jump_addr when jump = '1' else branch_selected;
pc_next <= branch_bytes; --testing instantiation of component
pc_add: adder
generic map (N => 32)
port map (
	X => pc_current, Y => FOUR, CIN => ZERO1B, R => pc_added
);

branch_shift : shift_two
port map (
	in_addr => offset, out_addr => branch_bytes
);

branch_add: adder
port map (
	X => pc_added, Y => branch_bytes, CIN => ZERO1B, R => branch_addr
);

end Behavioral;

