-- =============================================================
-- Case ID: TC_RANGE_SYN_003
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: range ::= range_attribute_name | simple_expression direction simple_expression
-- Test Focus: Tests range_attribute_name with 'reverse_range over an
--   array of an enumerated type. Walks a state enum in reverse order, using the
--   attribute, verifying that reverse_range produces a valid
--   descending iteration range.
-- Expected Result: Compiles; state output cycles in reverse
-- Dependencies: None
-- =============================================================
entity range_reverse_attr is
  port (
    clk     : in  bit;
    state_out : out integer
  );
end entity range_reverse_attr;

architecture reverse_range_attr of range_reverse_attr is
  type t_phase is (INIT, CONFIG, ACTIVE, IDLE, SHUTDOWN);
  type t_phase_arr is array(0 to 4) of t_phase;
  constant PHASES : t_phase_arr := (INIT, CONFIG, ACTIVE, IDLE, SHUTDOWN);
  signal phase : t_phase := SHUTDOWN;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      for i in PHASES'reverse_range loop
        if PHASES(i) = phase then
          if phase = INIT then
            phase <= SHUTDOWN;
          else
            phase <= t_phase'pred(phase);
          end if;
        end if;
      end loop;
    end if;
  end process;
  state_out <= t_phase'pos(phase);
end architecture reverse_range_attr;
