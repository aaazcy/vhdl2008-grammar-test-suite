-- =============================================================
-- Case ID: TC_ENUMERATION_TYPE_DEFINITION_SYN_S05
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENUMERATION_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.2
-- Production: enumeration_type_definition ::= ( enumeration_literal { , enumeration_literal } )
-- Case Type: Positive
-- Test Focus: Pure-identifier enumeration type driving a 4-state FSM with registered state transitions -- exercises the parenthesized comma-separated list of enumeration_literal identifiers through a complete Moore-style state machine where each literal represents a distinct machine state
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity enum_fsm_ent is
  port(
    clk   : in  bit;
    rst_n : in  bit;
    start : in  bit;
    done  : out bit
  );
end entity;

architecture rtl of enum_fsm_ent is
  type t_state is (IDLE, FETCH, EXECUTE, COMPLETE);
  signal curr_state, next_state : t_state;
begin
  p_fsm_reg : process(clk, rst_n)
  begin
    if rst_n = '0' then
      curr_state <= IDLE;
    elsif clk'event and clk = '1' then
      curr_state <= next_state;
    end if;
  end process;

  p_fsm_next : process(curr_state, start)
  begin
    case curr_state is
      when IDLE =>
        if start = '1' then next_state <= FETCH;
        else               next_state <= IDLE;
        end if;
      when FETCH     => next_state <= EXECUTE;
      when EXECUTE   => next_state <= COMPLETE;
      when COMPLETE  => next_state <= IDLE;
    end case;
  end process;

  p_fsm_out : process(curr_state)
  begin
    case curr_state is
      when COMPLETE => done <= '1';
      when others   => done <= '0';
    end case;
  end process;
end architecture rtl;
