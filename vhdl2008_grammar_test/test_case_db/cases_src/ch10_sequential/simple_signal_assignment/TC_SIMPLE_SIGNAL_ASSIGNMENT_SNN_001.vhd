-- =============================================================
-- Case ID: TC_SIMPLE_SIGNAL_ASSIGNMENT_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_SIGNAL_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: simple_signal_assignment ::= simple_waveform_assignment | simple_force_assignment | simple_release_assignment
-- Case Type: Negative
-- Test Focus: SNN: missing `<=` — in `s_res a;` there is no assignment arrow between target and waveform, verifying that simple_signal_assignment requires `<=` as the mandatory separator between target and waveform
-- Expected Result: Triggers syntax error: missing "<=" in simple signal assignment
-- Dependencies: None
-- =============================================================
entity sisa_snn1_ent is port(a:in integer; y:out integer); end entity;
architecture bh of sisa_snn1_ent is
  signal s_res:integer:=0;
begin
  process(a) begin
    s_res a;
    y <= s_res;
  end process;
end architecture bh;
