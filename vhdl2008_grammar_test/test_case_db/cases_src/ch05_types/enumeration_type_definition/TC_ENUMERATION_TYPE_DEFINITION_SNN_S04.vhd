-- =============================================================
-- Case ID: TC_ENUMERATION_TYPE_DEFINITION_SNN_S04
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENUMERATION_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.2
-- Production: enumeration_type_definition ::= ( enumeration_literal { , enumeration_literal } )
-- Case Type: Negative
-- Test Focus: Trailing comma with no following enumeration_literal -- the { , enumeration_literal } repetition requires a literal to follow each comma; a comma immediately before the closing parenthesis produces an empty position where the grammar expects an enumeration_literal, triggering a syntax error at the closing paren
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity enum_trailcomma_ent is end entity;
architecture bh of enum_trailcomma_ent is
  type t_bad is (RED, GREEN, BLUE,);  -- ERROR: trailing comma
  signal s : t_bad;
begin
end architecture bh;
