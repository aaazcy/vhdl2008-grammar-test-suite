-- =============================================================
-- Case ID: TC_CONCURRENT_SIGNAL_ASSIGNMENT_STATEMENT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_SIGNAL_ASSIGNMENT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.6
-- Production: concurrent_signal_assignment_statement ::= [ label : ] [ postponed ] concurrent_simple_signal_assignment | [ label : ] [ postponed ] concurrent_conditional_signal_assignment | [ label : ] [ postponed ] concurrent_selected_signal_assignment
-- Case Type: Positive
-- Test Focus: Concurrent signal assignment with label + postponed——`postponed lbl : y <= a;` uses both the label and postponed modifiers at once, verifying the syntax with the full combination of all three elements
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity csas_label_postponed_ent is
  port(a : in bit; y : out bit);
end entity csas_label_postponed_ent;
architecture bh of csas_label_postponed_ent is
begin
  lbl_y : postponed y <= a;
end architecture bh;
