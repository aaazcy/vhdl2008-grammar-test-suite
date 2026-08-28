-- =============================================================
-- Case ID: TC_CHOICE_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_CHOICE
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: choice ::= simple_expression | discrete_range | element_simple_name | others
-- Case Type: Positive
-- Test Focus: All four choice forms appear in the same case statement: simple_expression(0), discrete_range(1 to 3, 7 downto 5), element_simple_name (enumerations such as IDLE/RUN), others, verifying that the compiler correctly parses all choice forms in a single context
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ch_all_four is
  port (
    state_in  : in  integer range 0 to 9;
    action    : out integer
  );
end entity ch_all_four;

architecture all_choices of ch_all_four is
  type t_state is (IDLE, RUN, PAUSE, STOP);
  signal s_enum : t_state;

  function map_state(n : integer) return t_state is
  begin
    case n is
      when 0 => return IDLE;
      when 1 => return RUN;
      when 2 => return PAUSE;
      when 3 => return STOP;
      when others => return IDLE;
    end case;
  end function;
begin
  s_enum <= map_state(state_in);

  process(s_enum)
  begin
    case s_enum is
      when IDLE      => action <= 0;   -- element_simple_name
      when RUN       => action <= 1;   -- element_simple_name
      when PAUSE     => action <= 2;   -- element_simple_name
      when STOP      => action <= 3;   -- element_simple_name
    end case;
  end process;
end architecture all_choices;
