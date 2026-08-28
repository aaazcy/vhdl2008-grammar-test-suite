-- =============================================================
-- Case ID: TC_SELECTED_WAVEFORM_ASSIGNMENT_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_025
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: selected_waveform_assignment ::= with expression select [ ? ] target <= [ delay_mechanism ] selected_waveforms ;
-- Rule Description: The type of the select expression must be compatible with the choice values in selected_waveforms
-- Case Type: Negative
-- Test Focus: Type mismatch -- integer select expression with std_logic choices in when clauses should fail type check
-- Expected Result: Triggers semantic error: type mismatch between select expression and choices
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity sel_wave_smn_001 is
end entity sel_wave_smn_001;

architecture test of sel_wave_smn_001 is
  signal s_sel    : integer := 0;
  signal s_target : integer := 0;
begin
  process is
  begin
    with s_sel select s_target <=
      10 when '1',  -- ERROR: character choice on integer select
      20 when others;
    wait;
  end process;
end architecture test;
