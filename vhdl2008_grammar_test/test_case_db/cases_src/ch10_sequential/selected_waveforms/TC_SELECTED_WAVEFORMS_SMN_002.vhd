-- =============================================================
-- Case ID: TC_SELECTED_WAVEFORMS_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SMN_SELECTED_WAVEFORMS
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: selected_waveforms ::= { waveform when choices , } waveform when choices
-- Rule Description: Selected waveforms must have all choice values of the same type as the select expression
-- Case Type: Negative
-- Test Focus: Type mismatch between select expression (std_logic) and waveform choices (integer values)
-- Expected Result: Triggers semantic error: type mismatch in choices
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity sel_wave_smn_002 is
end entity sel_wave_smn_002;

architecture test of sel_wave_smn_002 is
  signal s_bad : std_logic := '0';
  signal s_sel : std_logic := '0';
begin
  process(s_sel) is
  begin
    with s_sel select
      s_bad <= '1' when 0,     -- ERROR: integer choice for std_logic select
               '0' when 1;
  end process;
end architecture test;
