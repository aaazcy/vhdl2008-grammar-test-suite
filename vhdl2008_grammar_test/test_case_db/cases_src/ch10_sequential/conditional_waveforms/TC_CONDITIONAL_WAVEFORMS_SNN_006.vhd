-- =============================================================
-- Case ID: TC_CONDITIONAL_WAVEFORMS_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_WAVEFORMS
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: conditional_waveforms ::= waveform when condition { else waveform when condition } [ else waveform ]
-- Case Type: Negative
-- Test Focus: Missing `else` keyword between two conditional waveform branches — branches not properly chained
-- Expected Result: Triggers syntax error: missing else between branches
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity cond_wave_snn_006 is
end entity cond_wave_snn_006;

architecture test of cond_wave_snn_006 is
  signal s_bad : std_logic := '0';
  signal s_a   : integer := 1;
begin
  process(s_a) is
  begin
    s_bad <= '1' when s_a > 0         -- valid first branch
             '0' when s_a <= 0;       -- ERROR: missing 'else' before second branch
  end process;
end architecture test;
