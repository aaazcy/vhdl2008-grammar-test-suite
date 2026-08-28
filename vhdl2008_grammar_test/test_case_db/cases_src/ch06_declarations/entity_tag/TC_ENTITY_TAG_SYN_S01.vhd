-- =============================================================
-- Case ID: TC_ENTITY_TAG_SYN_S01
-- Rule Type: Syntax
-- BNF Production: ENTITY_TAG
-- Standard Reference: IEEE 1076-2008 Section 6.7
-- Test Focus: Entity tag: identifier ｜ character_literal ｜ operator_symbol — used in attribute specifications
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_entity_tag_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_entity_tag_syn_s01 is
begin
  r<=42;end architecture bh;
