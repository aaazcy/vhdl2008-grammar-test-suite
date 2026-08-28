-- =============================================================
-- Case ID: TC_STRING_EXPRESSION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_STRING_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.1
-- Production: string_expression ::= expression
-- Case Type: Positive
-- Test Focus: minimal form: string literal as a string expression — the "hello" literal is used directly in a constant declaration, verifying the minimal string expression
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_str_lit is
  port (
    y : out string(1 to 5)
  );
end entity ent_str_lit;

architecture simple_str of ent_str_lit is
  constant C_GREET : string(1 to 5) := "hello";
begin
  y <= C_GREET;
end architecture simple_str;
