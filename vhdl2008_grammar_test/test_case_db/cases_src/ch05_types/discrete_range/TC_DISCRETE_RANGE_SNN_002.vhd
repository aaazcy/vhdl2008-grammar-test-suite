-- =============================================================
-- Case ID: TC_DISCRETE_RANGE_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_DISCRETE_RANGE
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: discrete_range ::= discrete_subtype_indication | range
-- Case Type: Negative
-- Test Focus: discrete_range: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity discrete_range_e2 is end entity;
architecture bh of discrete_range_e2 is
  -- ERROR: invalid syntax in discrete_range
  signal s : bit;
begin
  s <= '1'
end architecture bh;