-- =============================================================
-- Case ID: TC_SELECTED_WAVEFORM_ASSIGNMENT_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_WAVEFORM_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: selected_waveform_assignment ::= with expression select [ ? ] target <= [ delay_mechanism ] selected_waveforms ;
-- Case Type: Negative
-- Test Focus: Missing the mandatory `select` keyword -- tests `with expr target <=` without the `select` keyword is rejected
-- Expected Result: Triggers syntax error: missing 'select' keyword
-- Dependencies: None
-- =============================================================
entity sel_wave_snn_002 is
end entity sel_wave_snn_002;

architecture test of sel_wave_snn_002 is
  signal s_sel    : integer := 0;
  signal s_target : integer := 0;
begin
  process is
  begin
    with s_sel s_target <= 10 when others;  -- ERROR: missing 'select'
    wait;
  end process;
end architecture test;
