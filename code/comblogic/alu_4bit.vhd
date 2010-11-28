-------------------------------------------------------
--! @file alu_4bit.vhd
--! @brief Simple 4-bit ALU with 4 functions
-------------------------------------------------------

--! Use standard library
library IEEE;
--! Use logic elements
    use IEEE.STD_LOGIC_1164.all;
--! Use numeric
	 use IEEE.NUMERIC_STD.all;
--! Use arichmetics
	 use IEEE.STD_LOGIC_ARITH.all;
--! Use unsigned integers
--	 use IEEE.STD_LOGIC_UNSIGNED.all;
--! Use signed integers
	 use IEEE.STD_LOGIC_SIGNED.all;

--! ALU entity brief description

--! ALU - Arithmetic Logic Unit
Entity ALU is
  Port (
        A: in  std_Logic_Vector ( 3 DOWNTO 0 ); --! First input
        B: in  std_Logic_Vector ( 3 DOWNTO 0 ); --! Second input
        x: in  std_Logic_Vector ( 3 DOWNTO 0 ); --! Operation instruction input
        o: out std_Logic_Vector ( 3 DOWNTO 0 ) --! Operation result output
       );
end entity;

--! @brief Architure definition of the ALU
--! @details More details about this element.
--! This is a desing for a 4-bit ALU
--! which implements fallowing operations
--! Addition (0x0) and Substraction (0x1),
--! TODO: Multiplication (0x2) and Division (0x3).
--! Logic OR (0x5), XOR (0x6), XNOR (0x7), NOR (0x8), AND (0x9), NAND (0xA)
--! Note, the carry bits are ignored.
Architecture behavior of ALU is
begin

  process ( A, B, x)
  begin
--! Use 'case' statement to check instruction
	case x is
--! Addition
	when "0000" => o <= (A + B);
--! Substraction
	when "0001" => o <= (A - B);
--! Multiplication (NEEDS 8-BIT VECTOR)
--	when "0010" => o <= (A * B);
--! Division (NOT YET IMPLEMENTED)
--	when "0011" => o <= (A / B);
--! Logic OR
	when "0100" => o <= ( A OR B );
--! Logic XOR
	when "0101" => o <= ( A XOR B );
--! Logic XNOR
	when "0110" => o <= ( A XNOR B );
--! Logic NOR
	when "0111" => o <= ( A NOR B );
--! Logic AND
	when "1000" => o <= ( A AND B );
--! Logic NAND
	when "1001" => o <= ( A NAND B );
--! Unknown
	when others => o <= "XXXX";
	end case;

  end process;

end architecture;
