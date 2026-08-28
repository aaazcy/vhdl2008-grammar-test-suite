-- =============================================================
-- Case ID: TC_INTERFACE_SUBPROGRAM_DECLARATION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_SUBPROGRAM_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_subprogram_declaration ::= interface_subprogram_specification [ is interface_subprogram_default ]
-- Case Type: Negative
-- Test Focus: interface_subprogram_declaration: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity interface_subpr_e3 is end entity;
architecture bh of interface_subpr_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;