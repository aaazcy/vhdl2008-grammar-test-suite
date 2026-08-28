-- =============================================================
-- Case ID: TC_INTERFACE_SUBPROGRAM_SPECIFICATION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_SUBPROGRAM_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_subprogram_specification ::= interface_procedure_specification | interface_function_specification
-- Case Type: Negative
-- Test Focus: interface_subprogram_specification: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity interface_subpr_e2 is end entity;
architecture bh of interface_subpr_e2 is
  -- ERROR: invalid syntax in interface_subprogram_specification
  signal s : bit;
begin
  s <= '1'
end architecture bh;