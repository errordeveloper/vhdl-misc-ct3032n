Entity C8 is
-- PORTS : Clock, Count, Control, Increment & Terminate
end entity C8;

Architecture Behavioural of C8 is

signal i_sig, q_reg, q_next:
       std_Logic_Vector ( 7 DOWNTO 0 );
signal c_sig: std_Logic_Vector ( 1 DOWNTO 0 );
signal t_sig: std_Logic;

begin

PROCESS ( Clock ) begin

    If ( rising_edge(Clock) ) then

	-- Clasic sync construct
	q_reg <= q_next;

	-- Latch the inputs
	c_sig <= Control;
	i_sig <= Increment;

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

---- The fallowing signal assignment generates
---- inappropriate circuit, otherwise it would
---- ideal for the purpose of this signal.
-- Terminate <= '1' when ( q_next = (not q_reg) ) else
--		'0';

  Terminate <= t_sig;
  Count <= q_reg;

end architecture;
