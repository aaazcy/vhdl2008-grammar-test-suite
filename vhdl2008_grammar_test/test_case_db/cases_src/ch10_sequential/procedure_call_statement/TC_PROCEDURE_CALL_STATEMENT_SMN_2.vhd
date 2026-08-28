-- =============================================================
-- Case ID: TC_PROCEDURE_CALL_STATEMENT_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_023
-- Standard Reference: IEEE 1076-2008 Section 10.4
-- Rule Description: Actual parameter count must match formal parameter count
-- Case Type: Negative
-- Error Category: argument_error
-- Test Focus: SEM: procedure_call_statement call passes 1 fewer actual parameter than the formals — violating SEM_SEQ_023
-- Expected Result: Triggers semantic error: parameter count mismatch
-- Dependencies: None
-- =============================================================
entity proc_stmt_count_err_ent is
  port (x : in integer; y : out integer);
end entity proc_stmt_count_err_ent;

architecture sem of proc_stmt_count_err_ent is
  procedure multiply(a, b : in integer; signal res : out integer) is
  begin
    res <= a * b;
  end procedure;
begin
  process(x) is
  begin
    multiply(x, y);  -- ERROR: 2 actuals for 3 formals
  end process;
end architecture sem;
