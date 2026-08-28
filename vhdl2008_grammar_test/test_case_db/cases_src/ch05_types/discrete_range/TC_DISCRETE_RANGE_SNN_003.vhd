-- =============================================================
-- Case ID: TC_DISCRETE_RANGE_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_DISCRETE_RANGE
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: discrete_range ::= discrete_subtype_indication | range
-- Case Type: Negative
-- Test Focus: discrete_range: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity discrete_range_e3 is end entity;
architecture bh of discrete_range_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;