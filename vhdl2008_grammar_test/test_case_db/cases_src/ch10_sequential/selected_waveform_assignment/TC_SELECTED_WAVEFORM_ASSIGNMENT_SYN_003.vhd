-- =============================================================
-- Case ID: TC_SELECTED_WAVEFORM_ASSIGNMENT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_WAVEFORM_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: selected_waveform_assignment ::= with expression select [ ? ] target <= [ delay_mechanism ] selected_waveforms ;
-- Case Type: Positive
-- Test Focus: Selected waveform with `transport` delay_mechanism -- tests transport inertial model in selected waveform context
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sel_wave_syn_003 is
end entity sel_wave_syn_003;

architecture test of sel_wave_syn_003 is
  signal s_sel    : bit := '0';
  signal s_target : integer := 0;
begin
  process is
  begin
    with s_sel select s_target <= transport
      5 when '0',
      10 when '1';
    wait for 10 ns;
    wait;
  end process;
end architecture test;
