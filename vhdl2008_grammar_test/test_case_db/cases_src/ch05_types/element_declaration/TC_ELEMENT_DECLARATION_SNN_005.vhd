-- =============================================================
-- Case ID: TC_ELEMENT_DECLARATION_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.3
-- Production: element_declaration ::= identifier_list : element_subtype_definition ;
-- Case Type: Negative
-- Test Focus: syntax error -- element_declaration with empty identifier_list
-- Expected Result: Triggers
-- Dependencies: None
-- =============================================================
entity ed_snn_empty is end entity;
architecture rtl of ed_snn_empty is
  type t_bad is record : integer; end record;  -- ERROR: empty identifier list
begin end architecture;