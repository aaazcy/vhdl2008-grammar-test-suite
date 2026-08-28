-- =============================================================
-- Case ID: TC_CONDITIONAL_EXPRESSIONS_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_EXPRESSIONS
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: conditional_expressions ::= expression when condition { else expression when condition } [ else expression ]
-- Case Type: Negative
-- Test Focus: SNN: missing "when" keyword — in y <= a sel='1' else b the when separator is missing before the condition
-- Expected Result: Triggers syntax error: missing 'when' keyword in conditional expression
-- Dependencies: None
-- =============================================================

entity ent_ce_snn_001 is
  port (sel : in bit; a, b : in integer);
end entity ent_ce_snn_001;

architecture miss_when of ent_ce_snn_001 is
  signal y : integer;
begin
  -- ERROR: Missing 'when' keyword before condition
  y <= a sel = '1' else b;
end architecture miss_when;
