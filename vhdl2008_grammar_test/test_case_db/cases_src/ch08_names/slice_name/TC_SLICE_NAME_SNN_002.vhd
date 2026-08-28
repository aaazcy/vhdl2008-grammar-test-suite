-- =============================================================
-- Case ID: TC_SLICE_NAME_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SLICE_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.4
-- Production: slice_name ::= prefix ( discrete_range )
-- Case Type: Negative
-- Test Focus: slice_name: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity slice_name_e2 is end entity;
architecture bh of slice_name_e2 is
  -- ERROR: invalid syntax in slice_name
  signal s : bit;
begin
  s <= '1'
end architecture bh;