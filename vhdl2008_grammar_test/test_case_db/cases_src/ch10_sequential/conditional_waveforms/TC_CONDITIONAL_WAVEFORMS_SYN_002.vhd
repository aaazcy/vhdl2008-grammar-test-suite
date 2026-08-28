-- =============================================================
-- Case ID: TC_CONDITIONAL_WAVEFORMS_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_WAVEFORMS
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: conditional_waveforms ::= waveform when condition { else waveform when condition } [ else waveform ]
-- Case Type: Positive
-- Test Focus: Conditional waveforms with two branches using `else waveform when condition` pattern
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity cond_wave_syn_002 is
end entity cond_wave_syn_002;

architecture test of cond_wave_syn_002 is
  signal s_out  : std_logic := '0';
  signal s_flag : boolean := false;
begin
  process(s_flag) is
  begin
    s_out <= '1' when s_flag else '0' when not s_flag;
  end process;
end architecture test;
