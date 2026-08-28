-- =============================================================
-- Case ID: TC_FORMAL_PARAMETER_LIST_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_FORMAL_PARAMETER_LIST
-- Standard Reference: IEEE 1076-2008 Section 4.2.2.1
-- Production: formal_parameter_list ::= parameter_interface_list
-- Case Type: Negative
-- Test Focus: formal_parameter_list: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity formal_paramete_e3 is end entity;
architecture bh of formal_paramete_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;