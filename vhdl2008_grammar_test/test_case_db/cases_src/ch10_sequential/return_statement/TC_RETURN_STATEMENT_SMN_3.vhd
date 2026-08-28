-- =============================================================
-- Case ID: TC_RETURN_STATEMENT_SMN_3
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_018
-- Standard Reference: IEEE 1076-2008 Section 10.13
-- Rule Description: RETURN in a procedure must NOT have an expression
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SEM: return in a procedure carrying an expression — violates SEM_SEQ_018, a procedure return must not carry a return value
-- Expected Result: Triggers semantic error: return in procedure must not have expression
-- Dependencies: None
-- =============================================================
entity return_proc_expr_ent is
  port (a : in integer; b : out integer);
end entity return_proc_expr_ent;

architecture sem of return_proc_expr_ent is
  procedure bad_return(signal out_val : out integer) is
  begin
    return 42;  -- ERROR: procedure return cannot have expression
    out_val <= 0;
  end procedure;
begin
  process(a) is
  begin
    bad_return(b);
    b <= a;
  end process;
end architecture sem;
