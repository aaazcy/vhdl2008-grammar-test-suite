-- =============================================================
-- Case ID: TC_SEM_SEQ_007_SMN_005
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_007
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Rule Description: Case choices must cover all possible values of the expression type - an elaboration error is triggered when not all values are covered and there is no OTHERS
-- Case Type: Negative
-- Error Category: declaration_elaboration_error
-- Test Focus: Negative example: enum type t_state has 4 values (IDLE,RUN,DONE,ERR), but case only covers the three values IDLE/RUN/DONE, missing ERR and with no when others, verifying the analyzer detects choices not fully covering all enumeration values of the expression type
-- Expected Result: Triggers semantic error: case choices do not cover all values
-- Dependencies: None
-- =============================================================
entity case_smn5_ent is port(clk:in bit; y:out integer); end entity;
architecture bh of case_smn5_ent is
  type t_state is (IDLE, RUN, DONE, ERR);
  signal s_st:t_state:=IDLE;
begin
  process(clk) begin
    if clk'event and clk='1' then
      case s_st is
        when IDLE => s_st<=RUN;
        when RUN  => s_st<=DONE;
        when DONE => s_st<=IDLE;
      end case;
    end if;
  end process;
  y<=0;
end architecture bh;
