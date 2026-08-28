-- =============================================================
-- Case ID: TC_SEQUENCE_OF_STATEMENTS_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: SEM_SOS_STMT_TYPE
-- Standard Reference: IEEE 1076-2008 Section 10.1
-- Rule Description: Statements in a sequence must be type-correct
-- Case Type: Negative
-- Error Category: type_mismatch
-- Test Focus: SEM: signal assignment type mismatch in the statement sequence — in s_a <= true, true is of boolean type, mismatching the integer signal s_a
-- Expected Result: Triggers analysis error: can't match "true" with type integer
-- Dependencies: None
-- =============================================================
entity sos_stmt_type_err is port(y:out integer); end entity;
architecture vhdl2008 of sos_stmt_type_err is
  signal s_a:integer:=0;
begin
  process is
  begin
    s_a <= true;
    y <= s_a;
    wait;
  end process;
end architecture vhdl2008;
