Library IEEE;
    use IEEE.STD_LOGIC_1164.all;
    use IEEE.STD_LOGIC_UNSIGNED.all;

Entity C8 is

PORT ( Clock: in std_Logic;
       Count: out std_Logic_Vector ( 7 DOWNTO 0 );
       --Enable: in std_Logic := '1';
       Control: in std_Logic_Vector ( 1 DOWNTO 0 );
       Increment: in std_Logic_Vector ( 7 DOWNTO 0 ) := X"01";
       Terminate: out std_Logic );

end entity C8;

Architecture Behavioural of C8 is

signal i_sig, q_reg, q_next: std_Logic_Vector ( 7 DOWNTO 0 );
signal c_sig: std_Logic_Vector ( 1 DOWNTO 0 );
signal t_sig: std_Logic;

begin

PROCESS ( Clock ) begin

    If ( rising_edge(Clock) ) then

      --If ( Enable = '1' ) then

	q_reg <= q_next;

	-- Latch the inputs
	c_sig <= Control;
	i_sig <= Increment;

      --end if;

    end if;

end process;

PROCESS ( c_sig, q_reg ) begin

  case c_sig is
  
     when "00" => -- Clear the output to '00'
  	   q_next <= ( others => '0' );
  
     when "01" => --  Count down
  	   q_next <= ( q_reg - i_sig );
	   If q_reg = X"00" then
	        t_sig <= '1';
	   else t_sig <= '0';
	   end if;
     
     when "10" => --  Count up
  	   q_next <= ( q_reg + i_sig );
	   If q_reg = X"ff" then
		t_sig <= '1';
	   else t_sig <= '0';
	   end if;
  
     when "11" => -- Cler the output to 'ff'
  	   q_next <= ( others => '1' );
  
     when others => -- Don't care
  	   q_next <= q_reg;
  
  end case;


end process;


-- Terminate <= '1' when ( q_next = (not q_reg) ) else '0';

  Terminate <= t_sig;
  Count <= q_reg;

end architecture;
