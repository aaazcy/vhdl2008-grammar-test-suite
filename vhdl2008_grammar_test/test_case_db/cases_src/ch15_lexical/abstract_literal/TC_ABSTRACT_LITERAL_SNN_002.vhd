-- =============================================================
-- Case ID: TC_ABSTRACT_LITERAL_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ABSTRACT_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.5.1
-- Production: abstract_literal ::= decimal_literal | based_literal
-- Case Type: Negative
-- Test Focus: abstract_literal: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity abstract_litera_e2 is end entity;
architecture bh of abstract_litera_e2 is
  -- ERROR: invalid syntax in abstract_literal
  signal s : bit;
begin
  s <= '1'
end architecture bh;