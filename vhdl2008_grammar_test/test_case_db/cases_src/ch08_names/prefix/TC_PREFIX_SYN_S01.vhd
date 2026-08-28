-- =============================================================
-- Case ID: TC_PREFIX_SYN_S01
-- Rule Type: Syntax
-- BNF Production: PREFIX
-- Standard Reference: IEEE 1076-2008 Section 8.2
-- Test Focus: Prefix: name ｜ function_call — left side of name resolution (can be any name or function call)
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_prefix_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_prefix_syn_s01 is
  function f_pfx return integer is begin return 7; end function;
  signal s_pfx:integer:=0;
begin
  s_pfx<=f_pfx; r<=s_pfx;end architecture bh;
