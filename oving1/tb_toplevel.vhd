--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:54:20 05/03/2012
-- Design Name:   
-- Module Name:   E:/My-documents/Dropbox/tdt4255_final/single_cycle/tb_toplevel.vhd
-- Project Name:  single_cycle
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: toplevel
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_toplevel IS
END tb_toplevel;
 
ARCHITECTURE behavior OF tb_toplevel IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT toplevel
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         command : IN  std_logic_vector(0 to 31);
         bus_address_in : IN  std_logic_vector(0 to 31);
         bus_data_in : IN  std_logic_vector(0 to 31);
         status : OUT  std_logic_vector(0 to 31);
         bus_data_out : OUT  std_logic_vector(0 to 31)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal command : std_logic_vector(0 to 31) := (others => '0');
   signal bus_address_in : std_logic_vector(0 to 31) := (others => '0');
   signal bus_data_in : std_logic_vector(0 to 31) := (others => '0');

 	--Outputs
   signal status : std_logic_vector(0 to 31);
   signal bus_data_out : std_logic_vector(0 to 31);

   -- Clock period definitions
   constant clk_period : time := 40 ns;
	
	constant zero : std_logic_vector(0 to 31) := "00000000000000000000000000000000";
	
	constant addr1 : std_logic_vector(0 to 31)  := "00000000000000000000000000000001";
	constant addr2 : std_logic_vector(0 to 31)  := "00000000000000000000000000000010";
   
	constant data1 : std_logic_vector(0 to 31):= "00000000000000000000000000001010";
	constant data2 : std_logic_vector(0 to 31):= "00000000000000000000000000000010";
      
   constant CMD_IDLE	: std_logic_vector(0 to 31) := "00000000000000000000000000000000";
	constant CMD_WI	: std_logic_vector(0 to 31) := "00000000000000000000000000000001";
	constant CMD_RD	: std_logic_vector(0 to 31) := "00000000000000000000000000000010";
	constant CMD_WD	: std_logic_vector(0 to 31) := "00000000000000000000000000000011";
	constant CMD_RUN	: std_logic_vector(0 to 31) := "00000000000000000000000000000100";
	
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: toplevel PORT MAP (
          clk => clk,
          reset => reset,
          command => command,
          bus_address_in => bus_address_in,
          bus_data_in => bus_data_in,
          status => status,
          bus_data_out => bus_data_out
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
	
   begin		
	
      -- hold reset state for 100 ns.
      wait for 20 ns;	

      -- insert stimulus here 
		
		-- INSTR: WRITE DATA TO DMEM
		
		command <= CMD_WD;					
      bus_address_in <= addr1;
      bus_data_in <= data1;
      wait for clk_period*3;
      
      command <= CMD_IDLE;					
      bus_address_in <= zero;
      bus_data_in <= zero;
      wait for clk_period*3;
		
		command <= CMD_WD;					
      bus_address_in <= addr2;
      bus_data_in <= data2;
      wait for clk_period*3;
      
      command <= CMD_IDLE;					
      bus_address_in <= zero;
      bus_data_in <= zero;
      wait for clk_period*3;
----- DELETE FROM HERE

      command <= CMD_WI;
      bus_address_in <= x"00000001";
      bus_data_in <= x"3C010011";
      wait for clk_period*3;

      command <= CMD_IDLE;
      bus_address_in <= zero;
      bus_data_in <= zero;
      wait for clk_period*3;

      command <= CMD_WI;
      bus_address_in <= x"00000002";
      bus_data_in <= x"3C0B0001";
      wait for clk_period*3;

      command <= CMD_IDLE;
      bus_address_in <= zero;
      bus_data_in <= zero;
      wait for clk_period*3;

      command <= CMD_WI;
      bus_address_in <= x"00000003";
      bus_data_in <= x"3C020000";
      wait for clk_period*3;

      command <= CMD_IDLE;
      bus_address_in <= zero;
      bus_data_in <= zero;
      wait for clk_period*3;

      command <= CMD_WI;
      bus_address_in <= x"00000004";
      bus_data_in <= x"3C030001";
      wait for clk_period*3;

      command <= CMD_IDLE;
      bus_address_in <= zero;
      bus_data_in <= zero;
      wait for clk_period*3;

      command <= CMD_WI;
      bus_address_in <= x"00000005";
      bus_data_in <= x"00000000";
      wait for clk_period*3;

      command <= CMD_IDLE;
      bus_address_in <= zero;
      bus_data_in <= zero;
      wait for clk_period*3;

      command <= CMD_WI;
      bus_address_in <= x"00000006";
      bus_data_in <= x"002B0822";
      wait for clk_period*3;

      command <= CMD_IDLE;
      bus_address_in <= zero;
      bus_data_in <= zero;
      wait for clk_period*3;

      command <= CMD_WI;
      bus_address_in <= x"00000007";
      bus_data_in <= x"00000000";
      wait for clk_period*3;

      command <= CMD_IDLE;
      bus_address_in <= zero;
      bus_data_in <= zero;
      wait for clk_period*3;

      command <= CMD_WI;
      bus_address_in <= x"00000008";
      bus_data_in <= x"00000000";
      wait for clk_period*3;

      command <= CMD_IDLE;
      bus_address_in <= zero;
      bus_data_in <= zero;
      wait for clk_period*3;

      command <= CMD_WI;
      bus_address_in <= x"00000009";
      bus_data_in <= x"00000000";
      wait for clk_period*3;

      command <= CMD_IDLE;
      bus_address_in <= zero;
      bus_data_in <= zero;
      wait for clk_period*3;

      command <= CMD_WI;
      bus_address_in <= x"0000000A";
      bus_data_in <= x"1020000F";
      wait for clk_period*3;

      command <= CMD_IDLE;
      bus_address_in <= zero;
      bus_data_in <= zero;
      wait for clk_period*3;

      command <= CMD_WI;
      bus_address_in <= x"0000000B";
      bus_data_in <= x"00000000";
      wait for clk_period*3;

      command <= CMD_IDLE;
      bus_address_in <= zero;
      bus_data_in <= zero;
      wait for clk_period*3;

      command <= CMD_WI;
      bus_address_in <= x"0000000C";
      bus_data_in <= x"00000000";
      wait for clk_period*3;

      command <= CMD_IDLE;
      bus_address_in <= zero;
      bus_data_in <= zero;
      wait for clk_period*3;

      command <= CMD_WI;
      bus_address_in <= x"0000000D";
      bus_data_in <= x"00000000";
      wait for clk_period*3;

      command <= CMD_IDLE;
      bus_address_in <= zero;
      bus_data_in <= zero;
      wait for clk_period*3;

      command <= CMD_WI;
      bus_address_in <= x"0000000E";
      bus_data_in <= x"00000000";
      wait for clk_period*3;

      command <= CMD_IDLE;
      bus_address_in <= zero;
      bus_data_in <= zero;
      wait for clk_period*3;

      command <= CMD_WI;
      bus_address_in <= x"0000000F";
      bus_data_in <= x"00432020";
      wait for clk_period*3;

      command <= CMD_IDLE;
      bus_address_in <= zero;
      bus_data_in <= zero;
      wait for clk_period*3;

      command <= CMD_WI;
      bus_address_in <= x"00000010";
      bus_data_in <= x"00601020";
      wait for clk_period*3;

      command <= CMD_IDLE;
      bus_address_in <= zero;
      bus_data_in <= zero;
      wait for clk_period*3;

      command <= CMD_WI;
      bus_address_in <= x"00000011";
      bus_data_in <= x"00000000";
      wait for clk_period*3;

      command <= CMD_IDLE;
      bus_address_in <= zero;
      bus_data_in <= zero;
      wait for clk_period*3;

      command <= CMD_WI;
      bus_address_in <= x"00000012";
      bus_data_in <= x"00000000";
      wait for clk_period*3;

      command <= CMD_IDLE;
      bus_address_in <= zero;
      bus_data_in <= zero;
      wait for clk_period*3;

      command <= CMD_WI;
      bus_address_in <= x"00000013";
      bus_data_in <= x"00000000";
      wait for clk_period*3;

      command <= CMD_IDLE;
      bus_address_in <= zero;
      bus_data_in <= zero;
      wait for clk_period*3;

      command <= CMD_WI;
      bus_address_in <= x"00000014";
      bus_data_in <= x"00801820";
      wait for clk_period*3;

      command <= CMD_IDLE;
      bus_address_in <= zero;
      bus_data_in <= zero;
      wait for clk_period*3;

      command <= CMD_WI;
      bus_address_in <= x"00000015";
      bus_data_in <= x"002B0A62";
      wait for clk_period*3;

      command <= CMD_IDLE;
      bus_address_in <= zero;
      bus_data_in <= zero;
      wait for clk_period*3;

      command <= CMD_WI;
      bus_address_in <= x"00000016";
      bus_data_in <= x"00000000";
      wait for clk_period*3;

      command <= CMD_IDLE;
      bus_address_in <= zero;
      bus_data_in <= zero;
      wait for clk_period*3;

      command <= CMD_WI;
      bus_address_in <= x"00000017";
      bus_data_in <= x"00000000";
      wait for clk_period*3;

      command <= CMD_IDLE;
      bus_address_in <= zero;
      bus_data_in <= zero;
      wait for clk_period*3;

      command <= CMD_WI;
      bus_address_in <= x"00000018";
      bus_data_in <= x"00000000";
      wait for clk_period*3;

      command <= CMD_IDLE;
      bus_address_in <= zero;
      bus_data_in <= zero;
      wait for clk_period*3;

      command <= CMD_WI;
      bus_address_in <= x"00000019";
      bus_data_in <= x"0800000A";
      wait for clk_period*3;

      command <= CMD_IDLE;
      bus_address_in <= zero;
      bus_data_in <= zero;
      wait for clk_period*3;

      command <= CMD_WI;
      bus_address_in <= x"0000001A";
      bus_data_in <= x"00000000";
      wait for clk_period*3;

      command <= CMD_IDLE;
      bus_address_in <= zero;
      bus_data_in <= zero;
      wait for clk_period*3;

      command <= CMD_WI;
      bus_address_in <= x"0000001B";
      bus_data_in <= x"00000000";
      wait for clk_period*3;

      command <= CMD_IDLE;
      bus_address_in <= zero;
      bus_data_in <= zero;
      wait for clk_period*3;

      command <= CMD_WI;
      bus_address_in <= x"0000001C";
      bus_data_in <= x"00000000";
      wait for clk_period*3;

      command <= CMD_IDLE;
      bus_address_in <= zero;
      bus_data_in <= zero;
      wait for clk_period*3;

      command <= CMD_WI;
      bus_address_in <= x"0000001D";
      bus_data_in <= x"AC040001";
      wait for clk_period*3;

      command <= CMD_IDLE;
      bus_address_in <= zero;
      bus_data_in <= zero;
      wait for clk_period*3;

      command <= CMD_WI;
      bus_address_in <= x"0000001E";
      bus_data_in <= x"00000000";
      wait for clk_period*3;

      command <= CMD_IDLE;
      bus_address_in <= zero;
      bus_data_in <= zero;
      wait for clk_period*3;

      command <= CMD_WI;
      bus_address_in <= x"0000001F";
      bus_data_in <= x"00000000";
      wait for clk_period*3;

      command <= CMD_IDLE;
      bus_address_in <= zero;
      bus_data_in <= zero;
      wait for clk_period*3;

      command <= CMD_WI;
      bus_address_in <= x"00000020";
      bus_data_in <= x"00000000";
      wait for clk_period*3;

      command <= CMD_IDLE;
      bus_address_in <= zero;
      bus_data_in <= zero;
      wait for clk_period*3;

      command <= CMD_WI;
      bus_address_in <= x"00000021";
      bus_data_in <= x"00000000";
      wait for clk_period*3;

      command <= CMD_IDLE;
      bus_address_in <= zero;
      bus_data_in <= zero;
      wait for clk_period*3;

      command <= CMD_WI;
      bus_address_in <= x"00000022";
      bus_data_in <= x"8C070001";
      wait for clk_period*3;

      command <= CMD_IDLE;
      bus_address_in <= zero;
      bus_data_in <= zero;
      wait for clk_period*3;

      command <= CMD_WI;
      bus_address_in <= x"00000023";
      bus_data_in <= x"00000000";
      wait for clk_period*3;

      command <= CMD_IDLE;
      bus_address_in <= zero;
      bus_data_in <= zero;
      wait for clk_period*3;

      command <= CMD_WI;
      bus_address_in <= x"00000024";
      bus_data_in <= x"00000000";
      wait for clk_period*3;

      command <= CMD_IDLE;
      bus_address_in <= zero;
      bus_data_in <= zero;
      wait for clk_period*3;

      command <= CMD_WI;
      bus_address_in <= x"00000025";
      bus_data_in <= x"00000000";
      wait for clk_period*3;

      command <= CMD_IDLE;
      bus_address_in <= zero;
      bus_data_in <= zero;
      wait for clk_period*3;

      command <= CMD_WI;
      bus_address_in <= x"00000026";
      bus_data_in <= x"00000000";
      wait for clk_period*3;

      command <= CMD_IDLE;
      bus_address_in <= zero;
      bus_data_in <= zero;
      wait for clk_period*3;

      command <= CMD_WI;
      bus_address_in <= x"00000027";
      bus_data_in <= x"00000000";
      wait for clk_period*3;

      command <= CMD_IDLE;
      bus_address_in <= zero;
      bus_data_in <= zero;
      wait for clk_period*3;

      command <= CMD_WI;
      bus_address_in <= x"00000028";
      bus_data_in <= x"00000000";
      wait for clk_period*3;

      command <= CMD_IDLE;
      bus_address_in <= zero;
      bus_data_in <= zero;
      wait for clk_period*3;

      command <= CMD_WI;
      bus_address_in <= x"00000029";
      bus_data_in <= x"00000000";
      wait for clk_period*3;

      command <= CMD_IDLE;
      bus_address_in <= zero;
      bus_data_in <= zero;
      wait for clk_period*3;

      command <= CMD_WI;
      bus_address_in <= x"0000002A";
      bus_data_in <= x"08000023";
      wait for clk_period*3;

      command <= CMD_IDLE;
      bus_address_in <= zero;
      bus_data_in <= zero;
      wait for clk_period*3;

----- DELETE TO HERE
      command <= CMD_IDLE;
      bus_address_in <= zero;
      bus_data_in <= zero;
      wait for clk_period*3;
      
      command <= CMD_IDLE;					
      bus_address_in <= zero;
      bus_data_in <= zero;
      wait for clk_period*3;
		
		command <= CMD_RUN;					
      bus_address_in <= zero;
      bus_data_in <= zero;
		wait for clk_period*100;
		
      wait;
   end process;

END;
