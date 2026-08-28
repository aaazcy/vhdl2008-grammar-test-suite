-- =============================================================
-- Case ID: TC_SUBPROGRAM_STATEMENT_PART_SYN_S01
-- Rule Type: Syntax
-- BNF Production: SUBPROGRAM_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Test Focus: Subprogram statement part: {sequential_statement} — if/case/loop/return/variable assignment within subprogram body
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_subprogram_statement_part_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_subprogram_statement_part_syn_s01 is
  function f_ssp(x:integer) return integer is
  begin if x>0 then return x*2; elsif x<0 then return x*(-1); else return 1; end if; end function;
  procedure p_ssp(signal v:out integer; n:integer) is
    variable t:integer:=n;
  begin for i in 1 to 3 loop t:=t+n; end loop; v<=t; end procedure;
  signal s_ssp:integer:=0;
begin
  p_ssp(s_ssp,5); r<=f_ssp(s_ssp);end architecture bh;
