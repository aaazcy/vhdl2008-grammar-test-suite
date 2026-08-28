-- =============================================================
-- Case ID: TC_CHOICE_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CHOICE
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: choice ::= simple_expression | discrete_range | element_simple_name | others
-- Case Type: Positive
-- Test Focus: choice: element_simple_name as enumeration literals (IDLE, RUN, DONE) plus others
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity choice_syn3_ent is port(clk:in bit; y:out integer); end entity;
architecture bh of choice_syn3_ent is
  type t_state is (IDLE, RUN, DONE, ERR);
  signal s_st:t_state:=IDLE;
  signal s_cnt:integer:=0;
begin
  process(clk) is
  begin
    if clk'event and clk='1' then
      case s_st is
        when IDLE => s_st<=RUN; s_cnt<=0;
        when RUN  => s_cnt<=s_cnt+1; if s_cnt>5 then s_st<=DONE; end if;
        when DONE => s_st<=IDLE;
        when others => s_st<=IDLE;
      end case;
    end if;
  end process;
  y<=s_cnt;
end architecture bh;
