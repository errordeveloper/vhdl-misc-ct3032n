-------------------------------------------------------
--! @file comparator_4bit.vhd
--! @brief Comparator with two 4-bit inputs
-------------------------------------------------------

--! Use standard library
library IEEE;
--! Use logic elements
    use IEEE.STD_LOGIC_1164.all;

--! @brief Comparator with two 4-bit inputs
--! @details It has two 4-bit inputs (\b A & \b B)
--! and 3 single bit outputs (\b G, \b E & \b L),
--! only one of which can be high at any given time.
--!
--! The output \b G is high when <b>A > B</b>,
--! \b L is high when <b>A < B </b>
--! and \b E is high when <b>A = B</b>.
--!
Entity COMP4 is
  PORT (
        A: in  std_Logic_Vector ( 3 DOWNTO 0 ); --! First input (4-bit)
        B: in  std_Logic_Vector ( 3 DOWNTO 0 ); --! Second input (4-bit)
        G: out std_Logic; --! High when \b A is greater then \b B
        L: out std_Logic; --! High when \b A is less then \b B
	E: out std_Logic  --! High when \b A is equal to \b B
       );
end entity;

--! @brief High-level architecture of
--! generic comparator is designed 
--! using \c if-elseif conditions.
Architecture Behaviour of COMP4 is
begin

  compare: PROCESS ( A, B ) begin

  	If ( A = B ) then
	   G <= '0';
	   L <= '0';
	   E <= '1';
	elsif ( A < B ) then
	   G <= '0';
	   L <= '1';
	   E <= '0';
	elsif ( A > B ) then
	   G <= '1';
	   L <= '0';
	   E <= '0';
	end if;

  end process;

end architecture;
