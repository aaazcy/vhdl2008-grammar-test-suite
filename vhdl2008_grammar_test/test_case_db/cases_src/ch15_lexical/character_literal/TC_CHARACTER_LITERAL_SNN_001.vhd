-- =============================================================
-- Case ID: TC_CHARACTER_LITERAL_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CHARACTER_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.6
-- Production: character_literal ::= ' graphic_character '
-- Case Type: Negative
-- Test Focus: character_literal missing the closing single quote('A) — a graphic_character follows the left single quote but the right single quote is missing, verify the lexical analyzer/parser reports an unterminated character literal error
-- Expected Result: Triggers syntax error on unclosed character literal
-- Dependencies: None
-- =============================================================
entity cl_unclosed is
  port (
    bad_val : out character
  );
end entity cl_unclosed;

architecture rtl of cl_unclosed is
  constant C_BAD : character := 'A;
begin
  bad_val <= C_BAD;
end architecture rtl;
