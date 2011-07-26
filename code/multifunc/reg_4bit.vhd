Library IEEE;
    use IEEE.STD_LOGIC_1164.all;

Entity REG4 is

PORT ( Clock: in std_Logic;
       Enable: in std_Logic;
       Control: in std_Logic_Vector ( 1 DOWNTO 0 );
       Data_in: in std_Logic_Vector ( 3 DOWNTO 0 );
       Data_out: out std_Logic_Vector ( 3 DOWNTO 0 ) );

end entity REG4;

Architecture Behavioural of REG4 is

signal q_reg, q_next, data_sig: std_Logic_Vector ( 3 DOWNTO 0 );

begin

PROCESS ( Clock ) begin

    If ( rising_edge(Clock) ) then

	q_reg <= q_next;

    end if;

end process;

  -- Output the data when enabled
  q_next <= data_sig when Enable = '1' else
	  -- Hold current output when disabled
  	  q_reg;
  
PROCESS ( Control ) begin

  case Control is
  
     when "00" => -- Clear the output
  	   data_sig <= ( others => '0' );
  
     when "01" => -- AND operation
  	   data_sig <= ( q_reg AND Data_in );
     
     when "10" => -- OR operation
  	   data_sig <= ( q_reg OR Data_in );
  
     when "11" => -- Load the data
  	   data_sig <= ( Data_in );
  
     when others => -- Don't care
  	   data_sig <= q_reg;
  
  end case;

end process;

  Data_out <= q_reg;

end architecture;
