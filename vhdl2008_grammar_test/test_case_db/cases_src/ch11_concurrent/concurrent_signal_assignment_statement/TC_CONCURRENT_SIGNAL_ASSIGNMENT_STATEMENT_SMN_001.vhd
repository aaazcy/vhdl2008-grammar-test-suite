-- =============================================================
-- Case ID: TC_CONCURRENT_SIGNAL_ASSIGNMENT_STATEMENT_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_CONCURRENT_SIGNAL_ASSIGNMENT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.6
-- Production: concurrent_signal_assignment_statement ::= [ label : ] [ postponed ] concurrent_simple_signal_assignment | [ label : ] [ postponed ] concurrent_conditional_signal_assignment | [ label : ] [ postponed ] concurrent_selected_signal_assignment
-- Rule Description: The target of a concurrent signal assignment must be a signal; assigning to a constant or variable causes a semantic error
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SMN: the assignment target is a constant — in `c <= a;` the target is a constant, not a signal, verifying that the target of a concurrent signal assignment must be a signal
-- Expected Result: Triggers semantic error: target must be a signal
-- Dependencies: None
-- =============================================================
entity csas_smn1_ent is
  port(a : in bit; y : out bit);
end entity csas_smn1_ent;
architecture bh of csas_smn1_ent is
  constant c : bit := '0';
begin
  c <= a;
  y <= c;
end architecture bh;
