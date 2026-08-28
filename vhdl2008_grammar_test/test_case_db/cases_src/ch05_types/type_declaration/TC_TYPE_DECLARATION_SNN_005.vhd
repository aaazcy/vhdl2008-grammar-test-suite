-- =============================================================
-- Case ID: TC_TYPE_DECLARATION_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_TYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.2
-- Production: type_declaration ::= full_type_declaration | incomplete_type_declaration
-- Case Type: Negative
-- Test Focus: syntax error -- type declaration with undefined base type
-- Expected Result: Triggers
-- Dependencies: None
-- =============================================================
entity td_snn_undefined is end entity;
architecture rtl of td_snn_undefined is
  type t_bad is array(nosuchtype range <>) of integer;  -- ERROR: undefined type_mark
begin end architecture;