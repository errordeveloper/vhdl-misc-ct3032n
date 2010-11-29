-------------------------------------------------------
--! @file doxygen_template.vhd
--! @brief UNIT doxygen template
--! Reference: http://www.stack.nl/~dimitri/doxygen/docblocks.html#vhdlblocks
--! Commands: http://www.stack.nl/~dimitri/doxygen/commands.html
-------------------------------------------------------

--! Use standard library
Library IEEE;
--! Use logic elements
    use IEEE.STD_LOGIC_1164.all;

--! UNIT entity brief description

--! Detailed description of this 
--! UNIT design element.
Entity UNIT is
  Port (
        INPUT:	in	std_Logic; --! UNIT input
        OUTPUT:	out	std_Logic  --! UNIT output
       );
end entity;

--! @brief Architure definition of the UNIT
--! @details More details about this element.
architecture behavior of UNIT is
begin

end architecture;
