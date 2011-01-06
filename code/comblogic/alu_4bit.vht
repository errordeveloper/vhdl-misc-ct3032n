LIBRARY ieee;
    USE ieee.std_logic_1164.all;
    USE ieee.numeric_std.all;
    USE ieee.std_logic_signed.all;
	 
ENTITY ALU_vhd_tst IS
  
  procedure c(
  
    constant i: integer;
    signal s: out std_Logic_Vector(3 DOWNTO 0) ) is
  
  begin
          
          s <= STD_LOGIC_VECTOR( TO_SIGNED( i, 4 ) ) ;
          
end procedure;


END ALU_vhd_tst;

ARCHITECTURE ALU_arch OF ALU_vhd_tst IS

  SIGNAL A : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL B : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL I : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL X : STD_LOGIC_VECTOR(3 DOWNTO 0);

COMPONENT ALU
  PORT (
	A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	I : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	X : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

BEGIN
	i1 : ALU
PORT MAP (
	A => A,
	B => B,
	I => I,
	X => X
	);

  init : PROCESS
  -- variable declarations                                     
  BEGIN
        -- code that executes only once
		  
		  I <= X"0";
		  
		  
		  c(2, A);
		  c(3, B);
		  
		  wait for 100 ns;
		  
		  c(1, A);
		  c(-2, B);
		  
		  wait for 100 ns;
		  
  WAIT;
  
  END PROCESS init;

  always : PROCESS
  -- optional sensitivity list
  -- (        )
  -- variable declarations
  BEGIN
        -- code executes for every event on sensitivity list
  WAIT;
  
  END PROCESS always;

END ALU_arch;