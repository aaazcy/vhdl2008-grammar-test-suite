-- =============================================================
-- Case ID: TC_CHOICES_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CHOICES
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: choices ::= choice { | choice }
-- Case Type: Positive
-- Test Focus: choices: single choice (no pipe) - case statement with one-value-per-when
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity choices_syn1_ent is port(sel:in integer range 0 to 3; y:out integer); end entity;
architecture bh of choices_syn1_ent is
begin
  process(sel) is
  begin
    case sel is
      when 0 => y <= 10;
      when 1 => y <= 20;
      when 2 => y <= 30;
      when 3 => y <= 40;
    end case;
  end process;
end architecture bh;
