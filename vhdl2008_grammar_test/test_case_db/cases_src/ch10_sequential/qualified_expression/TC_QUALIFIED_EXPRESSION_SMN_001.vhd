-- =============================================================
-- Case ID: TC_QUALIFIED_EXPRESSION_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_QUAL_EXPR_TYPE
-- Standard Reference: IEEE 1076-2008 Section 9.3.6
-- Rule Description: Qualified expression type_mark must match the expression type
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SEM: type_mark and expression type mismatch - real qualified as integer type
-- Expected Result: Triggers semantic error: qualified expression type mismatch
-- Dependencies: None
-- =============================================================
entity qual_expr_sem1_ent is port(y:out integer); end entity;
architecture bh of qual_expr_sem1_ent is
  type t_int is range 0 to 100;
  signal s:t_int;
begin
  s <= t_int'(3.14);
  y<=integer(s);
end architecture bh;
