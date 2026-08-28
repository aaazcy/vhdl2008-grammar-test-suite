-- =============================================================
-- Case ID: TC_GROUP_TEMPLATE_DECLARATION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_GROUP_TEMPLATE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.9
-- Production: group_template_declaration ::= group identifier is ( entity_class_entry_list ) ;
-- Case Type: Negative
-- Test Focus: group_template_declaration: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity group_template_e3 is end entity;
architecture bh of group_template_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;