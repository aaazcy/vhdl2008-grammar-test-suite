-- =============================================================
-- Case ID: TC_SCALAR_TYPE_DEFINITION_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_SCALAR_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: scalar_type_definition ::= enumeration_type_definition | integer_type_definition | floating_type_definition | physical_type_definition
-- Case Type: Negative
-- Test Focus: syntax error -- physical type missing 'end units'
-- Expected Result: Triggers
-- Dependencies: None
-- =============================================================
entity std_snn_no_end_units is end entity;
architecture rtl of std_snn_no_end_units is
  type t_bad is range 0 to 1000 units Hz; kHz=1000 Hz;  -- ERROR: missing 'end units'
begin end architecture;