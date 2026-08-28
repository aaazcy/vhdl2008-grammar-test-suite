-- =============================================================
-- Case ID: TC_STRING_EXPRESSION_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_STRING_EXPRESSION_OPERATIONS
-- Standard Reference: IEEE 1076-2008 Section 9.1
-- Production: string_expression ::= expression
-- Case Type: Negative
-- Rule Description: String operations like concatenation (&) produce a string whose length equals the sum of operand lengths. Arithmetic operators are not defined for string types.
-- Error Category: Invalid string operation
-- Test Focus: SMN: arithmetic operator used on string — s1 + s2 attempts addition on string types, and arithmetic operators are not defined for string
-- Expected Result: Triggers type error: '+' operator not defined for string type
-- Dependencies: None
-- =============================================================

entity ent_str_smn_002 is
  port (s1 : in string(1 to 3));
end entity ent_str_smn_002;

architecture bad_op of ent_str_smn_002 is
  signal s : string(1 to 6);
  constant C_SUF : string(1 to 3) := "XYZ";
begin
  -- ERROR: '+' operator not defined for string type — use '&'
  s <= s1 + C_SUF;
end architecture bad_op;
