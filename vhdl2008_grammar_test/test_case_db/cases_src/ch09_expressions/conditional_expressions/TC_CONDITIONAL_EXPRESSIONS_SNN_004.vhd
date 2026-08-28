-- =============================================================
-- Case ID: TC_CONDITIONAL_EXPRESSIONS_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_EXPRESSIONS
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: conditional_expressions ::= expression when condition { else expression when condition } [ else expression ]
-- Case Type: Negative
-- Test Focus: SNN: duplicate else — two final else keywords appear in y <= a when c1 else b when c2 else c else d
-- Expected Result: Triggers syntax error: duplicate 'else' — only one final else allowed in conditional expression
-- Dependencies: None
-- =============================================================

entity ent_ce_snn_004 is
  port (a, b, c, d : in integer; c1, c2 : in boolean);
end entity ent_ce_snn_004;

architecture double_else of ent_ce_snn_004 is
  signal y : integer;
begin
  -- ERROR: Double 'else' — only one final else is allowed
  y <= a when c1 else
       b when c2 else
       c else d;
end architecture double_else;
