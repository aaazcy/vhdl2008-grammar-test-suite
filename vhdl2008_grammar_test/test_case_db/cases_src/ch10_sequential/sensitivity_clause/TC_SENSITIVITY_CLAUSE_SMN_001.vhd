-- =============================================================
-- Case ID: TC_SENSITIVITY_CLAUSE_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_SENS_CLAUSE_NOT_SIGNAL
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Rule Description: Sensitivity clause in wait on must list signal names
-- Case Type: Negative
-- Error Category: not_a_signal
-- Test Focus: SMN: an integer literal appears in the sensitivity_clause of wait on — in wait on 5 the 5 is not a signal name, every element of a sensitivity_clause must be a signal_name
-- Expected Result: Triggers analysis error: name expected here, found '<integer>'
-- Dependencies: None
-- =============================================================
entity sens_clause_literal is port(a:in bit; y:out integer); end entity;
architecture vhdl2008 of sens_clause_literal is
  signal s_cnt:integer:=0;
begin
  process is
  begin
    wait on 5;
    s_cnt<=s_cnt+1;
    y<=s_cnt;
  end process;
end architecture vhdl2008;
