-- =============================================================
-- Case ID: TC_GROUP_DECLARATION_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_GROUP_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.9
-- Production: group_declaration ::= group identifier : group_template_name ( group_constituent_list ) ;
-- Case Type: Negative
-- Test Focus: group_declaration: missing parentheses around group_constituent_list
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity gd_missing_parens_err is
  port (
    flag : out bit
  );
end entity gd_missing_parens_err;

architecture snerr of gd_missing_parens_err is
  group pair_tmpl is (signal <>, constant <>);
  signal s_a : bit := '0';
  constant C_B : bit := '1';
  -- ERROR: missing parentheses around group_constituent_list
  group broken : pair_tmpl s_a, C_B;
begin
  flag <= '0';
end architecture snerr;
