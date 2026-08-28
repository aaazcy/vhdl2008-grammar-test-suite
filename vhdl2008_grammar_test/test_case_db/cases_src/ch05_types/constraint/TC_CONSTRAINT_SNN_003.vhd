-- =============================================================
-- Case ID: TC_CONSTRAINT_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2
-- Production: constraint ::= range_constraint array_constraint | record_constraint
-- Case Type: Negative
-- Test Focus: constraint: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity constraint_e3 is end entity;
architecture bh of constraint_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;