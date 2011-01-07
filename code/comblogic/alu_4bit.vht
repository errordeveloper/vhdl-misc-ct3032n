Library IEEE;
    use IEEE.STD_LOGIC_1164.all;
    use IEEE.NUMERIC_STD.all;
    use IEEE.STD_LOGIC_SIGNED.all;
	 
Entity ALU_tb IS
  
  GENERIC ( -- use this for setting test type
  test_arith: boolean := true;
  test_logic: boolean := false
  );

  procedure c ( constant i: integer;
                signal s: out std_Logic_Vector(3 DOWNTO 0) ) is
  begin

          s <= STD_LOGIC_VECTOR( TO_SIGNED( i, 4 ) ) ;

end procedure;


end ALU_tb;

Architecture ALU_test OF ALU_tb IS

  signal A : std_Logic_Vector(3 DOWNTO 0);
  signal B : std_Logic_Vector(3 DOWNTO 0);
  signal I : std_Logic_Vector(3 DOWNTO 0);
  signal X : std_Logic_Vector(3 DOWNTO 0);

 Component ALU
  PORT (A : IN std_Logic_Vector(3 DOWNTO 0);
	B : IN std_Logic_Vector(3 DOWNTO 0);
	I : IN std_Logic_Vector(3 DOWNTO 0);
	X : OUT std_Logic_Vector(3 DOWNTO 0));
 end component;

begin

i1 : ALU Port
map (A => A,
     B => B,
     I => I,
     X => X);

arith: if test_arith generate
init : PROCESS
  -- variable declarations                                     
  begin
        -- code that executes only once
		  
  ---- basic addition tests
  I <= X"0";
  
  
  c(0, A);
  c(3, B);
  
  wait for 30 ns;

  c(3, A);
  c(0, B);

  wait for 30 ns;

  ---- subtracting from 0
  I <= X"1";


  c(0, A);
  c(4, B);

  wait for 30 ns;

  c(-5, B);

  wait for 30 ns;

  c(-2, A);

  wait for 30 ns;

  ---- adding negative numbers
  I <= X"0";

  c(-1, A);
  c(-1, B);

  wait for 30 ns;

  c(-4, B);

  wait for 30 ns;

  c(-2, A);

  wait for 30 ns;

  c(-3, A); -- near overflow

  wait for 30 ns;

  ---- negative overflow tests

  c(-5, B);

  wait for 30 ns;

  I <= X"1";

  c(1, A);
  c(6, B);

  wait for 30 ns;

  c(-7, A);
  c(1, B);

  wait for 30 ns;

  c(1, A);
  c(8, B);

  wait for 30 ns;

  c(-8, A);
  c(1, B);

  wait for 30 ns;

  c(-9, A);
  
  wait for 30 ns;

  c(2, A);
  c(10, B);

  wait for 30 ns;

  I <= X"0";

  c(-7, A);
  c(-6, B);

  wait for 30 ns;

  c(-7, A);
  c(-7, B);
		  
  wait for 30 ns;

  ---- positive overflow tests

  I <= X"0";

  c(5, A);
  c(5, B);

  wait for 30 ns;

		  
  WAIT;
  
  end process init;
  end generate;

logic: if test_logic generate
init : PROCESS
  -- variable declarations                                     
  begin
        -- code that executes only once
		

  end process init;
  end generate;


  always : PROCESS
  -- optional sensitivity list
  -- (        )
  -- variable declarations
  begin
        -- code executes for every event on sensitivity list
  WAIT;
  
  end process always;

end ALU_test;
