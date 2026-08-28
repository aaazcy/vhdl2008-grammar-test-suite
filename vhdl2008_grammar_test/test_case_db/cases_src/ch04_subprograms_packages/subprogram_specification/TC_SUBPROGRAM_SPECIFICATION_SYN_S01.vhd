-- =============================================================
-- Case ID: TC_SUBPROGRAM_SPECIFICATION_SYN_S01
-- Rule Type: Syntax
-- BNF Production: SUBPROGRAM_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 4.2.1
-- Test Focus: Subprogram specification: [pure｜impure] function designator [(param_list)] return type_mark ｜ procedure designator [(param_list)]
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_subprogram_specification_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_subprogram_specification_syn_s01 is
  pure function f_ss1(x:integer) return integer is begin return x*2; end function;
  impure function f_ss2 return integer is begin return 0; end function;
  procedure p_ss(signal a:out integer; constant b:in integer);
  procedure p_ss(signal a:out integer; constant b:in integer) is begin a<=b; end procedure;
  signal s_ss:integer:=0;
begin
  p_ss(s_ss,33); r<=f_ss1(s_ss);end architecture bh;
