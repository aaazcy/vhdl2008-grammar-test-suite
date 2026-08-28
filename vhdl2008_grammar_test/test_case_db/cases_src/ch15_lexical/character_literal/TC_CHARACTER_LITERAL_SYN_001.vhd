-- =============================================================
-- Case ID: TC_CHARACTER_LITERAL_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CHARACTER_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.6
-- Production: character_literal ::= ' graphic_character '
-- Case Type: Positive
-- Test Focus: character_literal basic letter forms('A', 'Z') — graphic_character (uppercase letters) enclosed in single quotes as character_literal, verify the syntax of character literals in enumeration literals
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cl_letter_literals is
  port (
    first : out character;
    last  : out character
  );
end entity cl_letter_literals;

architecture rtl of cl_letter_literals is
begin
  first <= 'A';
  last  <= 'Z';
end architecture rtl;
