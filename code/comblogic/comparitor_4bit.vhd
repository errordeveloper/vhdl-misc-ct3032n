-------------------------------------------------------
--! @file comparitor_4bit.vhd
--! @brief Comparitor with two 4-bit inputs
--! Reference: http://www.stack.nl/~dimitri/doxygen/docblocks.html#vhdlblocks
--! Commands: http://www.stack.nl/~dimitri/doxygen/commands.html
-------------------------------------------------------

--! Use standard library
library IEEE;
--! Use logic elements
    use IEEE.STD_LOGIC_1164.all;

--! @brief Comparitor with two 4-bit inputs
--! @details It has two 4-bit inputs and 3 single bit outputs.
Entity comparitor is
  port (
        A: in  std_Logic_Vector ( 3 DOWNTO 0 ); --! First input
        B: in  std_Logic_Vector ( 3 DOWNTO 0 ); --! Second input
        g: out std_Logic; --! A is greater then B
        l: out std_Logic; --! A is less then B
	e: out std_Logic  --! A is equal to B
       );
end entity;

--! @brief Architure definition generic comparitor
Architecture behavior of comparitor is
begin

  process ( A, B )
  begin

  	If ( A = B ) then
	   g <= '0';
	   l <= '0';
	   e <= '1';
	elsif ( A < B ) then
	   g <= '0';
	   l <= '1';
	   e <= '0';
	elsif ( A > B ) then
	   g <= '1';
	   l <= '0';
	   e <= '0';
	end if;

  end process;

end architecture;
