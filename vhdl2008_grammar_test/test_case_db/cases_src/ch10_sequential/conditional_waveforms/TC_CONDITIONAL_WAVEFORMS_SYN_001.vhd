-- =============================================================
-- Case ID: TC_CONDITIONAL_WAVEFORMS_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_WAVEFORMS
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: conditional_waveforms ::= waveform when condition { else waveform when condition } [ else waveform ]
-- Case Type: Positive
-- Test Focus: Minimal conditional waveform — single `waveform when condition` clause with no else
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity cond_wave_syn_001 is
end entity cond_wave_syn_001;

architecture test of cond_wave_syn_001 is
  signal s_out : std_logic := '0';
  signal s_en  : std_logic := '0';
begin
  process(s_en) is
  begin
    s_out <= '1' when s_en = '1';
  end process;
end architecture test;
