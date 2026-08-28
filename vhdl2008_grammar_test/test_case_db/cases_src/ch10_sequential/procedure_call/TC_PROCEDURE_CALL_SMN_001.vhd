-- =============================================================
-- Case ID: TC_PROCEDURE_CALL_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_023
-- Standard Reference: IEEE 1076-2008 Section 10.4
-- Rule Description: Actual parameter count must match formal parameter count
-- Case Type: Negative
-- Error Category: argument_error
-- Test Focus: SEM: actual parameter count mismatch — 3 actuals passed at the call site but the procedure has only 2 formal parameters, violating SEM_SEQ_023
-- Expected Result: Triggers semantic error: parameter count mismatch
-- Dependencies: None
-- =============================================================
entity proc_call_count_err_ent is
  port (a, b : in integer; c : out integer);
end entity proc_call_count_err_ent;

architecture sem of proc_call_count_err_ent is
  procedure calc(p1, p2 : in integer; signal res : out integer) is
  begin
    res <= p1 * p2;
  end procedure;
begin
  process(a, b) is
  begin
    calc(a, b, a, c);  -- ERROR: 4 actuals for 3 formals
  end process;
end architecture sem;
