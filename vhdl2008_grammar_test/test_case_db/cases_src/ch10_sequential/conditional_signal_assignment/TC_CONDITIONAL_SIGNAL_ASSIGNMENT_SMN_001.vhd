-- =============================================================
-- Case ID: TC_CONDITIONAL_SIGNAL_ASSIGNMENT_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_CONDITIONAL_SIGNAL_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Rule Description: Multiple violation paths for conditional signal assignment
-- Case Type: Negative
-- Error Category: type_mismatch + unknown
-- Test Focus: Multiple violations: when condition a is not BOOLEAN + the else branch waveform is a bit literal while the target is integer, verifying the analyzer detects both the condition type error and the waveform type mismatch
-- Expected Result: Triggers multiple semantic errors
-- Dependencies: None
-- =============================================================
entity csa_smn1_ent is port(a:in integer; y:out integer); end entity;
architecture bh of csa_smn1_ent is
  signal s_res:integer:=0;
begin
  process(a) begin
    s_res <= 100 when a else '1';
    y <= s_res;
  end process;
end architecture bh;
