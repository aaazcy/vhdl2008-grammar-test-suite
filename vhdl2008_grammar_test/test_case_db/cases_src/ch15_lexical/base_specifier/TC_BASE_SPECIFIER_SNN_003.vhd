-- =============================================================
-- Case ID: TC_BASE_SPECIFIER_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASE_SPECIFIER
-- Standard Reference: IEEE 1076-2008 Section 15.8
-- Production: base_specifier ::= B | O | X | UB | UO | UX | SB | SO | SX | D
-- Case Type: Negative
-- Test Focus: base_specifier: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity base_specifier_e3 is end entity;
architecture bh of base_specifier_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;