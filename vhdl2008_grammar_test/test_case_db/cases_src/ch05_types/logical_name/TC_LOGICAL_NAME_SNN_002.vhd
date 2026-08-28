-- =============================================================
-- Case ID: TC_LOGICAL_NAME_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOGICAL_NAME
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: logical_name ::= identifier
-- Case Type: Negative
-- Test Focus: logical_name: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity logical_name_e2 is end entity;
architecture bh of logical_name_e2 is
  -- ERROR: invalid syntax in logical_name
  signal s : bit;
begin
  s <= '1'
end architecture bh;