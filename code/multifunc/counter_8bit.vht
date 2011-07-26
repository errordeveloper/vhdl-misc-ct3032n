Library IEEE;                                               
    use IEEE.STD_LOGIC_1164.all;                                
    use IEEE.STD_LOGIC_UNSIGNED.all;

Entity C8_tb is

GENERIC ( pp: time := 20 ns;
          cc: natural := 1000;
          wt: time := 1000 ns );

end C8_tb;

Architecture C8_test OF C8_tb IS

  -- constants                                                 
  -- signals                                                   
  signal Clock : std_Logic := '0';
  signal Count : std_Logic_Vector(7 DOWNTO 0);
  --signal Enable : std_Logic;
  signal Control : std_Logic_Vector(1 DOWNTO 0);
  signal Increment : std_Logic_Vector(7 DOWNTO 0);
  signal Terminate : std_Logic;

Component C8
	PORT (
	Clock :in std_Logic;
	Count :out std_Logic_Vector(7 DOWNTO 0);
	--Enable :in std_Logic;
	Control :in std_Logic_Vector(1 DOWNTO 0);
	Increment :in std_Logic_Vector(7 DOWNTO 0);
	Terminate :out std_Logic
	);
end component;

begin

i1 : C8 port
map (Clock => Clock,
     Count => Count,
     Control => Control,
     Increment => Increment,
     Terminate => Terminate);

  init : PROCESS                                               
  -- variable declarations                                     
  begin
  
  --Enable <= '1';
  Control <= "00";

  wait for 10 ns;

  Control <= "10";

  -- Increment by 10
  Increment <= X"0A";

  wait for wt;

  -- Increment by 1
  Increment <= X"01";
  
  wait for 3000 ns;
  
  -- Decriment by 1
  Control <= "01";
  
  wait for wt;

  -- Decriment by 3
  Increment <= X"03";
  
  wait for 4100 ns;

  Control <= "00";
  
  wait for 40 ns;

  Control <= "11";

  wait for 40 ns;

  Control <= "10";

  
  --Enable <= '0';
  --wait for 5 ns;

  --Control <= "00";
  --wait for 15 ns;
  

  --Control <= "00";

  wait for 20 ns;
    
          -- code that executes only once                      
  WAIT; end process init;                                           
  
  always : PROCESS                                              
  -- optional sensitivity list                                  
  -- (        )                                                 
  -- variable declarations                                      
  begin                                                         

  -- code executes for every event on sensitivity list  
  
   for x in 0 to cc loop
     
     Clock <= not Clock;
 
     wait for pp;
   
     Clock <= not Clock;
   
     wait for pp;
  
  end loop;
  
  WAIT; end process always;                                          

end C8_test;
