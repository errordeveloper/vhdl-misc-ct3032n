-------------------------------------------------------
--! @file alu_4bit.vhd
--! @brief Simple 4-bit ALU with 4 functions
-------------------------------------------------------

--! Use standard library
library IEEE;
--! Use logic elements
    use IEEE.STD_LOGIC_1164.all;

--! ALU entity brief description

--! ALU - Arithmetic Logic Unit
--! This is a desing for a 4-bit ALU
--! which implements fallowing operations
--! Addition (0x0), Substraction (0x1),
--! Multiplication (0x2) and Devision (0x3).
Entity ALU is
  Port (
        A: in  std_Logic_Vector ( 3 DOWNTO 0 ); --! First input
        B: in  std_Logic_Vector ( 3 DOWNTO 0 ); --! Second input
        x: in  std_Logic_Vector ( 1 DOWNTO 0 ); --! Operation instruction input
        o: out std_Logic_Vector ( 3 DOWNTO 0 ); --! Operation result output
       );
end entity;

--! @brief Architure definition of the ALU
--! @details More details about this element.
Architecture behavior of ALU is
begin

  process ( A, B, x)
  begin
--! Use 'case' statement to check instruction
	case x is
--! Addition
	when "00" => o <= (A + B);
--! Substraction
	when "01" => o <= (A - B);
--! Multiplication
	when "10" => o <= (A * B);
--! Devision
	when "11" => o <= (A / B);
--! Unknown
	when others => o < "XX";
	end case;

  end process;

end architecture;
