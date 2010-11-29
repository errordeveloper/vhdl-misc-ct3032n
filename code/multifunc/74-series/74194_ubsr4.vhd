-------------------------------------------------------
--! @file 74194_ubsr4.vhd
--! @brief 74194 4-bit Universal Bidirectional Shift Register
--! Reference: http://doc.chipfind.ru/search.htm?t=part&s=74194&m=0
-------------------------------------------------------

--! Use standard library
library ieee;
--! Use logic elements
    use ieee.std_logic_1164.all;

--! UBSR4 is designed after 74194 IC.

--! The bidirectional shift rigister was designed to incorporate
--! virtually all of the features a system designer may want in a
--! sift register. The original circuit contains 46 equivalent gates
--! and features parallel inputs, parallel outputs, right-shift and
--! left-shift serial inputs, operating-mode-control inputs
--! and a direct overriding clear line.
--! The register has four distinct modes of operation:
--!  * Inhibit clock (do nothing)
--!  * Shift right (in direction X(3) towards X(0))
--!  * Shift left (in direction X(0) towards X(3))
--!  * Parallel (broadside) load
--!
--! Syncronous parallel loading is accompolished by applying
--! the four bits of data and taking both mode control input bits,
--! M(0) and M(1), high. The data are loaded into the associated
--! flip-flops and appear at the outputs after the positive transition
--! of the clock input. During loading, serial data flow is inhibited.
--!
--! Shift right is accompolished syncronously with the rising edge of
--! the clock pulse when M(0) is high  and M(1) is low. Serial data for
--! this mode is entered at the shift-right data input. When M(0) is high
--! and M(1) is high, data shifts left syncronously and new data is entered
--! at the shift-left serial input.
--!
--! Clocking of the shift register is inhibited when both mode control bits are low.
--! The mode controls bits should be changed only while the clock is high.
--!
--! This description is take from original Texas Instruments datasheet
--! dated March 1974 with latest revision in March 1988.

Entity UBSR4 is
    port (
        I:	in	std_Logic_Vector ( 3 DOWNTO 0 ); --! Input Bits
        X:	out	std_Logic_Vector ( 3 DOWNTO 0 ); --! Output Bits
	M:	in	std_Logic_Vector ( 1 DOWNTO 0 ); --! Mode Control
	L:	in	std_Logic; --! Shift Left
	R:	in	std_Logic; --! Shift Right
	K:	in	std_Logic; --! Clock
	C:	in	std_Logic; --! Clear
    );
end entity;

--! @brief Architure definition of the UNIT
--! @details More details about this element.
Architecture logic of UBSR4 is
begin

	g0 <= ( F0 and (not M(0)) and M(1) ); -- 1st AND gate with F0 feedback input

	g1 <= ( k and (not M(0)) and (not M(1)) );  -- 2nd AND gate

	g2 <= ( F1 and  M(0) and (not M(1)) ); -- 3rd AND gate with F1 feedback input

	g3 <= ( F2 and M(0) and M(1) ); -- 4th AND gate with F2 feedback input

	Sl <= ( g0 OR g1 OR g2 OR g3 );

	Rl <= ( not Sl )

end architecture;
