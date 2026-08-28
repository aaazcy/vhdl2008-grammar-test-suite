-- =============================================================
-- Case ID: TC_CONCURRENT_STATEMENT_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_CONC_STMT_OP
-- Standard Reference: IEEE 1076-2008 Section 11.1
-- Rule Description: Concurrent statements must be type-correct
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SMN: operand type mismatch in a concurrent statement——in y <= 1 + true, the left side of + is integer and the right side is boolean; no matching overload exists
-- Expected Result: Triggers analysis error: no function declarations for operator "+"
-- Dependencies: None
-- =============================================================
entity conc_stmt_op_mix is port(y:out integer); end entity;
architecture vhdl2008 of conc_stmt_op_mix is
begin
  y <= 1 + true;
end architecture vhdl2008;
