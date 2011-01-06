Library IEEE;
    use IEEE.STD_LOGIC_1164.all;
    use IEEE.STD_LOGIC_ARITH.all;
    use IEEE.STD_LOGIC_SIGNED.all;

Entity ALU is
  PORT (
        A: in  std_Logic_Vector ( 3 DOWNTO 0 ); 
        B: in  std_Logic_Vector ( 3 DOWNTO 0 ); 
        I: in  std_Logic_Vector ( 3 DOWNTO 0 ); 
        X: out std_Logic_Vector ( 3 DOWNTO 0 ) 
       );
end entity;

Architecture Behavioral of ALU is
begin

  PROCESS ( A, B, I)
  
  begin
	case I is

	  when "0000" => X <= (A + B);

	  when "0001" => X <= (A - B);

	  when "0100" => X <= ( A OR B );

	  when "0101" => X <= ( A XOR B );

	  when "0110" => X <= ( A XNOR B );

	  when "0111" => X <= ( A NOR B );

	  when "1000" => X <= ( A AND B );

	  when "1001" => X <= ( A NAND B );

	  when others => X <= "XXXX";

	end case;

  end process;

end architecture;
