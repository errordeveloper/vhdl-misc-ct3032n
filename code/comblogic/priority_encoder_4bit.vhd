-------------------------------------------------------
--! @file doxygen_template.vhd
--! @brief PE4 is a 4-bit Priority Encoder
-------------------------------------------------------

--! Use standard library
Library IEEE;
--! Use logic elements
    use IEEE.STD_LOGIC_1164.all;
--! Use unsigned binary valuse
	 use IEEE.STD_LOGIC_UNSIGNED.all;
--! Use numeric functions for convertion
    use IEEE.NUMERIC_STD.all;

--! PE4 entity brief description

--! Detailed description of this 
--! PE4 design element.
Entity PE4 is
  PORT (
        V:	in	std_Logic_Vector ( 3 DOWNTO 0 ); --! Prioritized Inputs
	A:	out	std_Logic_Vector ( 1 DOWNTO 0 ); --! Address Output
        X:	out	std_Logic  --! Output
       );

--! @brief Masking Function
--! @details Checking has to be done prior procedure call.
procedure maskf (
	signal V: in std_Logic_Vector(3 DOWNTO 0); --! Input Signal - the name of the vector
	constant M: natural; --! Input Bit - it is being converted to unsigned vector
		signal X: out std_Logic; --! Output Bit
		signal W: out std_Logic_Vector(1 DOWNTO 0) --! Input Bit Address
	) is begin
	
		X <= V(M); -- Output the bit value
		W <= STD_LOGIC_VECTOR(TO_UNSIGNED(M, 2));

end procedure;

end entity;

--! @brief Architure definition of the 4-bit Priority Encoder (PE4)
--! @details The address output holds previous value untill it changes.
--!				Otherwise it would require an extra bit.
Architecture logic of PE4 is

  SIGNAL W: std_Logic_Vector ( 1 DOWNTO 0 ); --! Internal Address Bus
  SIGNAL Q: std_Logic; --! Internal Output Bus

begin

  PROCESS ( V ) begin
  
  -- It cannot be edge-triggered,
  -- so only level triggering is implemented.
  -- Using rising_edge() for each brach causes
  -- multiple clock problem.
  -- This is probably most straight-forward way.
     
	If ( V(0) = '1' ) then		-- std_match(V, "---1");
		maskf(V, 0, Q, W);
		
	Elsif ( V(1) = '1' ) then	-- std_match(V, "--10");
		maskf(V, 1, Q, W);
		
	Elsif ( V(2) = '1' ) then	-- std_match(V, "-100");
		maskf(V, 2, Q, W);
		
	Elsif ( V(3) = '1' ) then	-- std_match(V, "1000");
		maskf(V, 3, Q, W);
		
	Else Q <= '0';
	end if;


  end process;

  A <= W;
  X <= Q;

end architecture;

--! @brief A very similar alternative design
--! 		using std_match() function.

Architecture alternative_logic of PE4 is

  SIGNAL W: std_Logic_Vector ( 1 DOWNTO 0 ); --! Internal Address Bus
  SIGNAL Q: std_Logic; --! Internal Output Bus
  
begin

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

  end process;

  A <= W;
  X <= Q;

end architecture;

-- --! @brief This is not going to work,
-- --! because that's something that
-- --! by definition never occurs!
-- Architecture invalid of PE4 is
-- 
--   SIGNAL W: std_Logic_Vector ( 1 DOWNTO 0 ); --! Internal Address Bus
--   SIGNAL Q: std_Logic; --! Internal Output Bus
-- 
-- begin
-- 
--   PROCESS ( V ) begin
-- 
--      case V is
-- 	
-- 	when "---1" =>
-- 		Q <= V(0);
-- 	   W <= "00";
-- 	
-- 	when "--10" =>
-- 		Q <= V(1);
-- 	   W <= "01";
-- 	
-- 	when "-100" =>
-- 		Q <= V(2);
-- 	   W <= "10";
-- 	
-- 	when "1000" =>
-- 		Q <= V(3);
-- 	   W <= "11";
-- 	
-- 	when others =>
-- 		Q <= '0';
-- 	   W <= "XX";
-- 	
--     end case;
-- 	
--   end process;
-- 	
--   A <= W;
--   X <= Q;
-- 
-- end architecture; -- invalid
