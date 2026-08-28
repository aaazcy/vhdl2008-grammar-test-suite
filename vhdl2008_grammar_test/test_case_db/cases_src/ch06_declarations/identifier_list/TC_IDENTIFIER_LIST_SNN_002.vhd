-- =============================================================
-- Case ID: TC_IDENTIFIER_LIST_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_IDENTIFIER_LIST
-- Standard Reference: IEEE 1076-2008 Section 6.4.2.2
-- Production: identifier_list ::= identifier { , identifier }
-- Case Type: Negative
-- Test Focus: identifier_list: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity identifier_list_e2 is end entity;
architecture bh of identifier_list_e2 is
  -- ERROR: invalid syntax in identifier_list
  signal s : bit;
begin
  s <= '1'
end architecture bh;