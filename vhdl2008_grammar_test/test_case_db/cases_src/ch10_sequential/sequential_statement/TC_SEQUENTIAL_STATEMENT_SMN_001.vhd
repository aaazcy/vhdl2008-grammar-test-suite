-- =============================================================
-- Case ID: TC_SEQUENTIAL_STATEMENT_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_SEQ_STMT_RETURN
-- Standard Reference: IEEE 1076-2008 Section 10.1
-- Rule Description: Return statement in procedure must not have expression
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SMN: return with expression in procedure
-- Expected Result: Triggers semantic error: procedure return cannot have expression
-- Dependencies: None
-- =============================================================
entity seq_stmt_smn1_ent is port(y:out integer); end entity;
architecture bh of seq_stmt_smn1_ent is
  procedure p_bad is
  begin
    return 5;
  end procedure;
begin
  process is begin p_bad; y<=0; wait; end process;
end architecture bh;
