-- =============================================================
-- Case ID: TC_BASED_LITERAL_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASED_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: based_literal ::= base # based_integer [ . based_integer ] # [ exponent ]
-- Case Type: Negative
-- Test Focus: based_literal: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity based_literal_e2 is end entity;
architecture bh of based_literal_e2 is
  -- ERROR: invalid syntax in based_literal
  signal s : bit;
begin
  s <= '1'
end architecture bh;