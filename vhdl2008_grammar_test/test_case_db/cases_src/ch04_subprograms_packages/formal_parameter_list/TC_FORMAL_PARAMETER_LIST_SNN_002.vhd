-- =============================================================
-- Case ID: TC_FORMAL_PARAMETER_LIST_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_FORMAL_PARAMETER_LIST
-- Standard Reference: IEEE 1076-2008 Section 4.2.2.1
-- Production: formal_parameter_list ::= parameter_interface_list
-- Case Type: Negative
-- Test Focus: formal_parameter_list: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity formal_paramete_e2 is end entity;
architecture bh of formal_paramete_e2 is
  -- ERROR: invalid syntax in formal_parameter_list
  signal s : bit;
begin
  s <= '1'
end architecture bh;