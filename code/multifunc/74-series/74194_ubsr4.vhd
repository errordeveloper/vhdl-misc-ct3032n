-------------------------------------------------------
--! @file 74194_ubsr4.vhd
--! @brief 74194 4-bit Universal Bidirectional Shift Register
--! Reference: http://www.stack.nl/~dimitri/doxygen/docblocks.html#vhdlblocks
--! Commands: http://www.stack.nl/~dimitri/doxygen/commands.html
-------------------------------------------------------

--! Use standard library
library ieee;
--! Use logic elements
    use ieee.std_logic_1164.all;

--! UBSR4 is designed after 74194 IC.

--! Detailed description of this 
--! UNIT design element.
entity UBSR4 is
    port (
        I:	in	std_Logic_Vector ( 3 DOWNTO 0 ); --! Input bits
        X:	out	std_Logic_Vector ( 3 DOWNTO 0 );  --! Output bits
	L:	in	std_Logic; --! Shift Left
	R:	in	std_Logic; --! Shift Right
    );
end entity;

--! @brief Architure definition of the UNIT
--! @details More details about this element.
architecture behavior of UNIT is
begin

end architecture;
