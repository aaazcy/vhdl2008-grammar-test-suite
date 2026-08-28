-- =============================================================
-- Case ID: TC_CONDITIONAL_EXPRESSIONS_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_EXPRESSIONS
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: conditional_expressions ::= expression when condition { else expression when condition } [ else expression ]
-- Case Type: Negative
-- Test Focus: SNN: missing condition — in y <= a when else b the condition expression is missing after when
-- Expected Result: Triggers syntax error: missing condition after 'when' in conditional expression
-- Dependencies: None
-- =============================================================

entity ent_ce_snn_002 is
  port (a, b : in integer);
end entity ent_ce_snn_002;

architecture miss_cond of ent_ce_snn_002 is
  signal y : integer;
begin
  -- ERROR: Missing condition after 'when' keyword
  y <= a when else b;
end architecture miss_cond;
