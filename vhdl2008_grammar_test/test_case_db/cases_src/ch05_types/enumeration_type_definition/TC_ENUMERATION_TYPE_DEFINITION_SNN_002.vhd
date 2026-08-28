-- =============================================================
-- Case ID: TC_ENUMERATION_TYPE_DEFINITION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENUMERATION_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.2
-- Production: enumeration_type_definition ::= ( enumeration_literal { , enumeration_literal } )
-- Case Type: Negative
-- Test Focus: Empty enum list () -- the parenthesized form requires at least one enumeration_literal; an empty list violates the BNF production by providing zero enumeration_literal where at least one is mandated
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity enum_empty_ent is end entity;
architecture bh of enum_empty_ent is
  type t_bad is ();  -- ERROR: empty enumeration list
  signal s : t_bad;
begin
end architecture bh;
