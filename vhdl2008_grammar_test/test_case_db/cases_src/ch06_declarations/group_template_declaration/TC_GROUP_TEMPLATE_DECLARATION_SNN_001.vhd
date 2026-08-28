-- =============================================================
-- Case ID: TC_GROUP_TEMPLATE_DECLARATION_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_GROUP_TEMPLATE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.9
-- Production: group_template_declaration ::= group identifier is ( entity_class_entry_list ) ;
-- Case Type: Negative
-- Test Focus: group_template_declaration: missing 'is' keyword
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity gtd_missing_is_err is
  port (
    flag : out bit
  );
end entity gtd_missing_is_err;

architecture snerr of gtd_missing_is_err is
  -- ERROR: missing 'is' keyword — required by BNF between identifier and (
  group broken (signal <>, constant <>);
  signal s_x : bit := '0';
  constant C_Y : bit := '1';
begin
  flag <= '0';
end architecture snerr;
