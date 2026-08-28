-- =============================================================
-- Case ID: TC_DESIGNATOR_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: designator ::= identifier | operator_symbol
-- Case Type: Negative
-- Test Focus: designator: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity designator_e3 is end entity;
architecture bh of designator_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;