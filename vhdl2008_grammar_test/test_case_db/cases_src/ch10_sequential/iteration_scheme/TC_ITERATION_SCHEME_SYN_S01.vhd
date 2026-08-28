-- =============================================================
-- Case ID: TC_ITERATION_SCHEME_SYN_S01
-- Rule Type: Syntax
-- BNF Production: ITERATION_SCHEME
-- Standard Reference: IEEE 1076-2008 Section 10.10
-- Test Focus: Iteration scheme: while condition ｜ for parameter_specification — both loop iteration schemes
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_iteration_scheme_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_iteration_scheme_syn_s01 is
  signal s_while,s_for:integer:=0;
begin
  process is
  begin
    l_while: while s_while<5 loop s_while<=s_while+1; end loop;
    for i in 0 to 7 loop s_for<=s_for+i; end loop;
  end process;
  r<=s_while+s_for;end architecture bh;
