-- =============================================================
-- Case ID: TC_INTERFACE_SUBPROGRAM_DECLARATION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_SUBPROGRAM_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_subprogram_declaration ::= interface_subprogram_specification [ is interface_subprogram_default ]
-- Case Type: Negative
-- Test Focus: interface_subprogram_declaration: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity interface_subpr_e2 is end entity;
architecture bh of interface_subpr_e2 is
  -- ERROR: invalid syntax in interface_subprogram_declaration
  signal s : bit;
begin
  s <= '1'
end architecture bh;