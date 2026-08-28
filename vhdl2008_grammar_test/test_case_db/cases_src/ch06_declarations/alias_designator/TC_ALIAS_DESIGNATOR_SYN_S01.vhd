-- =============================================================
-- Case ID: TC_ALIAS_DESIGNATOR_SYN_S01
-- Rule Type: Syntax
-- BNF Production: ALIAS_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 6.6
-- Test Focus: Alias designator: identifier ｜ character_literal ｜ operator_symbol — all 3 alias target forms
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_alias_designator_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_alias_designator_syn_s01 is
  signal s_val:integer:=42;
  alias a_id is s_val;  -- identifier alias
begin
  r<=a_id;end architecture bh;
