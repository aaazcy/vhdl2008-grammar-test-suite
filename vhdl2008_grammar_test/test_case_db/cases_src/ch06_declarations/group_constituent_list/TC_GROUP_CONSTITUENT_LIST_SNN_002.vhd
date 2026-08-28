-- =============================================================
-- Case ID: TC_GROUP_CONSTITUENT_LIST_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_GROUP_CONSTITUENT_LIST
-- Standard Reference: IEEE 1076-2008 Section 6.9
-- Production: group_constituent_list ::= group_constituent { , group_constituent }
-- Case Type: Negative
-- Test Focus: group_constituent_list: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity group_constitue_e2 is end entity;
architecture bh of group_constitue_e2 is
  -- ERROR: invalid syntax in group_constituent_list
  signal s : bit;
begin
  s <= '1'
end architecture bh;