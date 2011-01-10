Library IEEE;                                               
    use IEEE.STD_LOGIC_1164.all;                                

Entity REG4_tb is

GENERIC ( pp: time := 20 ns;
          cc: natural := 39;
          wt: time := 90 ns );

end REG4_tb;

Architecture REG4_test OF REG4_tb IS

  -- constants                                                 
  -- signals                                                   
  signal Clock : std_Logic := '0';
  signal Control : std_Logic_Vector(1 DOWNTO 0);
  signal Data_in : std_Logic_Vector(3 DOWNTO 0);
  signal Data_out : std_Logic_Vector(3 DOWNTO 0);
  signal Enable : std_Logic;

Component REG4
	PORT (
	Clock : in std_Logic;
	Control : in std_Logic_Vector(1 DOWNTO 0);
	Data_in : in std_Logic_Vector(3 DOWNTO 0);
	Data_out : out std_Logic_Vector(3 DOWNTO 0);
	Enable : in std_Logic
	);
end component;

begin

i1 : REG4 port
map (Clock => Clock,
     Control => Control,
     Data_in => Data_in,
     Data_out => Data_out,
     Enable => Enable);

  init : PROCESS                                               
  -- variable declarations                                     
  begin
  Enable <= '1';
  
  -- Control <= "00";
  
  -- INPUT --> LOAD --> HOLD --> AND -->
  --> INPUT --> AND --> OR --> CLEAR
  
  Data_in <= "1101";
  
  Control <= "11";
  
  wait for wt;
  
  Control <= "01";
  
  wait for wt;
  
  Control <= "10";
  
  wait for wt;
  
  Control <= "00";
  
  wait for wt;
  
  Control <= "11";
  
  wait for wt;
  
  Control <= "00";
  
  wait for wt;
  
  Data_in <= "1001";
  
  wait for wt;
  
  Control <= "11";
  
  wait for wt;
  
  Data_in <= "0110";
  
  wait for wt;
  
  Control <= "10";
  
  wait for wt;
  
  Control <= "01";
  
  wait for wt;
  
  Enable <= '0';
  
  wait for wt;
  
  Control <= "00";
  
  wait for wt;
  
  wait for wt;
  
  Enable <= '1';
  
  
    
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

end REG4_test;
