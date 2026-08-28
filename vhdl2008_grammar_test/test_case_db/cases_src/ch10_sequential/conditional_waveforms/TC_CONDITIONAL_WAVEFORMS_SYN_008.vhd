-- =============================================================
-- Case ID: TC_CONDITIONAL_WAVEFORMS_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_WAVEFORMS
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: conditional_waveforms ::= waveform when condition { else waveform when condition } [ else waveform ]
-- Case Type: Positive
-- Test Focus: Comprehensive conditional waveforms with transport delay and multiple after values per waveform
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity cond_wave_syn_008 is
end entity cond_wave_syn_008;

architecture test of cond_wave_syn_008 is
  signal s_out : std_logic := '0';
  signal s_trigger : std_logic := '0';
begin
  process(s_trigger) is
  begin
    s_out <= transport
             '1' after 1 ns, '0' after 3 ns when s_trigger = '1' else
             '0' after 2 ns;
  end process;
end architecture test;
