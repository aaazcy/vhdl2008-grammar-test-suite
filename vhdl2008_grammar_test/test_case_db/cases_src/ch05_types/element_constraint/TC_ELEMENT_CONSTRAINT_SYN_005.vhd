-- =============================================================
-- Case ID: TC_ELEMENT_CONSTRAINT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: element_constraint ::= array_constraint
--              | record_constraint
-- Case Type: Positive
-- Test Focus: element_constraint with array_constraint using
--            enumeration-based index. A prioritized FSM transition
--            table keyed by state enumeration.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity fsm_transition_table is
  port (
    cur_st  : in  integer range 0 to 3;
    input_v : in  integer range 0 to 1;
    next_st : out integer range 0 to 3;
    output_v: out bit
  );
end entity fsm_transition_table;

architecture rtl of fsm_transition_table is
  type fsm_state is (S0, S1, S2, S3);
  type fsm_input is (ZERO, ONE);
  type transition_t is record
    nxt_state : fsm_state;
    out_val   : bit;
  end record;
  -- element_constraint via record_constraint in array
  type trans_table is array (fsm_state, fsm_input) of transition_t;
  constant tt : trans_table := (
    S0 => (ZERO => (nxt_state => S0, out_val => '0'),
           ONE  => (nxt_state => S1, out_val => '0')),
    S1 => (ZERO => (nxt_state => S2, out_val => '0'),
           ONE  => (nxt_state => S1, out_val => '1')),
    S2 => (ZERO => (nxt_state => S3, out_val => '0'),
           ONE  => (nxt_state => S0, out_val => '1')),
    S3 => (ZERO => (nxt_state => S0, out_val => '1'),
           ONE  => (nxt_state => S1, out_val => '0'))
  );
  signal state    : fsm_state := S0;
  signal inp_enum : fsm_input;
begin
  inp_enum <= ZERO when input_v = 0 else ONE;
  state    <= tt(state, inp_enum).nxt_state;
  process(state)
  begin
    case state is
      when S0 => next_st <= 0;
      when S1 => next_st <= 1;
      when S2 => next_st <= 2;
      when S3 => next_st <= 3;
    end case;
  end process;
  output_v <= tt(state, inp_enum).out_val;
end architecture rtl;
