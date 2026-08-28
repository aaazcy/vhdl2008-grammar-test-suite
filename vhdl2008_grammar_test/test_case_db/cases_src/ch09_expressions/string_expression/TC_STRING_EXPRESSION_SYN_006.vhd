-- =============================================================
-- Case ID: TC_STRING_EXPRESSION_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_STRING_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.1
-- Production: string_expression ::= expression
-- Case Type: Positive
-- Test Focus: string constant: a string literal is used in a constant declaration, and the string expression serves as the constant initialization expression
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_str_const is
  port (
    y : out string(1 to 7)
  );
end entity ent_str_const;

architecture const_str of ent_str_const is
  constant C_PREFIX : string(1 to 3) := "ID_";
  constant C_NAME   : string(1 to 4) := "CTRL";
begin
  y <= C_PREFIX & C_NAME;
end architecture const_str;
