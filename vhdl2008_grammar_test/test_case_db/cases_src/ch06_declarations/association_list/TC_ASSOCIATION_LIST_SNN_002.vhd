-- =============================================================
-- Case ID: TC_ASSOCIATION_LIST_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ASSOCIATION_LIST
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: association_list ::= association_element { , association_element }
-- Case Type: Negative
-- Test Focus: association_list: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity association_lis_e2 is end entity;
architecture bh of association_lis_e2 is
  -- ERROR: invalid syntax in association_list
  signal s : bit;
begin
  s <= '1'
end architecture bh;