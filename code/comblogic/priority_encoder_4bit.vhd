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
        I:	in	std_Logic_Vector ( 3 DOWNTO 0 ); --! PE4 input
        OUTPUT:	out	std_Logic  --! PE4 output
       );
end entity;

--! @brief Architure definition of the PE4
--! @details More details about this element.
architecture logic of PE4 is
begin

end architecture;
