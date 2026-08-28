-- =============================================================
-- Case ID: TC_FLOATING_TYPE_DEFINITION_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_FLOATING_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: floating_type_definition ::= range_constraint
-- Case Type: Negative
-- Test Focus: Syntax error -- floating type with missing range keyword
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity ftd_snn_no_range is end entity;
architecture rtl of ftd_snn_no_range is
  type t_bad is -1.0 to 1.0;  -- ERROR: missing 'range' keyword
begin
end architecture rtl;
