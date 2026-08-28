-- =============================================================
-- Case ID: TC_SEQUENCE_OF_STATEMENTS_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SEQUENCE_OF_STATEMENTS
-- Standard Reference: IEEE 1076-2008 Section 10.1
-- Production: sequence_of_statements ::= { sequential_statement }
-- Case Type: Positive
-- Test Focus: Empty sequence_of_statements: process body is empty (no statements), verifying that zero sequential_statements is legal
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sos_syn1_ent is end entity;
architecture bh of sos_syn1_ent is
begin
  process is
  begin
    wait;
  end process;
end architecture bh;
