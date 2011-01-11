Library IEEE;
    use IEEE.STD_LOGIC_1164.all;

Entity SEQ is

GENERIC ( constant L: natural := 3 ;
	  constant X: std_Logic_Vector(3 DOWNTO 0) := "0011" );

PORT ( Data: in std_Logic;
       Flag: out std_Logic;
       Reset: in std_Logic;
       Clock: in std_Logic );

end entity; -- SEQ;

Architecture FSM of SEQ is

  type state_type is ( zero, read, done );

  signal state_next, state_reg: state_type;

  signal data_sig: std_Logic;


begin


events: PROCESS ( Clock, Reset ) begin

  If ( Reset = '1' ) then

    state_reg <= zero;

  elsif ( rising_edge(Clock) ) then

    state_reg <= state_next;

    data_sig <= Data;

  end if;

end process; -- events

  
states: PROCESS ( data_sig, state_reg )

variable N: natural; begin

case state_reg is


 when zero =>

  Flag <= '0';

  N := 0;

  state_next <= read;


 when read =>

  If ( data_sig = X(N) ) then

    If ( N = L ) then
       
       state_next <= done;
   
    else

       N := N + 1;

       state_next <= read;

    end if;

  else state_next <= zero;

  end if;


 when done =>

   Flag <= '1';
   state_next <= zero;


 when others =>

   Flag <= '0';
   state_next <= zero;


end case;

end process; -- states

end architecture; -- FSM;

