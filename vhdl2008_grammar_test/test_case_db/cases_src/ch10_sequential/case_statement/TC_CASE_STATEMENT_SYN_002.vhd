-- =============================================================
-- Case ID: TC_CASE_STATEMENT_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_CASE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: case_statement ::= [ case_label : ] case expression is case_statement_alternative { case_statement_alternative } end case [ case_label ] ;
-- Case Type: Positive
-- Test Focus: Case with label + enum expression: includes case_label "c_fsm", expression is a custom enum type t_state(IDLE,RUN,DONE,ERR) whose 4 discrete values each map to a signal assignment sequence (with conditional jumps), verifying both label and enum type work with case
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity case_label_ent is
  port(clk:in bit; op:in integer range 0 to 1; y:out integer);
end entity;
architecture bh of case_label_ent is
  type t_state is (IDLE, RUN, DONE, ERR);
  signal s_st:t_state:=IDLE;
  signal s_res:integer:=0;
begin
  process(clk)
  begin
    if clk'event and clk='1' then
      c_fsm:case s_st is
        when IDLE => s_st<=RUN; s_res<=0;
        when RUN  => if op=1 then s_st<=DONE; s_res<=s_res+1; end if;
        when DONE => s_st<=IDLE; s_res<=s_res*2;
        when ERR  => s_st<=IDLE; s_res<=-1;
      end case c_fsm;
    end if;
  end process;
  y<=s_res;
end architecture bh;
