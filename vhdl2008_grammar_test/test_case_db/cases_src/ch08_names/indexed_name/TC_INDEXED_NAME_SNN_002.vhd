-- =============================================================
-- Case ID: TC_INDEXED_NAME_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_INDEXED_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.4
-- Production: indexed_name ::= prefix ( expression { , expression } )
-- Case Type: Negative
-- Test Focus: indexed_name: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity indexed_name_e2 is end entity;
architecture bh of indexed_name_e2 is
  -- ERROR: invalid syntax in indexed_name
  signal s : bit;
begin
  s <= '1'
end architecture bh;