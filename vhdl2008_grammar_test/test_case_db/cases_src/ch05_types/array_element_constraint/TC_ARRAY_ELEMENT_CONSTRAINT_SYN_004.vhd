-- =============================================================
-- Case ID: TC_ARRAY_ELEMENT_CONSTRAINT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARRAY_ELEMENT_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: array_element_constraint ::= element_constraint
-- Case Type: Positive
-- Test Focus: element_constraint wrapping an enumeration range.
--            An array of FSM states with constrained element subtype
--            for an I2C bus controller state tracker.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity i2c_state_tracker is
  port (
    clk        : in  bit;
    next_st    : in  integer range 0 to 5;
    cur_st     : out integer range 0 to 5
  );
end entity i2c_state_tracker;

architecture rtl of i2c_state_tracker is
  type i2c_phase is (IDLE, START, ADDR, ACK, DATA, STOP);
  -- array_element_constraint: enumeration element constrained
  subtype active_phase is i2c_phase range START to DATA;
  type phase_history is array (0 to 7) of active_phase;
  signal past_phases : phase_history := (others => IDLE);
  signal idx : integer range 0 to 7 := 0;
begin
  process(clk)
    variable v_val : i2c_phase;
  begin
    if clk'event and clk = '1' then
      case next_st is
        when 0 => v_val := IDLE;
        when 1 => v_val := START;
        when 2 => v_val := ADDR;
        when 3 => v_val := ACK;
        when 4 => v_val := DATA;
        when 5 => v_val := STOP;
        when others => v_val := IDLE;
      end case;
      past_phases(idx) <= v_val;
      idx <= (idx + 1) mod 8;
      cur_st <= next_st;
    end if;
  end process;
end architecture rtl;
