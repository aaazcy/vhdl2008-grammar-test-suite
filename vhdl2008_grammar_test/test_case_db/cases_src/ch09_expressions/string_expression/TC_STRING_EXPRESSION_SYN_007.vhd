-- =============================================================
-- Case ID: TC_STRING_EXPRESSION_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_STRING_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.1
-- Production: string_expression ::= expression
-- Case Type: Positive
-- Test Focus: to_string conversion (VHDL 2008): integer'image(val) converts an integer to its string representation
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_str_tostr is
  port (
    num : in  integer;
    y   : out string(1 to 5)
  );
end entity ent_str_tostr;

architecture tostr_conv of ent_str_tostr is
begin
  y <= integer'image(num);
end architecture tostr_conv;
