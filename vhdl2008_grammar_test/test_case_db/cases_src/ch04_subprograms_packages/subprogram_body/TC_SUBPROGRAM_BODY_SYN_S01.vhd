-- =============================================================
-- Case ID: TC_SUBPROGRAM_BODY_SYN_S01
-- Rule Type: Syntax
-- BNF Production: SUBPROGRAM_BODY
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Test Focus: Subprogram body: subprogram_specification is declarative_part begin statement_part end [designator];
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_subprogram_body_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_subprogram_body_syn_s01 is
  function f_sb(x:integer;y:integer) return integer is variable v:integer;
  begin v:=x+y; return v*2; end function;
  procedure p_sb(signal v:out integer; n:integer) is begin v<=n*3; end procedure;
  signal s_sb:integer:=0;
begin
  p_sb(s_sb,10); r<=f_sb(5,s_sb);end architecture bh;
