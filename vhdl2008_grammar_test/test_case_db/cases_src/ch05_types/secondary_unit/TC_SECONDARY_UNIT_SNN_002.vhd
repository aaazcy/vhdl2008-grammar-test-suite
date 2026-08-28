-- =============================================================
-- Case ID: TC_SECONDARY_UNIT_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SECONDARY_UNIT
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: secondary_unit ::= architecture_body package_body
-- Case Type: Negative
-- Test Focus: secondary_unit: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity secondary_unit_e2 is end entity;
architecture bh of secondary_unit_e2 is
  -- ERROR: invalid syntax in secondary_unit
  signal s : bit;
begin
  s <= '1'
end architecture bh;