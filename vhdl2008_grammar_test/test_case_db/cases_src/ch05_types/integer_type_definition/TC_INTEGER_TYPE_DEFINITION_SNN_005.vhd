-- =============================================================
-- Case ID: TC_INTEGER_TYPE_DEFINITION_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTEGER_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: integer_type_definition ::= range_constraint
-- Case Type: Negative
-- Test Focus: Syntax error -- integer type with null/descending range
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity itd_snn_null is end entity;
architecture rtl of itd_snn_null is
  type t_bad is range 100 to 0;  -- ERROR: descending range creates null range
begin
end architecture rtl;
