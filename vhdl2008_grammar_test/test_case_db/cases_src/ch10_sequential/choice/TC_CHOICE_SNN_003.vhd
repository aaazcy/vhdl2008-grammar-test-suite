-- =============================================================
-- Case ID: TC_CHOICE_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CHOICE
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: choice ::= simple_expression | discrete_range | element_simple_name | others
-- Case Type: Negative
-- Test Focus: SNN: missing delimiter between two choices in the choices list - in when 0 1 => the 0 and 1 are directly adjacent, choices must be separated by the choice delimiter
-- Expected Result: Triggers syntax error: '=>' is expected instead of '<integer>'
-- Dependencies: None
-- =============================================================
entity choice_missing_bar is port(sel:in integer range 0 to 3; y:out integer); end entity;
architecture vhdl2008 of choice_missing_bar is
begin
  process(sel) begin
    case sel is
      when 0 1 => y <= 1;
      when others => y <= 0;
    end case;
  end process;
end architecture vhdl2008;
