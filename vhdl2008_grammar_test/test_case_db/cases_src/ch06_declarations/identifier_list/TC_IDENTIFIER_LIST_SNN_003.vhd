-- =============================================================
-- Case ID: TC_IDENTIFIER_LIST_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_IDENTIFIER_LIST
-- Standard Reference: IEEE 1076-2008 Section 6.4.2.2
-- Production: identifier_list ::= identifier { , identifier }
-- Case Type: Negative
-- Test Focus: identifier_list: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity identifier_list_e3 is end entity;
architecture bh of identifier_list_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;