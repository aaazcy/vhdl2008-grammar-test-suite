-- =============================================================
-- Case ID: TC_CHOICES_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_CHOICES_EXHAUSTIVE
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: choices ::= choice { | choice }
-- Case Type: Negative
-- Test Focus: SEM: non-exhaustive choices for enumerated type — missing DONE in coverage for {IDLE,RUN,DONE,ERR}
-- Expected Result: Triggers semantic error: case choice set does not cover all values
-- Dependencies: None
-- =============================================================
entity choices_sem2_ent is port(clk:in bit; y:out integer); end entity;
architecture bh of choices_sem2_ent is
  type t_fsm is (IDLE, RUN, DONE, ERR);
  signal s_st:t_fsm:=IDLE;
begin
  process(clk) is
  begin
    if clk'event and clk='1' then
      case s_st is
        when IDLE     => s_st<=RUN;
        when RUN      => s_st<=DONE;
        when ERR      => s_st<=IDLE;
      end case;
    end if;
  end process;
  y<=1;
end architecture bh;
