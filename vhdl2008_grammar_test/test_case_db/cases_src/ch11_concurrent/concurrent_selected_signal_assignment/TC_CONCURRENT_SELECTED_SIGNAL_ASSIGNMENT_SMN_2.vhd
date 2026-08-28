-- =============================================================
-- Case ID: TC_CONCURRENT_SELECTED_SIGNAL_ASSIGNMENT_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: SEM_CSSA_COVERAGE
-- Standard Reference: IEEE 1076-2008 Section 11.6
-- Rule Description: Selected signal assignment must cover all expression values
-- Case Type: Negative
-- Error Category: elaboration_error
-- Test Focus: SEM: incomplete coverage in concurrent selected signal assignment
-- Expected Result: Triggers semantic error: choices do not cover all values
-- Dependencies: None
-- =============================================================
entity cssa_sem1_ent is port(sel:in integer range 0 to 3; y:out integer); end entity;
architecture bh of cssa_sem1_ent is
begin
  with sel select y <=
    10 when 0,
    20 when 1,
    30 when 2;
end architecture bh;
