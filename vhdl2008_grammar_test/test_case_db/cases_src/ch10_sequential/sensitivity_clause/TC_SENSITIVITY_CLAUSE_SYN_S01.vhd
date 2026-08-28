-- =============================================================
-- Case ID: TC_SENSITIVITY_CLAUSE_SYN_S01
-- Rule Type: Syntax
-- BNF Production: SENSITIVITY_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Test Focus: Sensitivity clause: on sensitivity_list — wait sensitivity specification
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_sensitivity_clause_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_sensitivity_clause_syn_s01 is
  signal s_sc:bit:='0'; signal s_out:integer:=0;
begin
  process is
  begin
    wait on s_sc; r<=s_out;
  end process;
end architecture bh;
