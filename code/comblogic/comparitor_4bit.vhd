-------------------------------------------------------
--! @file comparitor_4bit.vhd
--! @brief Comparitor with two 4-bit inputs
-------------------------------------------------------

--! Use standard library
library IEEE;
--! Use logic elements
    use IEEE.STD_LOGIC_1164.all;

--! @brief Comparitor with two 4-bit inputs
--! @details It has two 4-bit inputs and 3 single bit outputs,
--!		only one of which can be high at any given time.
--!
--!		The output G is high when A>B, L is high when A<B
--!		and E is high when A=B.
--!
Entity COMP4 is
  PORT (
        A: in  std_Logic_Vector ( 3 DOWNTO 0 ); --! First input (4-bit)
        B: in  std_Logic_Vector ( 3 DOWNTO 0 ); --! Second input (4-bit)
        G: out std_Logic; --! High when A is greater then B
        L: out std_Logic; --! High when A is less then B
	E: out std_Logic  --! High when A is equal to B
       );
end entity;

--! @brief Architure definition generic comparitor
Architecture logic of COMP4 is
begin

  PROCESS ( A, B ) begin

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
