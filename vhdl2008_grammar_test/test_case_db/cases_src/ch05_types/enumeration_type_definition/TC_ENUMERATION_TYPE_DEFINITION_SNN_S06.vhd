-- =============================================================
-- Case ID: TC_ENUMERATION_TYPE_DEFINITION_SNN_S06
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENUMERATION_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.2
-- Production: enumeration_type_definition ::= ( enumeration_literal { , enumeration_literal } )
-- Case Type: Negative
-- Test Focus: Double comma between enumeration_literals producing an empty position -- consecutive commas (,,) imply a missing enumeration_literal between them; the second comma encounters no preceding literal to satisfy the { , enumeration_literal } pattern, triggering a syntax error
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity enum_dblcomma_ent is end entity;
architecture bh of enum_dblcomma_ent is
  type t_bad is (LOW, , HIGH);  -- ERROR: double comma, missing literal
  signal s : t_bad;
begin
end architecture bh;
