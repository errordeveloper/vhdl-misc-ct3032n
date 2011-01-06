Library IEEE;
    use IEEE.STD_LOGIC_1164.all;
    use IEEE.STD_LOGIC_UNSIGNED.all;
    use IEEE.NUMERIC_STD.all;

Entity PE4 is

  GENERIC (dopt_logic_1: boolean := false;
	   dopt_logic_2: boolean := true;
	   dopt_invalid: boolean := false);

  PORT (V:	in	std_Logic_Vector ( 3 DOWNTO 0 );
	A:	out	std_Logic_Vector ( 1 DOWNTO 0 );
        X:	out	std_Logic);

 procedure maskf (
    signal V:	in std_Logic_Vector(3 DOWNTO 0);
    constant M:	natural;
    signal X:	out std_Logic;
    signal W:	out std_Logic_Vector(1 DOWNTO 0)) is
 begin
	X <= V(M);
	W <= STD_LOGIC_VECTOR(TO_UNSIGNED(M, 2));
 end procedure;

end entity;

Architecture Behavioural of PE4 is

  SIGNAL W: std_Logic_Vector ( 1 DOWNTO 0 );
  SIGNAL Q: std_Logic;

 begin

logic_1: if dopt_logic_1 generate
PROCESS ( V ) begin

	If ( V(0) = '1' ) then	
		maskf(V, 0, Q, W);
		
	Elsif ( V(1) = '1' ) then
		maskf(V, 1, Q, W);
		
	Elsif ( V(2) = '1' ) then
		maskf(V, 2, Q, W);
		
	Elsif ( V(3) = '1' ) then
		maskf(V, 3, Q, W);
		
	Else Q <= '0';
	end if;

end process; end generate;

logic_2: if dopt_logic_2 generate
PROCESS ( V ) begin

    If ( std_match(V, "---1") ) then
	maskf (V, 0, Q, W);
    
    Elsif ( std_match(V, "--10") ) then
	maskf (V, 1, Q, W);

    Elsif ( std_match(V, "-100") ) then
    	maskf (V, 2, Q, W);

    Elsif ( std_match(V, "1000") ) then
	maskf (V, 3, Q, W);

	else Q <= '0';

    end if;

end process; end generate;

invalid: if dopt_invalid generate
PROCESS ( V ) begin

  case V is
 	when "---1" => Q <= V(0); W <= "00";
 	when "--10" => Q <= V(1); W <= "01";
 	when "-100" => Q <= V(2); W <= "10";
 	when "1000" => Q <= V(3); W <= "11";
 	when others => Q <= '0';  W <= "XX";
  end case;
 
end process; end generate;

   A <= W;
   X <= Q;
 
end architecture;
