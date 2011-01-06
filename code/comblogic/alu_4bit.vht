Library IEEE;
    use IEEE.STD_LOGIC_1164.all;
    use IEEE.NUMERIC_STD.all;
    use IEEE.STD_LOGIC_SIGNED.all;
	 
Entity ALU_tb IS
  
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

  init : PROCESS
  -- variable declarations                                     
  begin
        -- code that executes only once
		  
  I <= X"0";
  
  
  c(2, A);
  c(3, B);
  
  wait for 100 ns;
		  
  c(1, A);
  c(-2, B);
		  
  wait for 100 ns;
		  
  WAIT;
  
  end process init;

  always : PROCESS
  -- optional sensitivity list
  -- (        )
  -- variable declarations
  begin
        -- code executes for every event on sensitivity list
  WAIT;
  
  end process always;

end ALU_arch;
