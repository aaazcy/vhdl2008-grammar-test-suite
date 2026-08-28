-- =============================================================
-- Case ID: TC_STRING_LITERAL_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_STRING_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.7
-- Production: string_literal ::= " { graphic_character } "
-- Case Type: Negative
-- Test Focus: SMN: character literal used for a string type target — in constant C_BAD : string := 'x' the 'x' is a character literal, mismatching the string type
-- Expected Result: Triggers analysis error: can't match character literal 'x' with type array type "string"
-- Dependencies: None
-- =============================================================
entity str_char_literal is
  port (
    bv_out : out string(1 to 2)
  );
end entity str_char_literal;

architecture vhdl2008 of str_char_literal is
  constant C_BAD : string := 'x';
begin
  bv_out <= "00";
end architecture vhdl2008;
