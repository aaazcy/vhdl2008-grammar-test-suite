-- =============================================================
-- Case ID: TC_SELECTED_WAVEFORM_ASSIGNMENT_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_WAVEFORM_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: selected_waveform_assignment ::= with expression select [ ? ] target <= [ delay_mechanism ] selected_waveforms ;
-- Case Type: Negative
-- Test Focus: Invalid delay_mechanism keyword `delay` -- only `transport` or `inertial` are valid delay mechanisms in VHDL
-- Expected Result: Triggers syntax error: invalid delay_mechanism 'delay'
-- Dependencies: None
-- =============================================================
entity sel_wave_snn_005 is
end entity sel_wave_snn_005;

architecture test of sel_wave_snn_005 is
  signal s_sel    : integer := 0;
  signal s_target : integer := 0;
begin
  process is
  begin
    with s_sel select s_target <= delay 10 when others;  -- ERROR: 'delay' not valid
    wait;
  end process;
end architecture test;
