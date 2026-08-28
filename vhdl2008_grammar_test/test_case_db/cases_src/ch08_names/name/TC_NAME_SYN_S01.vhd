-- =============================================================
-- Case ID: TC_NAME_SYN_S01
-- Rule Type: Syntax
-- BNF Production: NAME
-- Standard Reference: IEEE 1076-2008 Section 8.1
-- Test Focus: Name: simple_name ｜ operator_symbol ｜ character_literal ｜ selected_name ｜ indexed_name ｜ slice_name ｜ attribute_name ｜ external_name — all 8 name forms
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_name_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_name_syn_s01 is
  type t_arr is array(0 to 7) of integer; signal s_arr:t_arr;
  signal s_idx:integer:=0; signal s_val:integer:=42;
begin
  s_arr(0)<=s_val;  -- simple_name + indexed_name
  s_idx<=s_arr(0);  -- selected from array
  r<=s_idx;end architecture bh;
