-- =============================================================
-- Case ID: TC_SELECTED_WAVEFORM_ASSIGNMENT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_WAVEFORM_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: selected_waveform_assignment ::= with expression select [ ? ] target <= [ delay_mechanism ] selected_waveforms ;
-- Case Type: Negative
-- Test Focus: Missing the terminating semicolon after a complete selected waveform assignment -- tests parser demands `;` at end
-- Expected Result: Triggers syntax error: missing ';'
-- Dependencies: None
-- =============================================================
entity sel_wave_snn_004 is
end entity sel_wave_snn_004;

architecture test of sel_wave_snn_004 is
  signal s_sel    : integer := 0;
  signal s_target : integer := 0;
begin
  process is
  begin
    with s_sel select s_target <= 10 when others  -- ERROR: missing ';'
    wait;
  end process;
end architecture test;
