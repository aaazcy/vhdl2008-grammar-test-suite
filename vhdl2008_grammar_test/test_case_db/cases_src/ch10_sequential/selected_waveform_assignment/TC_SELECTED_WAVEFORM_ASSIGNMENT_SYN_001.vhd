-- =============================================================
-- Case ID: TC_SELECTED_WAVEFORM_ASSIGNMENT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_WAVEFORM_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: selected_waveform_assignment ::= with expression select [ ? ] target <= [ delay_mechanism ] selected_waveforms ;
-- Case Type: Positive
-- Test Focus: Minimal selected waveform -- no `?`, no delay_mechanism, single when choice with simple expression
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sel_wave_syn_001 is
end entity sel_wave_syn_001;

architecture test of sel_wave_syn_001 is
  signal s_sel    : integer := 0;
  signal s_target : integer := 0;
begin
  process is
  begin
    with s_sel select s_target <=
      10 when 1,
      20 when others;
    wait for 10 ns;
    wait;
  end process;
end architecture test;
