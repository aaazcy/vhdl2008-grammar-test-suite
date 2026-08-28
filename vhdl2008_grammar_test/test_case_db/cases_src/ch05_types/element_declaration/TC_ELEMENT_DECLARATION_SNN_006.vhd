-- =============================================================
-- Case ID: TC_ELEMENT_DECLARATION_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.3
-- Production: element_declaration ::= identifier_list : element_subtype_definition ;
-- Case Type: Negative
-- Test Focus: syntax error -- element_declaration missing semicolon terminator
-- Expected Result: Triggers
-- Dependencies: None
-- =============================================================
entity ed_snn_no_semi is end entity;
architecture rtl of ed_snn_no_semi is
  type t_bad is record val:integer end record;  -- ERROR: missing ';'
begin end architecture;