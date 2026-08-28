-- =============================================================
-- Case ID: TC_ENUMERATION_LITERAL_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENUMERATION_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 5.2.2.1
-- Production: enumeration_literal ::= identifier | character_literal
-- Case Type: Negative
-- Test Focus: enumeration_literal: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity enumeration_lit_e2 is end entity;
architecture bh of enumeration_lit_e2 is
  -- ERROR: invalid syntax in enumeration_literal
  signal s : bit;
begin
  s <= '1'
end architecture bh;