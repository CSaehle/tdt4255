----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:48:42 10/13/2012 
-- Design Name: 
-- Module Name:    reg_ifid - Behavioral 
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

entity reg_ifid is
    Port ( pc_in : in  STD_LOGIC_VECTOR (31 downto 0);
           pc_out : out  STD_LOGIC_VECTOR (31 downto 0);
           instr_in : in  STD_LOGIC_VECTOR (31 downto 0);
           instr_out : out  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end reg_ifid;

architecture Behavioral of reg_ifid is

component reg_32 is
    Port ( reg_in : in  STD_LOGIC_VECTOR (31 downto 0);
           reg_out : out  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end component reg_32;

begin

	pc : reg_32
	port map (
		reg_in => pc_in,
		reg_out => pc_out,
		clk => clk,
		reset => reset
	);
	
	instruction : reg_32
	port map (
		reg_in => instr_in,
		reg_out => instr_out,
		clk => clk,
		reset => reset
	);

end Behavioral;

