-- =============================================================
-- Case ID: TC_SUBPROGRAM_KIND_SYN_S01
-- Rule Type: Syntax
-- BNF Production: SUBPROGRAM_KIND
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Test Focus: Subprogram kind: procedure ｜ function — both keywords with bodies
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_subprogram_kind_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_subprogram_kind_syn_s01 is
  function f_sk(x:integer) return integer is begin return x; end function;
  procedure p_sk(signal v:out integer) is begin v<=7; end procedure;
  signal s_sk:integer:=0;
begin
  p_sk(s_sk); r<=f_sk(s_sk);end architecture bh;
