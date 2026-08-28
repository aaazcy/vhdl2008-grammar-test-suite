-- =============================================================
-- Case ID: TC_SEM_GROUP_TEMPLATE_DECLARATION_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_GROUP_TEMPLATE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.9
-- Production: group_template_declaration ::= group identifier is ( entity_class_entry_list ) ;
-- Case Type: Negative
-- Test Focus: group_template_declaration: duplicate template identifier — same name already declared
-- Expected Result: Triggers semantic error (duplicate declaration)
-- Dependencies: None
-- =============================================================
entity gtd_duplicate_name_sem is
  port (
    flag : out bit
  );
end entity gtd_duplicate_name_sem;

architecture semerr of gtd_duplicate_name_sem is
  group bus_tmpl is (signal <>, signal <>);
  -- ERROR: duplicate group template identifier 'bus_tmpl'
  group bus_tmpl is (constant <>, constant <>);
  signal s_x : bit := '0';
  signal s_y : bit := '0';
begin
  flag <= '0';
end architecture semerr;
