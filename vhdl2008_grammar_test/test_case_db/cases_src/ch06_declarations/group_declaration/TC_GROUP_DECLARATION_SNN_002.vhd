-- =============================================================
-- Case ID: TC_GROUP_DECLARATION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_GROUP_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.9
-- Production: group_declaration ::= group identifier : group_template_name ( group_constituent_list ) ;
-- Case Type: Negative
-- Test Focus: group_declaration: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity group_declarati_e2 is end entity;
architecture bh of group_declarati_e2 is
  -- ERROR: invalid syntax in group_declaration
  signal s : bit;
begin
  s <= '1'
end architecture bh;