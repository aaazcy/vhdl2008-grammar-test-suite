-- =============================================================
-- Case ID: TC_CHARACTER_LITERAL_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CHARACTER_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.6
-- Production: character_literal ::= ' graphic_character '
-- Case Type: Positive
-- Test Focus: character_literal special character forms('=', ';', '&') — special_character class graphic_characters enclosed in single quotes used in character assignment, verify common special characters are legal in character_literal
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cl_special_literals is
  port (
    eq  : out character;
    sc  : out character;
    amp : out character
  );
end entity cl_special_literals;

architecture rtl of cl_special_literals is
begin
  eq  <= '=';
  sc  <= ';';
  amp <= '&';
end architecture rtl;
