-- =============================================================
-- Case ID: TC_CONDITIONAL_SIGNAL_ASSIGNMENT_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_SIGNAL_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: conditional_signal_assignment ::= conditional_waveform_assignment | conditional_force_assignment
-- Case Type: Negative
-- Test Focus: SNN: condition expression missing after when - in s_res <= 100 when ; there is no condition on the right of when, every when branch of conditional_waveform_assignment must carry a condition
-- Expected Result: Triggers syntax error: primary expression expected
-- Dependencies: None
-- =============================================================
entity csa_missing_cond is port(a,b:in integer; y:out integer); end entity;
architecture vhdl2008 of csa_missing_cond is
  signal s_res:integer:=0;
begin
  process(a,b) begin
    s_res <= 100 when;
    y <= s_res;
  end process;
end architecture vhdl2008;
