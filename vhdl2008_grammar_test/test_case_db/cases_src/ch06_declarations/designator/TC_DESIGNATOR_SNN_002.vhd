-- =============================================================
-- Case ID: TC_DESIGNATOR_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: designator ::= identifier | operator_symbol
-- Case Type: Negative
-- Test Focus: designator: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity designator_e2 is end entity;
architecture bh of designator_e2 is
  -- ERROR: invalid syntax in designator
  signal s : bit;
begin
  s <= '1'
end architecture bh;