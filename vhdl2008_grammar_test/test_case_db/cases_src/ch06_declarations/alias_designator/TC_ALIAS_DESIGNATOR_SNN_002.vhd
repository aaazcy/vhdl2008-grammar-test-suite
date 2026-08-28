-- =============================================================
-- Case ID: TC_ALIAS_DESIGNATOR_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ALIAS_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 6.6.1
-- Production: alias_designator ::= identifier | character_literal | operator_symbol
-- Case Type: Negative
-- Test Focus: alias_designator: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity alias_designato_e2 is end entity;
architecture bh of alias_designato_e2 is
  -- ERROR: invalid syntax in alias_designator
  signal s : bit;
begin
  s <= '1'
end architecture bh;