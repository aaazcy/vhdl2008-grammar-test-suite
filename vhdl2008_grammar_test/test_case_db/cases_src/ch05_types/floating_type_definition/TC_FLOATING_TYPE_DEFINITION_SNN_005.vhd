-- =============================================================
-- Case ID: TC_FLOATING_TYPE_DEFINITION_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_FLOATING_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: floating_type_definition ::= range_constraint
-- Case Type: Negative
-- Test Focus: Syntax error -- floating point type with string range bounds
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity ftd_snn_bad_bounds is end entity;
architecture rtl of ftd_snn_bad_bounds is
  type t_bad is range "low" to "high";  -- ERROR: string not valid range bound
begin
end architecture rtl;
