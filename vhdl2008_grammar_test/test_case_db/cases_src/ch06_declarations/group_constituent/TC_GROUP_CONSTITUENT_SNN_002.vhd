-- =============================================================
-- Case ID: TC_GROUP_CONSTITUENT_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_GROUP_CONSTITUENT
-- Standard Reference: IEEE 1076-2008 Section 6.9
-- Production: group_constituent ::= name | character_literal
-- Case Type: Negative
-- Test Focus: group_constituent: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity group_constitue_e2 is end entity;
architecture bh of group_constitue_e2 is
  -- ERROR: invalid syntax in group_constituent
  signal s : bit;
begin
  s <= '1'
end architecture bh;