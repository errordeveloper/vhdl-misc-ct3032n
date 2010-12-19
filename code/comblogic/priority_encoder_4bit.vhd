-------------------------------------------------------
--! @file doxygen_template.vhd
--! @brief PE4 doxygen template
-------------------------------------------------------

--! Use standard library
Library IEEE;
--! Use logic elements
    use IEEE.STD_LOGIC_1164.all;
--! Use unsigned binary
	 use IEEE.STD_LOGIC_UNSIGNED.all;
--! Use numeric functions
    use IEEE.NUMERIC_STD.all;

--! PE4 entity brief description

--! Detailed description of this 
--! PE4 design element.
Entity PE4 is
  Port (
        V:	in	std_Logic_Vector ( 3 DOWNTO 0 ); --! Prioritized Inputs
	A:	out	std_Logic_Vector ( 1 DOWNTO 0 ); --! Address Output
        X:	out	std_Logic  --! Output
       );
end entity;

--! @brief Architure definition of the PE4
--! @details More details about this element.
Architecture logic of PE4 is

procedure maskf (
		signal V: in std_Logic;
		signal X: out std_Logic;
		constant M: unsigned;
		signal W: out std_Logic_Vector
							) is
begin
		X <= V;
		W <= STD_LOGIC_VECTOR(M);

end procedure;


  signal W: std_Logic_Vector ( 1 DOWNTO 0 );
  signal Q: std_Logic;

begin

  process ( V )
  begin
  
   If ( V(0) = '1' ) then
		maskf(V(0), Q, "00", W);
		
	Elsif ( V(1) = '1' ) then
		maskf(V(1), Q, "01", W);
		
	Elsif ( V(2) = '1' ) then
		maskf(V(2), Q, "10", W);
		
	Elsif ( V(3) = '1' ) then
		maskf(V(3), Q, "11", W);
		
	Else Q <= '0';
	end if;

--   case V is

---- This is not gonna work because
---- that's something that by definition
---- never occurs!
--
--   when "XXX1" =>
--   	Q <= V(0);
--	W <= "00";
--
--   when "XX10" =>
--   	Q <= V(1);
--	W <= "01";
--
--   when "X100" =>
--   	Q <= V(2);
--	W <= "10";
--
--   when "1000" =>
--   	Q <= V(3);
--	W <= "11";
--
--   when others =>
--   	Q <= '0';
--	W <= "XX";
--
--   end case;

  end process;

  A <= W;
  X <= Q;

end architecture;
