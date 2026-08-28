-- =============================================================
-- Case ID: TC_SCALAR_TYPE_DEFINITION_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SCALAR_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: scalar_type_definition ::= enumeration_type_definition | integer_type_definition | floating_type_definition | physical_type_definition
-- Case Type: Negative
-- Test Focus: syntax error -- scalar type with missing range constraint on integer type
-- Expected Result: Triggers
-- Dependencies: None
-- =============================================================
entity std_snn_no_range is end entity;
architecture rtl of std_snn_no_range is
  type t_bad is range;  -- ERROR: empty range constraint
begin end architecture;