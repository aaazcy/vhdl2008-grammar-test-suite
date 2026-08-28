-- =============================================================
-- Case ID: TC_GROUP_DECLARATION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_GROUP_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.9
-- Production: group_declaration ::= group identifier : group_template_name ( group_constituent_list ) ;
-- Case Type: Negative
-- Test Focus: group_declaration: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity group_declarati_e3 is end entity;
architecture bh of group_declarati_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;