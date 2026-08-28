-- =============================================================
-- Case ID: TC_PROCESS_STATEMENT_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCESS_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Production: process_statement ::= [ process_label : ] process [ ( process_sensitivity_list ) ] [ is ] process_declarative_part begin process_statement_part end process [ process_label ] ;
-- Case Type: Positive
-- Test Focus: Labeled process with declarative part: contains process_label "p_fsm" + is, a declarative part with type (enum t_state IDLE, BUSY, DONE) / variable (v_st with init), a body with a case FSM + async reset (if rst_n), and end process with the label, verifying the full process form——label + is + declarative part + label closure
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity proc_label_ent is port(clk,rst_n:in bit; start:in bit; done:out bit); end entity;
architecture bh of proc_label_ent is
begin
  p_fsm:process(clk,rst_n) is
    type t_state is (IDLE, BUSY, DONE_ST);
    variable v_st:t_state:=IDLE;
  begin
    if rst_n='0' then v_st:=IDLE; done<='0';
    elsif clk'event and clk='1' then
      case v_st is
        when IDLE => if start='1' then v_st:=BUSY; end if;
        when BUSY => v_st:=DONE_ST;
        when DONE_ST => done<='1'; v_st:=IDLE;
      end case;
    end if;
  end process p_fsm;
end architecture bh;
