-------------------------------------------------------
--! @file alu_4bit.vhd
--! @brief Simple 4-bit ALU with 4 functions
-------------------------------------------------------

--! Use standard library
library IEEE;
--! Use logic elements
    use IEEE.STD_LOGIC_1164.all;
--! Use numeric
--	 use IEEE.NUMERIC_STD.all;
--! Use arichmetics
	 use IEEE.STD_LOGIC_ARITH.all;
--! Use unsigned integers
--	 use IEEE.STD_LOGIC_UNSIGNED.all;
--! Use signed integers
	 use IEEE.STD_LOGIC_SIGNED.all;

--! ALU entity brief description

--! ALU - Arithmetic Logic Unit
Entity ALU is
  PORT (
        A: in  std_Logic_Vector ( 3 DOWNTO 0 ); --! First input
        B: in  std_Logic_Vector ( 3 DOWNTO 0 ); --! Second input
        I: in  std_Logic_Vector ( 3 DOWNTO 0 ); --! Operation instruction input
        X: out std_Logic_Vector ( 3 DOWNTO 0 ) --! Operation result output
       );
end entity;

--! @brief Architure definition of the ALU
--! @details More details about this element.
--! @note Please note, the carry bits are ignored.
--! Multiplication and Division are not yet
--! implemented, but instructions 0x2 and 0x3
--! had been reserved. Multiplication needs
--! 8-bit vector to output the product
--! and Division implies conversion to
--! floating point or integer approximation.
Architecture Behavioral of ALU is
begin

  alu: PROCESS ( A, B, I)
  --! Check instructions using 'case' statement.
  begin
--! This desing of 4-bit ALU
--! implements fallowing operations:
	case I is
--! ARITHMETIC -
--! Addition (0x0),
	when "0000" => X <= (A + B);
--! Substraction (0x1); 
	when "0001" => X <= (A - B);

--	when "0010" => X <= (A * B);

--	when "0011" => X <= (A / B);

--! LOGIC -
--! OR (0x5),
	when "0100" => X <= ( A OR B );
--! XOR (0x6),
	when "0101" => X <= ( A XOR B );
--! XNOR (0x7),
	when "0110" => X <= ( A XNOR B );
--! NOR (0x8),
	when "0111" => X <= ( A NOR B );
--! AND (0x9),
	when "1000" => X <= ( A AND B );
--! NAND (0xA) and
	when "1001" => X <= ( A NAND B );
--! Legacy Unknown.
	when others => X <= "XXXX";
	end case;

  end process;

end architecture;
