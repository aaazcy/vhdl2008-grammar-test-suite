-- =============================================================
-- Case ID: TC_SUBPROGRAM_STATEMENT_PART_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Production: subprogram_statement_part ::= { sequential_statement }
-- Case Type: Negative
-- Test Focus: subprogram_statement_part: return with expression in a procedure — the return statement of procedure p_ret carries the expression 1, but a procedure return statement must not supply a result value
-- Expected Result: Triggers semantic error: return in a procedure can't have an expression
-- Dependencies: None
-- =============================================================
entity ssp_ret_ent is port(y:out bit); end entity;
architecture bh of ssp_ret_ent is
  procedure p_ret is
  begin
    return 1;
  end procedure;
begin
  p_ret;
  y <= '1';
end architecture bh;
