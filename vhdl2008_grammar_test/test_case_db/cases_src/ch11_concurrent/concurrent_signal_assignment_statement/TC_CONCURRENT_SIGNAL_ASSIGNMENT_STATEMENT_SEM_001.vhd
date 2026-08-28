-- =============================================================
-- Case ID: TC_CONCURRENT_SIGNAL_ASSIGNMENT_STATEMENT_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_CONCURRENT_SIGNAL_ASSIGNMENT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.6
-- Production: concurrent_signal_assignment_statement ::= [ label : ] [ postponed ] concurrent_simple_signal_assignment | [ label : ] [ postponed ] concurrent_conditional_signal_assignment | [ label : ] [ postponed ] concurrent_selected_signal_assignment
-- Rule Description: A postponed concurrent signal assignment drives its target at the end of the simulation cycle after all delta cycles, ensuring the driven value is the final settled value
-- Case Type: Positive
-- Test Focus: a postponed concurrent assignment drives after delta — `postponed y <= a;` is deferred to the end of the simulation cycle, verifying the semantics of a concurrent signal assignment modified by postponed
-- Expected Result: Compiles successfully; postponed assignment drives after delta stabilization
-- Dependencies: None
-- =============================================================
entity csas_sem1_ent is
  port(a, b : in bit; y : out bit);
end entity csas_sem1_ent;
architecture bh of csas_sem1_ent is
begin
  postponed y <= a xor b;
end architecture bh;
