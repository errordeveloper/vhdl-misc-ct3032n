-------------------------------------------------------
--! @file barrel_shifter_4bit.vhd
--! @brief BS4 - 4-bit "barrel shifter" implementation
--! Reference: http://www.cs.umbc.edu/portal/help/VHDL/samples/bshift.vhdl
-------------------------------------------------------

--! Use standard library
Library IEEE;
--! Use logic elements
    use IEEE.STD_LOGIC_1164.all;
	 use IEEE.STD_LOGIC_UNSIGNED.all;
	 use IEEE.NUMERIC_STD.all;

--! BS4 entity is a very basic logical "barrel shifter"

--! has 1 single bit direction control intput

--! Detailed description of this 
--! UNIT design element.
Entity BS4 is
  Port (
  	D:	in	std_Logic; --! Shift Direction
	K:	in	std_Logic_Vector ( 1 DOWNTO 0 ); -- Shift Count
        I:	in	std_Logic_Vector ( 3 DOWNTO 0 ); --! BS4 Input
        X:	out	std_Logic_Vector ( 3 DOWNTO 0 )  --! BS4 Output
       );
end entity;

--! @brief Architure definition of the UNIT
--! @details More details about this element.
architecture behavior of BS4 is

--  function to_integer( s: std_Logic_Vector ) return integer is
--  variable n : integer := 0; -- Descending Signal as integer
--  begin -- to_integer
--
--    For j in s'range loop
--
--       If s(j) = '1' then
--         n := ( n * 2 + 1 );
--       else
--         n := ( n * 2 );
--       end if;
--
--    end loop;
--    return n;
--    end function to_integer;

begin -- behavior

  shift4: process ( D, I, K )
  variable s : integer; -- Shift
  variable l: std_Logic_Vector ( 3 DOWNTO 0 ); -- Out Left
  variable r: std_Logic_Vector ( 3 DOWNTO 0 ); -- Out Right
  begin -- shift4

    s := to_integer( unsigned(K) );

    Case D is 

    when '1' => -- Shift Left
    	
	X <= shift_left(I, s);
	--l := I( 3-s DOWNTO 0 ) & ( s-1 DOWNTO 0 => '0' );
	--X <= l after 250 ps;

    when '0' => -- Shift Right
    
	X <= shift_right(I, s);
	--r := ( 3 DOWNTO 4-s => '0' ) & I( 3 DOWNTO s );
	--X <= r after 250 ps;

    when others => X <= "0000";
    end case;
  end process shift4;

end architecture behavior;

