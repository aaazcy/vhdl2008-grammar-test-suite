-- =============================================================
-- Case ID: TC_INTERFACE_PROCEDURE_SPECIFICATION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_PROCEDURE_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_procedure_specification ::= procedure designator [ [ parameter ] ( formal_parameter_list ) ]
-- Case Type: Negative
-- Test Focus: interface_procedure_specification: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity interface_proce_e2 is end entity;
architecture bh of interface_proce_e2 is
  -- ERROR: invalid syntax in interface_procedure_specification
  signal s : bit;
begin
  s <= '1'
end architecture bh;