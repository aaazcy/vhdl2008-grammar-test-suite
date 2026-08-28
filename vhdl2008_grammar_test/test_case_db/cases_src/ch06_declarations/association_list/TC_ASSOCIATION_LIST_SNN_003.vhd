-- =============================================================
-- Case ID: TC_ASSOCIATION_LIST_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ASSOCIATION_LIST
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: association_list ::= association_element { , association_element }
-- Case Type: Negative
-- Test Focus: association_list: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity association_lis_e3 is end entity;
architecture bh of association_lis_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;