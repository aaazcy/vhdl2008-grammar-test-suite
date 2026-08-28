-- =============================================================
-- Case ID: TC_SELECTED_WAVEFORM_ASSIGNMENT_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_WAVEFORM_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: selected_waveform_assignment ::= with expression select [ ? ] target <= [ delay_mechanism ] selected_waveforms ;
-- Case Type: Negative
-- Test Focus: Wrong operator `=>` used instead of `<=` as assignment operator in selected waveform context
-- Expected Result: Triggers syntax error: wrong assignment operator
-- Dependencies: None
-- =============================================================
entity sel_wave_snn_006 is
end entity sel_wave_snn_006;

architecture test of sel_wave_snn_006 is
  signal s_sel    : integer := 0;
  signal s_target : integer := 0;
begin
  process is
  begin
    with s_sel select s_target => 10 when others;  -- ERROR: '=>' not valid here
    wait;
  end process;
end architecture test;
