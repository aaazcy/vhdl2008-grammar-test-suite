-- =============================================================
-- Case ID: TC_SEQUENTIAL_STATEMENT_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_STMT_CONTEXT
-- Standard Reference: IEEE 1076-2008 Section 10.1
-- Rule Description: wait statement only allowed in process, not in function/procedure body
-- Case Type: Negative
-- Error Category: context_error
-- Test Focus: SEM: wait statement inside function body
-- Expected Result: Triggers semantic error: wait not allowed in function
-- Dependencies: None
-- =============================================================
entity seq_stmt_sem1_ent is port(y:out integer); end entity;
architecture bh of seq_stmt_sem1_ent is
  function f_bad return integer is
  begin
    wait for 1 ns;
    return 0;
  end function;
begin
  y<=f_bad;
end architecture bh;
