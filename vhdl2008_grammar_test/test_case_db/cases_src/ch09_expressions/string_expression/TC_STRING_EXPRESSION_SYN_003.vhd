-- =============================================================
-- Case ID: TC_STRING_EXPRESSION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_STRING_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.1
-- Production: string_expression ::= expression
-- Case Type: Positive
-- Test Focus: string attribute 'IMAGE: integer'image(val) returns the string representation of an integer value, verifying an expression whose attribute function returns string
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_str_image is
  port (
    val : in  integer;
    y   : out string(1 to 10)
  );
end entity ent_str_image;

architecture attr_str of ent_str_image is
begin
  y <= integer'image(val);
end architecture attr_str;
