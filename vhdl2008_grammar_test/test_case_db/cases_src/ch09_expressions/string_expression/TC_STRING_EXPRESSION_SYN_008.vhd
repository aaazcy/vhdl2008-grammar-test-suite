-- =============================================================
-- Case ID: TC_STRING_EXPRESSION_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_STRING_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.1
-- Production: string_expression ::= expression
-- Case Type: Positive
-- Test Focus: comprehensive demonstration: string slicing and concatenation — s(1 to 3) & "-" & s(5 to 7) takes substring slices and concatenates them, verifying string index slicing expressions
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_str_full is
  port (
    s : in  string(1 to 7);
    y : out string(1 to 7)
  );
end entity ent_str_full;

architecture full_str of ent_str_full is
begin
  y <= s(1 to 3) & "-" & s(5 to 7);
end architecture full_str;
