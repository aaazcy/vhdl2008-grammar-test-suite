-- =============================================================
-- Case ID: TC_SECONDARY_UNIT_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SECONDARY_UNIT
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: secondary_unit ::= architecture_body package_body
-- Case Type: Negative
-- Test Focus: secondary_unit: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity secondary_unit_e3 is end entity;
architecture bh of secondary_unit_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;