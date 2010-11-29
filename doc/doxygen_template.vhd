-------------------------------------------------------
--! @file doxygen_template.vhd
--! @brief UNIT doxygen template
--! Reference: http://www.stack.nl/~dimitri/doxygen/docblocks.html#vhdlblocks
--! Commands: http://www.stack.nl/~dimitri/doxygen/commands.html
-------------------------------------------------------

--! Use standard library
library ieee;
--! Use logic elements
    use ieee.std_logic_1164.all;

--! UNIT entity brief description

--! Detailed description of this 
--! UNIT design element.
entity UNIT is
    port (
        INPUT:	in	std_Logic; --! UNIT input
        OUTPUT:	out	std_Logic  --! UNIT output
    );
end entity;

--! @brief Architure definition of the UNIT
--! @details More details about this element.
architecture behavior of UNIT is
begin

end architecture;
