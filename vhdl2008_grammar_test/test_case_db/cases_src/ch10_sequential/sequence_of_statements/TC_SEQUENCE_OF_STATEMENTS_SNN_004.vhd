-- =============================================================
-- Case ID: TC_SEQUENCE_OF_STATEMENTS_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SEQUENCE_OF_STATEMENTS
-- Standard Reference: IEEE 1076-2008 Section 10.1
-- Production: sequence_of_statements ::= { sequential_statement }
-- Case Type: Negative
-- Test Focus: SNN: declaration statement in the executable part — in a process body `type t is range 0 to 7;` cannot declare a type in the statement part
-- Expected Result: Triggers syntax error: declaration not allowed in statement part
-- Dependencies: None
-- =============================================================
entity sos_snn4_ent is port(y:out integer); end entity;
architecture bh of sos_snn4_ent is
begin
  process is
  begin
    type t is range 0 to 7;
    y <= 1;
    wait;
  end process;
end architecture bh;
