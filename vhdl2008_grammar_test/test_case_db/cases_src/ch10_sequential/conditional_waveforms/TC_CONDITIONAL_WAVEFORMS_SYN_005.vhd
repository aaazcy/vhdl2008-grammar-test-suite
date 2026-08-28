-- =============================================================
-- Case ID: TC_CONDITIONAL_WAVEFORMS_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_WAVEFORMS
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: conditional_waveforms ::= waveform when condition { else waveform when condition } [ else waveform ]
-- Case Type: Positive
-- Test Focus: Conditional waveforms with after time clauses on each waveform value
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity cond_wave_syn_005 is
end entity cond_wave_syn_005;

architecture test of cond_wave_syn_005 is
  signal s_out : std_logic := '0';
  signal s_fast : std_logic := '0';
begin
  process(s_fast) is
  begin
    s_out <= '1' after 2 ns when s_fast = '1' else
             '0' after 5 ns;
  end process;
end architecture test;
