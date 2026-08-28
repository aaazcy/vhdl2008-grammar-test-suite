-- =============================================================
-- Case ID: TC_CONSTRAINT_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2
-- Production: constraint ::= range_constraint array_constraint | record_constraint
-- Case Type: Negative
-- Test Focus: constraint: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity constraint_e2 is end entity;
architecture bh of constraint_e2 is
  -- ERROR: invalid syntax in constraint
  signal s : bit;
begin
  s <= '1'
end architecture bh;