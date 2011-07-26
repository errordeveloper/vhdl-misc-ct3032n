Library IEEE;
    use IEEE.STD_LOGIC_1164.all;
    use IEEE.NUMERIC_STD.all;

Entity USEQD is

GENERIC (
constant L: natural := 9 ;
constant X: std_Logic_Vector(L-1 DOWNTO 0) := "010110011" );

PORT ( Data: in std_Logic;
       Flag: out std_Logic;
       Reset: in std_Logic;
       Clock: in std_Logic );

end entity; -- SEQ;

Architecture FSM_BD of USEQD is
  
  type state_type is ( zero, read, done );

  signal state_next, state_reg: state_type;

  signal data_buf: std_Logic_Vector(L-1 DOWNTO 0) := (others => 'X');

begin


-- Events control process
events: PROCESS ( Clock, Reset ) begin

  If ( Reset = '1' ) then

    state_reg <= zero;

    data_buf <= ( others => '0' );

  elsif ( rising_edge(Clock) ) then

    state_reg <= state_next;

    data_buf <= ( Data & data_buf(L-1 DOWNTO 1) );

  end if;

end process; -- events


-- State control process
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

end architecture; -- FSM;
