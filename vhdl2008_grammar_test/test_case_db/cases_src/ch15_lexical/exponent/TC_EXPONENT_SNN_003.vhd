-- =============================================================
-- Case ID: TC_EXPONENT_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXPONENT
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: exponent ::= E [ + ] integer | E integer
-- Case Type: Negative
-- Test Focus: exponent: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity exponent_e3 is end entity;
architecture bh of exponent_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;