-- =============================================================
-- Case ID: TC_LOGICAL_NAME_LIST_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOGICAL_NAME_LIST
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: logical_name_list ::= logical_name { , logical_name }
-- Case Type: Negative
-- Test Focus: logical_name_list: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity logical_name_li_e3 is end entity;
architecture bh of logical_name_li_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;