-- =============================================================
-- Case ID: TC_CONDITIONAL_WAVEFORMS_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_CONDITIONAL_WAVEFORMS
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: conditional_waveforms ::= waveform when condition { else waveform when condition } [ else waveform ]
-- Rule Description: The condition in a conditional waveform must be a boolean expression
-- Case Type: Negative
-- Test Focus: Using a non-boolean expression (integer value) as a condition in conditional waveform
-- Expected Result: Triggers semantic error: condition must be boolean
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity cond_wave_smn_001 is
end entity cond_wave_smn_001;

architecture test of cond_wave_smn_001 is
  signal s_bad : std_logic := '0';
  signal s_val : integer := 5;
begin
  process(s_val) is
  begin
    s_bad <= '1' when s_val else '0';  -- ERROR: integer is not boolean
  end process;
end architecture test;
