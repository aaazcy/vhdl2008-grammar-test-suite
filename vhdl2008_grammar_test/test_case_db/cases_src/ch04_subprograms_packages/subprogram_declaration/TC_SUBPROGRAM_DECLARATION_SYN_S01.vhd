-- =============================================================
-- Case ID: TC_SUBPROGRAM_DECLARATION_SYN_S01
-- Rule Type: Syntax
-- BNF Production: SUBPROGRAM_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Test Focus: Subprogram declaration: subprogram_specification [is subprogram_header] — forward declaration with/without header
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_subprogram_declaration_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_subprogram_declaration_syn_s01 is
  function f_sd(x:integer) return integer;
  function f_sd(x:integer) return integer is begin return x*x; end function;
  procedure p_sd(signal v:out integer);
  procedure p_sd(signal v:out integer) is begin v<=99; end procedure;
  signal s_sd:integer:=0;
begin
  p_sd(s_sd); r<=f_sd(s_sd);end architecture bh;
