-- =============================================================
-- Case ID: TC_PROCEDURE_CALL_STATEMENT_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_024
-- Standard Reference: IEEE 1076-2008 Section 10.4
-- Rule Description: Actual parameter types must be compatible — negative variant
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SMN: boolean actual passed to integer formal — parameter passing with completely incompatible types, violating SEM_SEQ_024
-- Expected Result: Triggers semantic error: type mismatch in parameter association
-- Dependencies: None
-- =============================================================
entity proc_stmt_type_err_ent is
  port (flag : in boolean; done : out boolean);
end entity proc_stmt_type_err_ent;

architecture smn of proc_stmt_type_err_ent is
  procedure store_int(val : in integer) is
  begin
    done <= (val > 0);
  end procedure;
begin
  process(flag) is
  begin
    store_int(flag);  -- ERROR: boolean passed where integer expected
  end process;
end architecture smn;
