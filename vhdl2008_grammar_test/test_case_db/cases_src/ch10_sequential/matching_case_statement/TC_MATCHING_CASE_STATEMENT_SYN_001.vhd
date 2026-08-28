-- =============================================================
-- Case ID: TC_MATCHING_CASE_STATEMENT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_MATCHING_CASE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: matching_case_statement ::= [ label : ] case? expression is matching_case_statement_alternative end case? [ label ] ;
-- Case Type: Positive
-- Test Focus: Minimal matching case?: enum expression (t_state IDLE/RUN/DONE) + 3 branches exactly covering all values, verifying VHDL 2008 matching case? exact coverage syntax — no OTHERS needed, each value covered by exactly one choice
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity mcs_ent is port(st:in integer range 0 to 2; y:out integer); end entity;
architecture bh of mcs_ent is
  type t_state is (IDLE, RUN, DONE);
  signal s_st:t_state:=IDLE;
begin
  process(st) begin
    if st=0 then s_st<=IDLE; elsif st=1 then s_st<=RUN; else s_st<=DONE; end if;
    case? s_st is
      when IDLE => y<=0;
      when RUN  => y<=1;
      when DONE => y<=2;
    end case?;
  end process;
end architecture bh;
