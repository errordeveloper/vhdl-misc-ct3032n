
library IEEE;
    use IEEE.STD_LOGIC_1164.all;

Entity COMP4 is
  PORT (
        A: in  std_Logic_Vector ( 3 DOWNTO 0 ); 
        B: in  std_Logic_Vector ( 3 DOWNTO 0 ); 
        G: out std_Logic; 
        L: out std_Logic; 
	E: out std_Logic  
       );
end entity;

Architecture Behaviour of COMP4 is
begin

  compare: PROCESS ( A, B ) begin

  	If ( A = B ) then
	   G <= '0';
	   L <= '0';
	   E <= '1';
	elsif ( A < B ) then
	   G <= '0';
	   L <= '1';
	   E <= '0';
	elsif ( A > B ) then
	   G <= '1';
	   L <= '0';
	   E <= '0';
	end if;

  end process;

end architecture;
