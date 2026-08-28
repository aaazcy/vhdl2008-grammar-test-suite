-- =============================================================
-- Case ID: TC_SELECTED_WAVEFORM_ASSIGNMENT_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_WAVEFORM_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: selected_waveform_assignment ::= with expression select [ ? ] target <= [ delay_mechanism ] selected_waveforms ;
-- Case Type: Positive
-- Test Focus: Selected waveform with enumerated type select expression, no delay mechanism -- tests user-defined enum driving waveform selection
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sel_wave_syn_006 is
end entity sel_wave_syn_006;

architecture test of sel_wave_syn_006 is
  type t_op is (ADD, SUB, MUL, DIV);
  signal s_op     : t_op := ADD;
  signal s_result : integer := 0;
begin
  process is
  begin
    with s_op select s_result <=
      100 when ADD,
      200 when SUB,
      300 when MUL,
      400 when DIV;
    wait for 10 ns;
    wait;
  end process;
end architecture test;
