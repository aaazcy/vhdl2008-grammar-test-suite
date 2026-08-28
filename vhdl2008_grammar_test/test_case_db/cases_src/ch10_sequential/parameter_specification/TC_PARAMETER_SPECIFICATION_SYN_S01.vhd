-- =============================================================
-- Case ID: TC_PARAMETER_SPECIFICATION_SYN_S01
-- Rule Type: Syntax
-- BNF Production: PARAMETER_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 10.10
-- Test Focus: Parameter specification: identifier in discrete_range — loop parameter with ascending/descending/range/static ranges
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_parameter_specification_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_parameter_specification_syn_s01 is
  signal s_ps:integer:=0; signal s_sum:integer:=0;
begin
  process is
  begin
    for param in 0 to 7 loop s_sum<=s_sum+param; end loop;
  end process;
  r<=s_sum;end architecture bh;
