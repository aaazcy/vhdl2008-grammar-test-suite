-- =============================================================
-- Case ID: TC_SELECTED_WAVEFORM_ASSIGNMENT_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_WAVEFORM_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: selected_waveform_assignment ::= with expression select [ ? ] target <= [ delay_mechanism ] selected_waveforms ;
-- Case Type: Negative
-- Test Focus: Missing target before `<=` -- `with expr select <= waveform` without a target signal triggers error
-- Expected Result: Triggers syntax error: missing target
-- Dependencies: None
-- =============================================================
entity sel_wave_snn_003 is
end entity sel_wave_snn_003;

architecture test of sel_wave_snn_003 is
  signal s_sel : integer := 0;
begin
  process is
  begin
    with s_sel select <= 10 when others;  -- ERROR: missing target
    wait;
  end process;
end architecture test;
