-- =============================================================
-- Case ID: TC_SEQUENCE_OF_STATEMENTS_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SMN_SOS_VAR_OP
-- Standard Reference: IEEE 1076-2008 Section 10.1
-- Production: sequence_of_statements ::= { sequential_statement }
-- Case Type: Negative
-- Test Focus: SMN: operator type mismatch in a variable assignment in the statement sequence — in v := a + true, + has integer on the left and boolean on the right, no matching overload exists
-- Expected Result: Triggers analysis error: no function declarations for operator "+"
-- Dependencies: None
-- =============================================================
entity sos_var_op_err is port(a:in integer; y:out integer); end entity;
architecture vhdl2008 of sos_var_op_err is
begin
  process(a) is
    variable v : integer := 0;
  begin
    v := a + true;
    y <= v;
  end process;
end architecture vhdl2008;
