-- =============================================================
-- Case ID: TC_SEQUENCE_OF_STATEMENTS_SYN_S01
-- Rule Type: Syntax
-- BNF Production: SEQUENCE_OF_STATEMENTS
-- Standard Reference: IEEE 1076-2008 Section 10.1
-- Test Focus: Sequence of statements: {sequential_statement} — ordered list of sequential statements
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_sequence_of_statements_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_sequence_of_statements_syn_s01 is
  signal s_sos1,s_sos2:integer:=0;
begin
  s_sos1<=1; s_sos2<=2; r<=s_sos1+s_sos2;end architecture bh;
