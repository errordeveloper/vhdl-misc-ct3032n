-------------------------------------------------------
--! @file 74160_sc4.vhd
--! @brief 74160 4-bit Universal Bidirectional Shift Register
--! Reference: http://doc.chipfind.ru/search.htm?t=part&s=74194&m=0
-------------------------------------------------------

--! Use standard library
library ieee;
--! Use logic elements
    use ieee.std_logic_1164.all;

--! SC4 is designed after 74160 IC.

--! The syncronous, presettable counters feature and internall carry
--! look-ahead for applications in high-speed counting design.
--! Syncronous operation is provided by having all flip-flops clocked
--! simultaneusly so the outputs change coincedent with each other
--! when so instructed by the count-enable inputs and internal gating.
--! This mode of operation eliminates the output counting spikes that
--! normally associated with asyncronous (ripple clock) counters,
--! however counting spikes may occur on the ripple carry output (RCO).
--! A buffered clock input triggers the four flip-flops on the rising
--! edge of the clock input waveform.
--! 
--! These counters are fully programmable; that is the outputs may be
--! prset to either level. As presetting is syncronous, setting up a
--! low level at the load input disables the counter and causes the
--! outputs to agree with setup data after the next clock pulse
--! regardless of the levels of the enable inputs.
--!
--! The carry look-ahead circuitry provides for cascading counters for
--! n-bit syncronous applications without additional gating. Instrumental
--! in accompolishing this function are two count-enable inputs and a
--! ripple carry output. Both count-enable inputs (P and T) must be high
--! to count, and input T is fed forward to enable the RCO. The RCO thus
--! enabled will produce a high-level output pulse with duration
--! approximately equal to the high-level portion of the X(0) output.
--! The high-level overflow ripple carry pulse can be used to enable
--! successive cascaded stages.
--! 
--! 74160 feature a fully independ clock circuit. Changes at control
--! inputs (enable P or T, or load) that will modify the operating mode
--! have no effect until clocking occurs. The function of counter
--! (when enabled, disabled, loading or counting) will be dictated
--! solely by the conditions meeting the stabel setup and hold times.
--!
--! This description is take from original Texas Instruments datasheet
--! dated March 1976 with latest revision in March 1988.

Entity SC4 is
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
Architecture logic of SC4 is
begin


end architecture;
