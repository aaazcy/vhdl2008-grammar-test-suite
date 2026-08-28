-- =============================================================
-- Case ID: TC_CONCURRENT_SIGNAL_ASSIGNMENT_STATEMENT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_SIGNAL_ASSIGNMENT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.6
-- Production: concurrent_signal_assignment_statement ::= [ label : ] [ postponed ] concurrent_simple_signal_assignment | [ label : ] [ postponed ] concurrent_conditional_signal_assignment | [ label : ] [ postponed ] concurrent_selected_signal_assignment
-- Case Type: Positive
-- Test Focus: selected alternative——`with sel select y <= a when '0', b when '1';` verifies forming a concurrent signal assignment via the selected alternative
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity csas_sel_ent is
  port(a, b, sel : in bit; y : out bit);
end entity csas_sel_ent;
architecture bh of csas_sel_ent is
begin
  with sel select
    y <= a when '0',
         b when '1';
end architecture bh;
