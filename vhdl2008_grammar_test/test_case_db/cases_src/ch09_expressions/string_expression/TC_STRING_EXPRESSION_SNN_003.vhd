-- =============================================================
-- Case ID: TC_STRING_EXPRESSION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_STRING_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.1
-- Production: string_expression ::= expression
-- Case Type: Negative
-- Test Focus: SNN: string length mismatch — a string of length 3 is assigned to a string target of length 5
-- Expected Result: Triggers error: string length mismatch in assignment
-- Dependencies: None
-- =============================================================

entity ent_str_snn_003 is
  port (y : out string(1 to 5));
end entity ent_str_snn_003;

architecture len_mismatch of ent_str_snn_003 is
begin
  -- ERROR: String length mismatch — "abc" is length 3, target expects length 5
  y <= "abc";
end architecture len_mismatch;
