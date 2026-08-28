-- =============================================================
-- Case ID: TC_ACCESS_TYPE_DEFINITION_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ACCESS_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.4.1
-- Production: access_type_definition ::= access subtype_indication
-- Case Type: Negative
-- Test Focus: syntax error -- access_type_definition with non-type in subtype_indication
-- Expected Result: Triggers
-- Dependencies: None
-- =============================================================
entity atd_snn_non_type is end entity;
architecture rtl of atd_snn_non_type is
  constant C:integer:=0;
  type t_bad is access C;  -- ERROR: C is not a subtype_indication
begin end architecture;