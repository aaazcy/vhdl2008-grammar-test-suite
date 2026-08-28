-- =============================================================
-- Case ID: TC_CHOICES_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_CHOICES
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: choices ::= choice { | choice }
-- Case Type: Positive
-- Test Focus: choices: multiple choices via pipe (0｜2｜4｜6) and (1｜3｜5｜7)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity choices_syn2_ent is port(sel:in integer range 0 to 7; y:out integer); end entity;
architecture bh of choices_syn2_ent is
begin
  process(sel) is
  begin
    case sel is
      when 0|2|4|6 => y <= 100;
      when 1|3|5|7 => y <= 200;
    end case;
  end process;
end architecture bh;
