-- =============================================================
-- Case ID: TC_STRING_EXPRESSION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_STRING_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.1
-- Production: string_expression ::= expression
-- Case Type: Negative
-- Test Focus: SNN: empty string literal — "" used as an expression without a specified constraint and context
-- Expected Result: Triggers error: cannot determine string bounds from empty string literal
-- Dependencies: None
-- =============================================================

entity ent_str_snn_002 is
  port (y : out string(1 to 1));
end entity ent_str_snn_002;

architecture empty_str of ent_str_snn_002 is
begin
  -- ERROR: Empty string literal has undetermined bounds
  y <= "";
end architecture empty_str;
