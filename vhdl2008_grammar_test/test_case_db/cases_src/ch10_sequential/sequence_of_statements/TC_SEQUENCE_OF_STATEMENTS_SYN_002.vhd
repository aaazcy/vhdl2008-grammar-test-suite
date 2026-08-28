-- =============================================================
-- Case ID: TC_SEQUENCE_OF_STATEMENTS_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SEQUENCE_OF_STATEMENTS
-- Standard Reference: IEEE 1076-2008 Section 10.1
-- Production: sequence_of_statements ::= { sequential_statement }
-- Case Type: Positive
-- Test Focus: Single sequential_statement: only one signal assignment `y<=a` in the process body, verifying that a single-statement sequence is legal
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sos_syn2_ent is port(a:in integer; y:out integer); end entity;
architecture bh of sos_syn2_ent is
begin
  process(a) is
  begin
    y <= a;
  end process;
end architecture bh;
