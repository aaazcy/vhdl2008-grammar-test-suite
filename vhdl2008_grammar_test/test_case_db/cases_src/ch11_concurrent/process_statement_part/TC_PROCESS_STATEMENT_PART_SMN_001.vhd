-- =============================================================
-- Case ID: TC_PROCESS_STATEMENT_PART_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_PROC_STMT_TYPE
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Rule Description: Statements in a process statement part must be type-correct
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SMN: assignment type mismatch in the process statement part——in y <= true, true is of boolean type and mismatches the integer type output port y
-- Expected Result: Triggers analysis error: can't match "true" with type integer
-- Dependencies: None
-- =============================================================
entity proc_stmt_type_err is port(y:out integer); end entity;
architecture vhdl2008 of proc_stmt_type_err is
begin
  process is
  begin
    y <= true;
    wait;
  end process;
end architecture vhdl2008;
