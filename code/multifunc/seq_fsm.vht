Library IEEE;                                               
    use IEEE.STD_LOGIC_1164.all;                                

Entity SEQ_tb is

GENERIC ( pp: time := 20 ns;
          cc: natural := 1000;
          wt: time := 40 ns );

end SEQ_tb;

Architecture SEQ_test OF SEQ_tb IS

  -- constants                                                 
  -- signals                                                   
  signal Data : std_Logic;
  signal Flag : std_Logic;
  signal Reset : std_Logic;
  signal Clock : std_Logic := '0';

Component C8
	PORT (
	Data :in std_Logic;
	Flag :out std_Logic;
	Reset :in std_Logic;
	Clock :in std_Logic
	);
end component;

begin

i1 : C8 port
map ( Data => Data,
      Flag => Flag,
      Reset => Reset,
      Clock => Clock );

  init : PROCESS
  -- variable declarations
  begin
  
  -- code that executes only once

  Reset <= '0';

  wait for 15 ns;

  Reset <= '1';

  wait for 15 ns;

  Reset <= '0';

  wait for 15 ns;

  Data <= '1';
  wait for wt;

  Data <= '1';
  wait for wt;

  Data <= '0';
  wait for wt;

  Data <= '0';
  wait for wt;

  Data <= '0';
  wait for wt;

  Data <= '0';
  wait for wt;

  Data <= '1';
  wait for wt;

  Data <= '1';
  wait for wt;

  Data <= '0';
  wait for wt;

  --
    
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

end SEQ_test;
