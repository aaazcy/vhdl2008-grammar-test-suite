-- =============================================================
-- Case ID: TC_SEQUENCE_OF_STATEMENTS_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SEQUENCE_OF_STATEMENTS
-- Standard Reference: IEEE 1076-2008 Section 10.1
-- Production: sequence_of_statements ::= { sequential_statement }
-- Case Type: Positive
-- Test Focus: Two-statement seq with variable assignment + signal assignment: first the variable assignment computes a temporary value, then the signal assignment outputs, verifying sequential execution
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sos_syn3_ent is port(a,b:in integer; y:out integer); end entity;
architecture bh of sos_syn3_ent is
begin
  process(a,b) is
    variable v_tmp : integer;
  begin
    v_tmp := a + b;
    y <= v_tmp;
  end process;
end architecture bh;
