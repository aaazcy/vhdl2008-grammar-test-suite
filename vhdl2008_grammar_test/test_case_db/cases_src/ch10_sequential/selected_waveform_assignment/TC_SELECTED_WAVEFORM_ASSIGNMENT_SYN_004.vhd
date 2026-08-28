-- =============================================================
-- Case ID: TC_SELECTED_WAVEFORM_ASSIGNMENT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_WAVEFORM_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: selected_waveform_assignment ::= with expression select [ ? ] target <= [ delay_mechanism ] selected_waveforms ;
-- Case Type: Positive
-- Test Focus: Selected waveform with explicit `inertial` delay_mechanism -- tests that `inertial` keyword is accepted as explicit delay_mechanism
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sel_wave_syn_004 is
end entity sel_wave_syn_004;

architecture test of sel_wave_syn_004 is
  signal s_sel    : integer range 0 to 2 := 0;
  signal s_target : bit := '0';
begin
  process is
  begin
    with s_sel select s_target <= inertial
      '1' when 0,
      '0' when 1,
      '1' when 2;
    wait for 10 ns;
    wait;
  end process;
end architecture test;
