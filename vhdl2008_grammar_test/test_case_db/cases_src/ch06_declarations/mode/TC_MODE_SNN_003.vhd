-- =============================================================
-- Case ID: TC_MODE_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_MODE
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: mode ::= in | out | inout | buffer | linkage
-- Case Type: Negative
-- Test Focus: mode: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity mode_e3 is end entity;
architecture bh of mode_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;