-- =============================================================
-- Case ID: TC_ACCESS_TYPE_DEFINITION_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ACCESS_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.4.1
-- Production: access_type_definition ::= access subtype_indication
-- Case Type: Negative
-- Test Focus: syntax error -- access_type_definition missing 'access' keyword
-- Expected Result: Triggers
-- Dependencies: None
-- =============================================================
entity atd_snn_no_access is end entity;
architecture rtl of atd_snn_no_access is
  type t_bad is integer;  -- not an error, but not an access type either
begin end architecture;