-- =============================================================
-- Case ID: TC_GROUP_CONSTITUENT_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_GROUP_CONSTITUENT
-- Standard Reference: IEEE 1076-2008 Section 6.9
-- Production: group_constituent ::= name | character_literal
-- Case Type: Negative
-- Test Focus: group_constituent: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity group_constitue_e3 is end entity;
architecture bh of group_constitue_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;