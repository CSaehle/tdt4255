-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY tb_adder IS
  END tb_adder;

  ARCHITECTURE behavior OF tb_adder IS 

  -- Component Declaration
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

	signal X	: STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal Y	: STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal CIN	: STD_LOGIC := '0';
	signal COUT	: STD_LOGIC;
	signal R	: STD_LOGIC_VECTOR(31 downto 0);
          

  BEGIN

  -- Component Instantiation
  uut: adder PORT MAP(X, Y, CIN, COUT, R);


  --  Test Bench Statements
     tb : PROCESS
     BEGIN

        wait for 100 ns; -- wait until global set/reset completes
		  
		  X (3 downto 0) <= "1111";
		  Y (3 downto 0) <= "0100";

        -- Add user defined stimulus here

        wait; -- will wait forever
     END PROCESS tb;
  --  End Test Bench 

  END;
