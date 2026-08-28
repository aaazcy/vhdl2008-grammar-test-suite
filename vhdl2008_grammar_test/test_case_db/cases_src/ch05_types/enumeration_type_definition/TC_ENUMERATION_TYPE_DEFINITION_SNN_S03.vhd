-- =============================================================
-- Case ID: TC_ENUMERATION_TYPE_DEFINITION_SNN_S03
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENUMERATION_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.2
-- Production: enumeration_type_definition ::= ( enumeration_literal { , enumeration_literal } )
-- Case Type: Negative
-- Test Focus: Missing opening parenthesis before the first enumeration_literal -- the BNF requires the entire list of literals to be enclosed in parentheses; omitting the opening '(' causes the first identifier to be parsed as something other than the start of an enumeration_type_definition, triggering a syntax error
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity enum_missopen_ent is end entity;
architecture bh of enum_missopen_ent is
  type t_bad is RED, GREEN, BLUE);  -- ERROR: missing opening (
  signal s : t_bad;
begin
end architecture bh;
