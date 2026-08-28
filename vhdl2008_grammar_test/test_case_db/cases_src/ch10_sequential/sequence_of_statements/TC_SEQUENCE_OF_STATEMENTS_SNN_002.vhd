-- =============================================================
-- Case ID: TC_SEQUENCE_OF_STATEMENTS_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SEQUENCE_OF_STATEMENTS
-- Standard Reference: IEEE 1076-2008 Section 10.1
-- Production: sequence_of_statements ::= { sequential_statement }
-- Case Type: Negative
-- Test Focus: SNN: illegal statement in a sequence — `123;` a numeric literal is not a valid sequential_statement
-- Expected Result: Triggers syntax error: unexpected integer literal in statement position
-- Dependencies: None
-- =============================================================
entity sos_snn2_ent is port(y:out integer); end entity;
architecture bh of sos_snn2_ent is
begin
  process is
  begin
    123;
    y <= 1;
    wait;
  end process;
end architecture bh;
