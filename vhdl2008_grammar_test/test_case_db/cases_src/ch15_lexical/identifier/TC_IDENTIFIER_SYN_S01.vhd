-- =============================================================
-- Case ID: TC_IDENTIFIER_SYN_S01
-- Rule Type: Syntax
-- BNF Production: IDENTIFIER
-- Standard Reference: IEEE 1076-2008 Section 15.4
-- Test Focus: Identifier: basic_identifier ｜ extended_identifier — both identifier forms
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_identifier_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_identifier_syn_s01 is
  signal basic_id:integer:=1; signal \ext_id\:integer:=2;
begin
  r<=basic_id+\ext_id\;end architecture bh;
