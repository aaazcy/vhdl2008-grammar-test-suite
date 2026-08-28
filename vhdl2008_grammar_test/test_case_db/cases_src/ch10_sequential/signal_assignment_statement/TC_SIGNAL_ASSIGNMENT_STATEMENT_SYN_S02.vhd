-- =============================================================
-- Case ID: TC_SIGNAL_ASSIGNMENT_STATEMENT_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGNAL_ASSIGNMENT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: signal_assignment_statement ::= [ label : ] simple_signal_assignment | conditional_signal_assignment | selected_signal_assignment
-- Case Type: Positive
-- Test Focus: selected signal assignment (with-select)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sas_spc2_ent is port(sel:in integer range 0 to 2; a,b,c:in bit; y:out bit); end entity;
architecture bh of sas_spc2_ent is begin
  with sel select y<=a when 0, b when 1, c when 2;
end architecture bh;
