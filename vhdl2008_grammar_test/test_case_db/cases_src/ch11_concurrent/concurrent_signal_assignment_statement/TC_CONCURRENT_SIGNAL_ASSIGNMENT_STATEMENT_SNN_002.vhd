-- =============================================================
-- Case ID: TC_CONCURRENT_SIGNAL_ASSIGNMENT_STATEMENT_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_SIGNAL_ASSIGNMENT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.6
-- Production: concurrent_signal_assignment_statement ::= [ label : ] [ postponed ] concurrent_simple_signal_assignment [ label : ] [ postponed ] concurrent_conditional_signal_assignment | [ label : ] [ postponed ] concurrent_selected_signal_assignment
-- Case Type: Negative
-- Test Focus: concurrent_signal_assignment_statement: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity concurrent_sign_e2 is end entity;
architecture bh of concurrent_sign_e2 is
  -- ERROR: invalid syntax in concurrent_signal_assignment_statement
  signal s : bit;
begin
  s <= '1'
end architecture bh;