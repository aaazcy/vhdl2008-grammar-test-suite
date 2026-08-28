-- =============================================================
-- Case ID: TC_CONCURRENT_SIGNAL_ASSIGNMENT_STATEMENT_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_SIGNAL_ASSIGNMENT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.6
-- Production: concurrent_signal_assignment_statement ::= [ label : ] [ postponed ] concurrent_simple_signal_assignment | [ label : ] [ postponed ] concurrent_conditional_signal_assignment | [ label : ] [ postponed ] concurrent_selected_signal_assignment
-- Case Type: Negative
-- Test Focus: SNN: missing colon after label — `lbl y <= a;` places the label directly before the assignment with no colon separator, verifying that the label of a labeled concurrent signal assignment must be followed by a colon
-- Expected Result: Triggers syntax error: missing ":" after label in concurrent signal assignment
-- Dependencies: None
-- =============================================================
entity csas_snn1_ent is
  port(a : in bit; y : out bit);
end entity csas_snn1_ent;
architecture bh of csas_snn1_ent is
begin
  lbl y <= a;
end architecture bh;
