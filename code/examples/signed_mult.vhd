library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity signed_mult is
port 
	(
		a		: in signed (7 downto 0);
		b		: in signed (7 downto 0);
		result	: out signed (15 downto 0)
	);

end entity;

architecture rtl of signed_mult is
begin
	result <= a * b;
	
end rtl;
