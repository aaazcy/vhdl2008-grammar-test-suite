-- =============================================================
-- Case ID: TC_CONDITIONAL_SIGNAL_ASSIGNMENT_SEM_DRV_002_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_DRV_002
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Rule Description: Conditions in conditional signal assignment must be of type BOOLEAN
-- Case Type: Negative
-- Error Category: type_mismatch
-- Test Focus: Negative example: the when condition `a` is integer type instead of a BOOLEAN expression, verifying the analyzer detects that condition expression type must be BOOLEAN in conditional_signal_assignment
-- Expected Result: Triggers semantic error: condition must be BOOLEAN type
-- Dependencies: None
-- =============================================================
entity csa_sem1_ent is port(a:in integer; y:out integer); end entity;
architecture bh of csa_sem1_ent is
  signal s_res:integer:=0;
begin
  process(a) begin
    s_res <= 100 when a else 0;
    y <= s_res;
  end process;
end architecture bh;
