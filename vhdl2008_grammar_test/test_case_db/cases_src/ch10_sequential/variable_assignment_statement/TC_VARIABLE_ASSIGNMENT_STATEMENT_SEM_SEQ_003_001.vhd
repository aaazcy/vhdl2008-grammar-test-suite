-- =============================================================
-- Case ID: TC_VARIABLE_ASSIGNMENT_STATEMENT_SEM_SEQ_003_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_003
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Rule Description: Target of a variable assignment must be a variable (not a signal or constant)
-- Case Type: Negative
-- Error Category: assignment_driver_violation
-- Test Focus: Counterexample: target s_val is a signal (not a variable), using the := operator to perform variable assignment to a signal, verifying the analyzer raises an error when the target is not a variable
-- Expected Result: Triggers semantic error: target of variable assignment must be a variable
-- Dependencies: None
-- =============================================================
entity vas_sem3_ent is port(a:in integer; y:out integer); end entity;
architecture bh of vas_sem3_ent is
  signal s_val:integer:=0;
  signal s_res:integer:=0;
begin
  process(a) begin
    s_val := a;  -- ERROR: s_val is a signal, not a variable
    s_res <= s_val;
  end process;
  y <= s_res;
end architecture bh;
