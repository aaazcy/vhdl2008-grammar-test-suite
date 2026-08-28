-- =============================================================
-- Case ID: TC_SELECTED_WAVEFORM_ASSIGNMENT_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_WAVEFORM_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: selected_waveform_assignment ::= with expression select [ ? ] target <= [ delay_mechanism ] selected_waveforms ;
-- Case Type: Negative
-- Test Focus: Missing the mandatory `with` keyword at the start -- tests that `expr select target <=` without leading `with` triggers error
-- Expected Result: Triggers syntax error: missing 'with' keyword
-- Dependencies: None
-- =============================================================
entity sel_wave_snn_001 is
end entity sel_wave_snn_001;

architecture test of sel_wave_snn_001 is
  signal s_sel    : integer := 0;
  signal s_target : integer := 0;
begin
  process is
  begin
    s_sel select s_target <= 10 when others;  -- ERROR: missing 'with'
    wait;
  end process;
end architecture test;
