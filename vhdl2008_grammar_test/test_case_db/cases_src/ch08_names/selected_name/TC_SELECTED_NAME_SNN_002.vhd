-- =============================================================
-- Case ID: TC_SELECTED_NAME_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.5
-- Production: selected_name ::= prefix . suffix
-- Case Type: Negative
-- Test Focus: selected_name: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity selected_name_e2 is end entity;
architecture bh of selected_name_e2 is
  -- ERROR: invalid syntax in selected_name
  signal s : bit;
begin
  s <= '1'
end architecture bh;