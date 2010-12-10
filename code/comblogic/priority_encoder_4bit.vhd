-------------------------------------------------------
--! @file doxygen_template.vhd
--! @brief PE4 doxygen template
--! Reference: http://www.stack.nl/~dimitri/doxygen/docblocks.html#vhdlblocks
--! Commands: http://www.stack.nl/~dimitri/doxygen/commands.html
-------------------------------------------------------

--! Use standard library
Library IEEE;
--! Use logic elements
    use IEEE.STD_LOGIC_1164.all;

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

  signal W: std_Logic_Vector ( 1 DOWNTO 0 );
  signal Q: std_Logic;

begin

  process ( V )
  begin
  
   case V is

   when "XXX1" =>
   	Q <= V(0);
	W <= "00";

   when "XX10" =>
   	Q <= V(1);
	W <= "01";

   when "X100" =>
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

  A <= W;
  X <= Q;

end architecture;
