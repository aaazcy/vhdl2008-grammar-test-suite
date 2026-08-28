-- =============================================================
-- Case ID: TC_CHARACTER_LITERAL_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CHARACTER_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.6
-- Production: character_literal ::= ' graphic_character '
-- Case Type: Negative
-- Test Focus: character_literal with empty single quotes('') — the graphic_character segment is missing, two consecutive single quotes are not a legal character literal (they are actually part of attribute syntax such as 'event): verify the parser reports an empty character literal error
-- Expected Result: Triggers syntax error on empty character literal
-- Dependencies: None
-- =============================================================
entity cl_empty is
  port (
    bad_val : out character
  );
end entity cl_empty;

architecture rtl of cl_empty is
  constant C_BAD : character := '';
begin
  bad_val <= C_BAD;
end architecture rtl;
