-- =============================================================
-- Case ID: TC_CONCURRENT_SIGNAL_ASSIGNMENT_STATEMENT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_SIGNAL_ASSIGNMENT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.6
-- Production: concurrent_signal_assignment_statement ::= [ label : ] [ postponed ] concurrent_simple_signal_assignment | [ label : ] [ postponed ] concurrent_conditional_signal_assignment | [ label : ] [ postponed ] concurrent_selected_signal_assignment
-- Case Type: Positive
-- Test Focus: conditional alternative——`y <= a when sel='1' else b;` verifies forming a concurrent signal assignment via the conditional alternative
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity csas_cond_ent is
  port(a, b, sel : in bit; y : out bit);
end entity csas_cond_ent;
architecture bh of csas_cond_ent is
begin
  y <= a when sel = '1' else b;
end architecture bh;
