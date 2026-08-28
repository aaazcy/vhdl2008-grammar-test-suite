-- =============================================================
-- Case ID: TC_SUBPROGRAM_KIND_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_KIND
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Production: subprogram_kind ::= procedure | function
-- Case Type: Positive
-- Test Focus: two kinds of subprogram kind — procedure (body+call) and function (body+expression call), verifies both subprogram_kind forms can be followed by the kind keyword after the end of subprogram_body
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sk_ent is port(a:in integer; y:out integer); end entity;
architecture bh of sk_ent is
  function f_dbl(x:integer) return integer is begin return x*2; end function;
  procedure p_set(signal v:out integer; n:integer) is begin v<=n; end procedure;
  signal s_t:integer:=0;
begin p_set(s_t,a); y<=f_dbl(s_t); end architecture bh;
