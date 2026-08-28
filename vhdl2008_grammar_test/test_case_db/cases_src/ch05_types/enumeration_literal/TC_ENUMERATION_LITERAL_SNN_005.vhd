-- =============================================================
-- Case ID: TC_ENUMERATION_LITERAL_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENUMERATION_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 5.2.2.1
-- Production: enumeration_literal ::= identifier | character_literal
-- Case Type: Negative
-- Test Focus: Syntax error -- character literal with more than one
--            character between the quotes. A character_literal is
--            exactly one graphic_character between single quotes.
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity enum_lit_snn_multi_char is
end entity enum_lit_snn_multi_char;
architecture rtl of enum_lit_snn_multi_char is
  type t_bad is ('AB', 'C');  -- ERROR: 'AB' is two characters, not a valid char literal
begin
end architecture rtl;
