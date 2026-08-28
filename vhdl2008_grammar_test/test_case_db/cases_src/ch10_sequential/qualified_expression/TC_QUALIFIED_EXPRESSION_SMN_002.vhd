-- =============================================================
-- Case ID: TC_QUALIFIED_EXPRESSION_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_QUAL_EXPR_RANGE
-- Standard Reference: IEEE 1076-2008 Section 9.3.6
-- Production: qualified_expression ::= type_mark ' ( expression ) | type_mark ' aggregate
-- Case Type: Negative
-- Test Focus: SEM: qualified expression value out of range — expression value 300 exceeds subtype range 0 to 255
-- Expected Result: Triggers semantic error: value out of range for qualified expression
-- Dependencies: None
-- =============================================================
entity qual_expr_sem2_ent is port(y:out integer); end entity;
architecture bh of qual_expr_sem2_ent is
  subtype t_byte is integer range 0 to 255;
  signal s:t_byte;
begin
  s <= t_byte'(300);
  y<=integer(s);
end architecture bh;
