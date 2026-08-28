-- =============================================================
-- Case ID: TC_NULL_STATEMENT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_NULL_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.14
-- Production: null_statement ::= [ label : ] null ;
-- Case Type: Positive
-- Test Focus: null in an FSM state machine: null in different state branches means no operation, verifying null as a placeholder wait in state machine design
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity null_fsm_ent is
  port (
    clk   : in  bit;
    rst_n : in  bit;
    state : out integer range 0 to 3
  );
end entity null_fsm_ent;

architecture fsm of null_fsm_ent is
  type t_state is (IDLE, BUSY, DONE, ERROR);
  signal s_curr : t_state := IDLE;
begin
  process(clk) is
  begin
    if clk'event and clk = '1' then
      if rst_n = '0' then
        s_curr <= IDLE;
      else
        case s_curr is
          when IDLE  => s_curr <= BUSY;
          when BUSY  => null;  -- waiting for completion
          when DONE  => s_curr <= IDLE;
          when ERROR => null;  -- stay in error until reset
        end case;
      end if;
    end if;
  end process;
  state <= t_state'pos(s_curr);
end architecture fsm;
