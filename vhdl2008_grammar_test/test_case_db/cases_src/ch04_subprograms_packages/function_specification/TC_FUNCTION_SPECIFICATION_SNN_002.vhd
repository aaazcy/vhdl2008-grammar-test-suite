-- =============================================================
-- Case ID: TC_FUNCTION_SPECIFICATION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_FUNCTION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 4.2.2.1
-- Production: function_specification ::= [ pure | impure ] function designator subprogram_header [ [ parameter ] ( formal_parameter_list ) ] return type_mark
-- Case Type: Negative
-- Test Focus: function_specification: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity function_specif_e2 is end entity;
architecture bh of function_specif_e2 is
  -- ERROR: invalid syntax in function_specification
  signal s : bit;
begin
  s <= '1'
end architecture bh;