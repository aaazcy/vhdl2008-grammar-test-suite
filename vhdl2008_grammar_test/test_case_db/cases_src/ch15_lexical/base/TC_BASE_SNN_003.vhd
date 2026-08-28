-- =============================================================
-- Case ID: TC_BASE_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASE
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: base ::= integer
-- Case Type: Negative
-- Test Focus: base: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity base_e3 is end entity;
architecture bh of base_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;