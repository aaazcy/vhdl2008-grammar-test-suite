-- =============================================================
-- Case ID: TC_ALIAS_DECLARATION_SNN_S01
-- Rule Type: Syntax
-- BNF Production: ALIAS_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.6
-- Test Focus: alias_declaration: missing "is" keyword
-- Case Type: Negative (Production-Specific)
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity ad_e is end entity;
architecture bh of ad_e is
  signal s:integer:=0;
  alias a_bad s;  -- ERROR: missing "is"
begin end architecture;
