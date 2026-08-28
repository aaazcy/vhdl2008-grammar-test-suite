-- =============================================================
-- Case ID: TC_TYPE_DECLARATION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_TYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.2
-- Production: type_declaration ::= full_type_declaration | incomplete_type_declaration
-- Case Type: Negative
-- Test Focus: syntax error -- type declaration with 'is' keyword in wrong position
-- Expected Result: Triggers
-- Dependencies: None
-- =============================================================
entity td_snn_wrong_kw is end entity;
architecture rtl of td_snn_wrong_kw is
  type is t_bad range 0 to 7;  -- ERROR: 'is' before type name
begin end architecture;