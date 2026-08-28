-- =============================================================
-- Case ID: TC_GROUP_TEMPLATE_DECLARATION_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_GROUP_TEMPLATE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.9
-- Production: group_template_declaration ::= group identifier is ( entity_class_entry_list ) ;
-- Case Type: Negative
-- Test Focus: group_template_declaration: invalid entity class keyword (typo: 'signals' instead of 'signal')
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity gtd_bad_class_keyword_err is
  port (
    flag : out bit
  );
end entity gtd_bad_class_keyword_err;

architecture snerr of gtd_bad_class_keyword_err is
  -- ERROR: 'signals' is not a valid entity class — should be 'signal'
  group broken is (signals <>, constant <>);
  signal s_x : bit := '0';
  constant C_Y : bit := '1';
begin
  flag <= '0';
end architecture snerr;
