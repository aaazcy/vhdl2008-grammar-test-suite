-- =============================================================
-- Case ID: TC_ALIAS_DESIGNATOR_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ALIAS_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 6.6.1
-- Production: alias_designator ::= identifier | character_literal | operator_symbol
-- Case Type: Negative
-- Test Focus: alias_designator: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity alias_designato_e3 is end entity;
architecture bh of alias_designato_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;