-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY tb_alu IS
  END tb_alu;

  ARCHITECTURE behavior OF tb_alu IS 

  -- Component Declaration
component alu
	generic ( N : natural := 32);
	port(
		X			: in STD_LOGIC_VECTOR(N-1 downto 0);
		Y			: in STD_LOGIC_VECTOR(N-1 downto 0);
		ALU_IN	: in ALU_INPUT;
		R			: out STD_LOGIC_VECTOR(N-1 downto 0);
		FLAGS		: out ALU_FLAGS
	);
end component;

	signal X	: STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal Y	: STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal ALU_IN	: ALU_INPUT := (others => '0');
	signal R	: STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal FLAGS	: ALU_FLAGS := (others => '0');
          

  BEGIN

  -- Component Instantiation
  uut: alu generic map (N => 32) PORT MAP(
				X => X,
				Y => Y,
				ALU_IN => ALU_IN,
				COUT => COUT,
				FLAGS => FLAGS
  );


  --  Test Bench Statements
     tb : PROCESS
     BEGIN

        wait for 100 ns; -- wait until global set/reset completes
		  
		  X (3 downto 0) <= "1111";
		  Y (3 downto 0) <= "0100";
		  ALU_IN.Op0 <= '0';
		  ALU_IN.Op1 <= '0';
		  ALU_IN.Op2 <= '1';
		  ALU_IN.Op3 <= '0';

        -- Add user defined stimulus here

        wait; -- will wait forever
     END PROCESS tb;
  --  End Test Bench 

  END;
