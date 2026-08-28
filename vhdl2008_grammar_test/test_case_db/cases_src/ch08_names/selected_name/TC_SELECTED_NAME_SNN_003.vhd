-- =============================================================
-- Case ID: TC_SELECTED_NAME_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.5
-- Production: selected_name ::= prefix . suffix
-- Case Type: Negative
-- Test Focus: selected_name: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity selected_name_e3 is end entity;
architecture bh of selected_name_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;