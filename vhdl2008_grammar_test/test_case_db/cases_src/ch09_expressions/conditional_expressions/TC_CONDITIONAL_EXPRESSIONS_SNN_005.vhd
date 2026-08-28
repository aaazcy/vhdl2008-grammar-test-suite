-- =============================================================
-- Case ID: TC_CONDITIONAL_EXPRESSIONS_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_EXPRESSIONS
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: conditional_expressions ::= expression when condition { else expression when condition } [ else expression ]
-- Case Type: Negative
-- Test Focus: SNN: wrong keyword order — y <= a else b when cond; when appearing after else violates the syntactic order
-- Expected Result: Triggers syntax error: wrong keyword order — 'when' must precede condition, 'else' separates branches
-- Dependencies: None
-- =============================================================

entity ent_ce_snn_005 is
  port (a, b : in integer; cond : in boolean);
end entity ent_ce_snn_005;

architecture wrong_order of ent_ce_snn_005 is
  signal y : integer;
begin
  -- ERROR: Wrong order — 'when' should come before 'else' in conditional expression
  y <= a else b when cond;
end architecture wrong_order;
