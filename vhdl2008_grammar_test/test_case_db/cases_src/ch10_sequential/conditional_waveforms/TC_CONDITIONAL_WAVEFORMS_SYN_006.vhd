-- =============================================================
-- Case ID: TC_CONDITIONAL_WAVEFORMS_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_WAVEFORMS
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: conditional_waveforms ::= waveform when condition { else waveform when condition } [ else waveform ]
-- Case Type: Positive
-- Test Focus: Conditional waveforms using `unaffected` keyword as a waveform to preserve previous value
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity cond_wave_syn_006 is
end entity cond_wave_syn_006;

architecture test of cond_wave_syn_006 is
  signal s_reg  : std_logic_vector(3 downto 0) := "0000";
  signal s_hold : std_logic := '0';
begin
  process(s_hold) is
  begin
    s_reg <= "1111" when s_hold = '0' else unaffected;
  end process;
end architecture test;
