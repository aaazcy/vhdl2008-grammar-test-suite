-- =============================================================
-- Case ID: TC_SIGNAL_ASSIGNMENT_STATEMENT_SYN_S03
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGNAL_ASSIGNMENT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: signal_assignment_statement ::= [ label : ] simple_signal_assignment | conditional_signal_assignment | selected_signal_assignment
-- Case Type: Positive
-- Test Focus: signal assignment with after delay (waveform)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sas_spc3_ent is port(a:in bit; y:out bit); end entity;
architecture bh of sas_spc3_ent is
  signal s:bit;
begin
  s<= '0', '1' after 5 ns, '0' after 10 ns;
  y<= transport a after 2 ns;
end architecture bh;
