-- =============================================================
-- Case ID: TC_SUFFIX_SYN_S01
-- Rule Type: Syntax
-- BNF Production: SUFFIX
-- Standard Reference: IEEE 1076-2008 Section 8.3
-- Test Focus: Suffix: simple_name ｜ character_literal ｜ operator_symbol ｜ all — right side of selected_name
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_suffix_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_suffix_syn_s01 is
  type t_rec is record x:integer; y:bit; end record;
  signal s_sfx:t_rec;
begin
  s_sfx.x<=1; s_sfx.y<='1'; r<=s_sfx.x;end architecture bh;
