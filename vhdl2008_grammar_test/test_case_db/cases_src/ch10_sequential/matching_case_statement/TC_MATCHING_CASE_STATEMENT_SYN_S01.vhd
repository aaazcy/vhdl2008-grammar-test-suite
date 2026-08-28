-- =============================================================
-- Case ID: TC_MATCHING_CASE_STATEMENT_SYN_S01
-- Rule Type: Syntax
-- BNF Production: MATCHING_CASE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Test Focus: Matching case statement: case? expression is matching_case_statement_alternative end case?; — VHDL 2008 matching case
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_matching_case_statement_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_matching_case_statement_syn_s01 is
  type t_state is (IDLE,RUN,DONE); signal s_st:t_state:=IDLE;
begin
  process(s_st) is
  begin
    case? s_st is
      when IDLE => r<=0;
      when RUN  => r<=1;
      when DONE => r<=2;
    end case?;
  end process;
end architecture bh;
