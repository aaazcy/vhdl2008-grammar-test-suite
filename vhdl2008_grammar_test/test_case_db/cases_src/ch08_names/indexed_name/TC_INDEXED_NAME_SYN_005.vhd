-- =============================================================
-- Case ID: TC_INDEXED_NAME_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_INDEXED_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.4
-- Production: indexed_name ::= prefix ( expression { , expression } )
-- Case Type: Positive
-- Test Focus: Enumeration type as the index expression — s_state_arr(IDLE) uses the enumeration literal IDLE as the array index; the expression is in enumeration_literal form, verifying that indexed_name supports enumeration type indexes
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity idx_name_enum_idx is
  port(state_in : in bit; state_val : out integer);
end entity;

architecture vhdl2008 of idx_name_enum_idx is
  type t_fsm_state is (IDLE, RUN, WAITING, DONE);
  type t_state_arr is array(t_fsm_state) of integer;
  signal s_states : t_state_arr := (IDLE=>0, RUN=>1, WAITING=>2, DONE=>3);
  signal current : t_fsm_state := IDLE;
  signal val : integer := 0;
begin
  process(state_in)
  begin
    if rising_edge(state_in) then
      case current is
        when IDLE => current <= RUN;
        when RUN  => current <= WAITING;
        when WAITING => current <= DONE;
        when DONE => current <= IDLE;
      end case;
    end if;
    val <= s_states(current);
  end process;
  state_val <= val;
end architecture vhdl2008;
