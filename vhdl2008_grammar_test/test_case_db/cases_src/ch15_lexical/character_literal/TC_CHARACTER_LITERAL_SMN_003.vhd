-- =============================================================
-- Case ID: TC_CHARACTER_LITERAL_SMN_003
-- Rule Type: Semantic
-- Related Rule ID: BNF_CHARACTER_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.6
-- Production: character_literal ::= ' graphic_character '
-- Case Type: Negative
-- Test Focus: SEM: character literal used in an integer context — in constant C_BAD : integer := 'x' the 'x' is a character type literal, mismatching the integer type
-- Expected Result: Triggers analysis error: can't match character literal 'x' with type integer
-- Dependencies: None
-- =============================================================
entity cl_char_for_int is
  port (
    bad_val : out integer
  );
end entity cl_char_for_int;

architecture vhdl2008 of cl_char_for_int is
  constant C_BAD : integer := 'x';
begin
  bad_val <= 0;
end architecture vhdl2008;
