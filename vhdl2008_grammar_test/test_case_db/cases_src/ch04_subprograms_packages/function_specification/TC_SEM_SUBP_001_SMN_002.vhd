-- =============================================================
-- Case ID: TC_SEM_SUBP_001_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_SUBP_001
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Rule Description: A return statement in a function must carry an expression of the return type
-- Case Type: Negative
-- Error Category: missing_return_expression
-- Test Focus: Function f_noexpr has a bare return statement without any expression, although a function return statement must supply the function result value
-- Expected Result: Triggers semantic error: return in a function must have an expression
-- Dependencies: None
-- =============================================================
entity sem_subp2_ent is port(r:out integer); end entity;
architecture bh of sem_subp2_ent is
  function f_noexpr return integer is
  begin
    return;
  end function;
begin
  r <= f_noexpr;
end architecture bh;
