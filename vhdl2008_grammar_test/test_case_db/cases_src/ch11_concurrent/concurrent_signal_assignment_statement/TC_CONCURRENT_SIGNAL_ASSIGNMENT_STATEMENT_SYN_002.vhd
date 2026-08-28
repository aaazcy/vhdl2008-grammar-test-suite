-- =============================================================
-- Case ID: TC_CONCURRENT_SIGNAL_ASSIGNMENT_STATEMENT_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_SIGNAL_ASSIGNMENT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.6
-- Production: concurrent_signal_assignment_statement ::= [ label : ] [ postponed ] concurrent_simple_signal_assignment | [ label : ] [ postponed ] concurrent_conditional_signal_assignment | [ label : ] [ postponed ] concurrent_selected_signal_assignment
-- Case Type: Positive
-- Test Focus: Minimal simple form——`y <= a and b;` a simple concurrent signal assignment with no label and no postponed, verifying the minimal legal form of concurrent_signal_assignment_statement via the simple alternative
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity csas_simple_ent is
  port(a, b : in bit; y : out bit);
end entity csas_simple_ent;
architecture bh of csas_simple_ent is
begin
  y <= a and b;
end architecture bh;
