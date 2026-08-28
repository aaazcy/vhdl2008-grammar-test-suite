-- =============================================================
-- Case ID: TC_EXTERNAL_NAME_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_name ::= external_constant_name external_signal_name | external_variable_name
-- Case Type: Negative
-- Test Focus: external_name: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity external_name_e3 is end entity;
architecture bh of external_name_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;