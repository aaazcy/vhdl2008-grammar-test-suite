-- =============================================================
-- Case ID: TC_SELECTED_VARIABLE_ASSIGNMENT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_VARIABLE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: selected_variable_assignment ::= with expression select [ ? ] target := selected_expressions ;
-- Case Type: Positive
-- Test Focus: Selected variable assignment with label + enumerated type: label "l_fsm" + selector of enumerated type t_fsm_state + target v_next selects different integer values via with-select based on 3 states, verifying the label and enumerated selector of selected_variable_assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sva_syn3_ent is port(clk:in bit; y:out integer); end entity;
architecture bh of sva_syn3_ent is
  type t_fsm_state is (IDLE, ACTIVE, DONE);
  signal s_res:integer:=0;
begin
  process(clk)
    variable v_state:t_fsm_state:=IDLE;
    variable v_next:integer;
  begin
    if clk'event and clk = '1' then
      l_fsm: with v_state select v_next :=
        0 when IDLE,
        1 when ACTIVE,
        2 when DONE;
      s_res <= v_next;
    end if;
    y <= s_res;
  end process;
end architecture bh;
