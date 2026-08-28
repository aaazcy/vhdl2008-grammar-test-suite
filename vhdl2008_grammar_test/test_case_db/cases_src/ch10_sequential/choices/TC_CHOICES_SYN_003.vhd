-- =============================================================
-- Case ID: TC_CHOICES_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CHOICES
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: choices ::= choice { | choice }
-- Case Type: Positive
-- Test Focus: choices: mix of discrete_range and simple_expression via pipe (0｜2 to 4｜6)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity choices_syn3_ent is port(sel:in integer range 0 to 7; y:out integer); end entity;
architecture bh of choices_syn3_ent is
begin
  process(sel) is
  begin
    case sel is
      when 0|2 to 4|6 => y <= 10;
      when 1|5|7 => y <= 20;
    end case;
  end process;
end architecture bh;
