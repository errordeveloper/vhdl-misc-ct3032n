-------------------------------------------------------
--! @file doxygen_template.vhd
--! @brief PE4 is a 4-bit Priority Encoder
-------------------------------------------------------

--! Use standard library
Library IEEE;
--! Use logic elements
    use IEEE.STD_LOGIC_1164.all;
--! Use unsigned binary values
    use IEEE.STD_LOGIC_UNSIGNED.all;
--! Use numeric functions for convertion
    use IEEE.NUMERIC_STD.all;

--! @brief PE4 entity is a 4-bit Priority Encoder

--! @details Priority Ecoder is a type of logic device
--! that takes a number of inputs. It outputs
--! only one input value based on priority.
--! If there is an event at input A,
--! then other inputs are ignored.
--! If input A is quite, then input B is checked,
--! the last input (N) will be output only when
--! N-1 and all other inputs are quite.
--! Priority Encoders are often used
--! to connect many inputs to one external
--! interrupt pin of a microcontroller.
--! Priority encoder also outputs the address
--! of currently active input pin.
Entity PE4 is

  GENERIC (dopt_logic1: boolean := false; --! Frirst design option
	  dopt_logic2: boolean := true; --! Second design option using std_match()
	  dopt_invalid: boolean := false); --! Invalid design option, cannot synthesize

  PORT (
        V:	in	std_Logic_Vector ( 3 DOWNTO 0 ); --! Prioritized Inputs
	A:	out	std_Logic_Vector ( 1 DOWNTO 0 ); --! Address Output
        X:	out	std_Logic  --! Output
       );

--! @name Masking Function
--! @brief Takes vector V, masks one bit M and outputs 
--! V(M) to the output vector bus X, writing the
--! mask address of this bit M to the address vector bus W.
--! @note Event condition checking has to be done prior procedure call.
 procedure maskf (
	signal V:	in std_Logic_Vector(3 DOWNTO 0);
	constant M:	natural;
	signal X:	out std_Logic;
	signal W:	out std_Logic_Vector(1 DOWNTO 0)
	) is begin
	
		X <= V(M); -- Output the bit value
		W <= STD_LOGIC_VECTOR(TO_UNSIGNED(M, 2));

 end procedure;

end entity;

--! @brief Architure definition of the 4-bit Priority Encoder (PE4)
--! has two valid design options and one invalid.
--! It is probably most straight-forward way to use std_match().
--!
--! @note
--!  The address output holds previous value until it changes.
--! Otherwise it would require an extra bit.
--! 
--! @note
--!  It cannot be edge-triggered, so only level triggering is implemented.
--! Using rising_edge() for each if-brach causes multiple clock problem.

 Architecture logic of PE4 is

  SIGNAL W: std_Logic_Vector ( 1 DOWNTO 0 ); --! Internal Address Bus
  SIGNAL Q: std_Logic; --! Internal Output Bus

 begin

logic1: if dopt_logic1 generate
PROCESS ( V ) begin

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
end generate; -- dopt=1

logic2: if dopt_logic2 generate
-- A very similar alternative design
-- using std_match() function.
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
end generate; -- dopt=2

invalid: if dopt_invalid generate
-- This is not going to work,
-- because that's something that
-- by definition never occurs!
PROCESS ( V ) begin

      case V is
 	
 	when "---1" =>
 		Q <= V(0);
 	   W <= "00";
 	
 	when "--10" =>
 		Q <= V(1);
 	   W <= "01";
 	
 	when "-100" =>
 		Q <= V(2);
 	   W <= "10";
 	
 	when "1000" =>
 		Q <= V(3);
 	   W <= "11";
 	
 	when others =>
 		Q <= '0';
 	   W <= "XX";
 	
     end case;
 
end process;	
end generate; -- dopt=3

   A <= W;
   X <= Q;
 
end architecture;
