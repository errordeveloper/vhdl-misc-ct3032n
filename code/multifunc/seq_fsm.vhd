Library IEEE;
    use IEEE.STD_LOGIC_1164.all;
    use IEEE.NUMERIC_STD.all;

Entity SEQ is

GENERIC ( constant dopt_invalid: boolean := false;
	  constant dopt_buffered: boolean := true;
	  constant L: natural := 9 ;
	  constant X: std_Logic_Vector(8 DOWNTO 0) := "010110011" );

PORT ( Data: in std_Logic;
       Flag: out std_Logic;
       Reset: in std_Logic;
       Clock: in std_Logic );

end entity; -- SEQ;

Architecture FSM of SEQ is
  
  type state_type is ( zero, read, done );

  signal state_next, state_reg: state_type;

  signal data_buf: std_Logic_Vector(L-1 DOWNTO 0) := (others => 'X');

  signal data_sig: std_Logic;
  signal c: std_Logic := '0';

begin

buffered: if dopt_buffered generate
events: PROCESS ( Clock, Reset ) begin

  If ( Reset = '1' ) then

    state_reg <= zero;
    --state_reg <= read;

    data_buf <= ( others => '0' );

  elsif ( rising_edge(Clock) ) then

    state_reg <= state_next;

    data_buf <= ( Data & data_buf(L-1 DOWNTO 1) );

  end if;

end process; -- events

states: PROCESS ( data_buf, state_reg ) begin

 case state_reg is

  when read =>

   Flag <= '0';

   if ( std_match( data_buf, X ) ) then

     state_next <= done;

   else

     state_next <= read;

   end if;

  when done =>

   Flag <= '1';

   state_next <= read;

  when zero =>

   Flag <= '0';

   state_next <= read;

  when others =>

   state_next <= read;

 end case;

end process; -- states
end generate;


invalid: if dopt_invalid generate
events: PROCESS ( Clock, Reset ) begin

  If ( Reset = '1' ) then

    state_reg <= read;

  elsif ( rising_edge(Clock) ) then

    state_reg <= state_next;

    data_sig <= Data;

    c <= ( not c );

  end if;

end process; -- events

states: PROCESS ( data_sig, state_reg, c )

variable N: natural := 0; begin

case state_reg is


 when read =>

  Flag <= '0';

  If ( data_sig = X(N) ) then

    If ( N = L ) then
       
       state_next <= done;
   
    else

       N := N + 1;

       state_next <= read;

    end if;
 
  else

    N := 0;
    state_next <= read;

  end if;


 when done =>

   N := 0;
   Flag <= '1';
   state_next <= read;


 when others =>

   N := 0;
   Flag <= '0';
   state_next <= read;


end case;

end process; -- states
end generate;


end architecture; -- FSM;
