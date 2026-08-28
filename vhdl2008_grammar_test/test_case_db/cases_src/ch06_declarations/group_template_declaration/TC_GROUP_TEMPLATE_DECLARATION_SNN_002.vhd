-- =============================================================
-- Case ID: TC_GROUP_TEMPLATE_DECLARATION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_GROUP_TEMPLATE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.9
-- Production: group_template_declaration ::= group identifier is ( entity_class_entry_list ) ;
-- Case Type: Negative
-- Test Focus: group_template_declaration: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity group_template_e2 is end entity;
architecture bh of group_template_e2 is
  -- ERROR: invalid syntax in group_template_declaration
  signal s : bit;
begin
  s <= '1'
end architecture bh;