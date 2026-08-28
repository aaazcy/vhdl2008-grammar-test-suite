-- =============================================================
-- Case ID: TC_FUNCTION_SPECIFICATION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_FUNCTION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 4.2.2.1
-- Production: function_specification ::= [ pure | impure ] function designator subprogram_header [ [ parameter ] ( formal_parameter_list ) ] return type_mark
-- Case Type: Negative
-- Test Focus: function_specification: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity function_specif_e3 is end entity;
architecture bh of function_specif_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;