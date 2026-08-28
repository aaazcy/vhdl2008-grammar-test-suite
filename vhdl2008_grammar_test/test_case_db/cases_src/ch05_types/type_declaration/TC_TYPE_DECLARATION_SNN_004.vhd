-- =============================================================
-- Case ID: TC_TYPE_DECLARATION_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_TYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.2
-- Production: type_declaration ::= full_type_declaration | incomplete_type_declaration
-- Case Type: Negative
-- Test Focus: syntax error -- type declaration missing definition after name
-- Expected Result: Triggers
-- Dependencies: None
-- =============================================================
entity td_snn_no_def is end entity;
architecture rtl of td_snn_no_def is
  type t_bad;  -- ERROR: incomplete, no definition
begin end architecture;