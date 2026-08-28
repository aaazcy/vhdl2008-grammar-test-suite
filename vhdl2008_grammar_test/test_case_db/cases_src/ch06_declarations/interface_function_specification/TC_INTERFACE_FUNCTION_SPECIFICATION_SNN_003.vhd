-- =============================================================
-- Case ID: TC_INTERFACE_FUNCTION_SPECIFICATION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_FUNCTION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_function_specification ::= [ pure | impure ] function designator [ [ parameter ] ( formal_parameter_list ) ] return type_mark
-- Case Type: Negative
-- Test Focus: interface_function_specification: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity interface_funct_e3 is end entity;
architecture bh of interface_funct_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;