-- =============================================================
-- Case ID: TC_INTEGER_TYPE_DEFINITION_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTEGER_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: integer_type_definition ::= range_constraint
-- Case Type: Negative
-- Test Focus: Syntax error -- integer type with non-integer expression as range bound
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity itd_snn_real_bound is end entity;
architecture rtl of itd_snn_real_bound is
  type t_bad is range 0 to 100.5;  -- ERROR: real value not valid for integer type bound
begin
end architecture rtl;
