-- =============================================================
-- Case ID: TC_ENUMERATION_TYPE_DEFINITION_SNN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENUMERATION_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.2
-- Production: enumeration_type_definition ::= ( enumeration_literal { , enumeration_literal } )
-- Case Type: Negative
-- Test Focus: Missing comma between two adjacent enumeration_literals -- the BNF mandates a comma separator between each pair of literals in the { , enumeration_literal } repetition; omitting the comma creates a sequence of two identifiers where a single enumeration_literal is expected, breaking the grammar at that point
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity enum_misscomma_ent is end entity;
architecture bh of enum_misscomma_ent is
  type t_bad is (RED GREEN BLUE);  -- ERROR: missing commas
  signal s : t_bad;
begin
end architecture bh;
