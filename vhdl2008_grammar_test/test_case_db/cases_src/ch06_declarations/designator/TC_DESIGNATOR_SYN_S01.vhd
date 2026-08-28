-- =============================================================
-- Case ID: TC_DESIGNATOR_SYN_S01
-- Rule Type: Syntax
-- BNF Production: DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 6.3
-- Test Focus: Designator: identifier ｜ operator_symbol — subprogram designator both forms
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_designator_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_designator_syn_s01 is
  function f_des(x:integer) return integer is begin return x*3; end function;
  function "+"(a,b:integer) return integer is begin return a+b; end function;
begin
  r<=f_des(10)+"+"(1,2);end architecture bh;
