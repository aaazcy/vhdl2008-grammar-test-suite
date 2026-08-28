-- =============================================================
-- Case ID: TC_EXTERNAL_NAME_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_name ::= external_constant_name external_signal_name | external_variable_name
-- Case Type: Negative
-- Test Focus: external_name: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity external_name_e2 is end entity;
architecture bh of external_name_e2 is
  -- ERROR: invalid syntax in external_name
  signal s : bit;
begin
  s <= '1'
end architecture bh;