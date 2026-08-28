-- =============================================================
-- Case ID: TC_GROUP_DECLARATION_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_GROUP_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.9
-- Production: group_declaration ::= group identifier : group_template_name ( group_constituent_list ) ;
-- Case Type: Negative
-- Test Focus: group_declaration: missing colon between identifier and template name
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity gd_missing_colon_err is
  port (
    flag : out bit
  );
end entity gd_missing_colon_err;

architecture snerr of gd_missing_colon_err is
  group single_entry is (signal <>);
  signal s_x : bit := '0';
  -- ERROR: missing colon ':' between identifier and template name
  group broken single_entry (s_x);
begin
  flag <= '0';
end architecture snerr;
