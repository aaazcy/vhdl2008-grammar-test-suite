-- =============================================================
-- Case ID: TC_SEQUENCE_OF_STATEMENTS_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_SOS_STMT_OP
-- Standard Reference: IEEE 1076-2008 Section 10.1
-- Rule Description: Statements in a sequence must be type-correct
-- Case Type: Negative
-- Error Category: type_mismatch
-- Test Focus: SMN: operator type mismatch in the statement sequence — in s_a <= s_a + true, + has integer on the left and boolean on the right, no matching overload exists
-- Expected Result: Triggers analysis error: no function declarations for operator "+"
-- Dependencies: None
-- =============================================================
entity sos_op_type_err is port(y:out integer); end entity;
architecture vhdl2008 of sos_op_type_err is
  signal s_a:integer:=0;
  signal s_b:integer:=0;
begin
  process is
  begin
    s_a <= s_a + true;
    s_b <= s_a;
    y <= s_b;
    wait;
  end process;
end architecture vhdl2008;
