-- =============================================================
-- Case ID: TC_CHOICES_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CHOICES
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: choices ::= choice { | choice }
-- Case Type: Positive
-- Test Focus: Three choices with pipes combining different forms: discrete_range(0 to 1) ｜ simple_expression(4) ｜ element_simple_name(RESET) — verifying the ability of pipes to join different choice forms
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity chs_three_mixed is
  port (
    state_in : in  integer range 0 to 7;
    action   : out integer
  );
end entity chs_three_mixed;

architecture mixed_choices of chs_three_mixed is
begin
  process(state_in)
  begin
    case state_in is
      when 0 | 1 | 2 =>       -- three simple_expressions
        action <= 1;
      when 3 | 4 | 5 =>       -- three simple_expressions
        action <= 2;
      when 6 | 7 =>           -- two simple_expressions
        action <= 3;
    end case;
  end process;
end architecture mixed_choices;
