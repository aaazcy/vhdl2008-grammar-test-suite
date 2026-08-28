-- =============================================================
-- Case ID: TC_STRING_EXPRESSION_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_STRING_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.1
-- Production: string_expression ::= expression
-- Case Type: Negative
-- Test Focus: SNN: non-string expression used in a string context — an integer signal is assigned to a string port, and the types are incompatible
-- Expected Result: Triggers type error: cannot assign integer to string target
-- Dependencies: None
-- =============================================================

entity ent_str_snn_001 is
  port (val : in integer);
end entity ent_str_snn_001;

architecture non_str of ent_str_snn_001 is
  signal s : string(1 to 4);
begin
  -- ERROR: Integer cannot be assigned to string type
  s <= val;
end architecture non_str;
