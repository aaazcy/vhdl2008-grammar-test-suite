-- =============================================================
-- Case ID: TC_CHOICES_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CHOICES
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: choices ::= choice { | choice }
-- Case Type: Positive
-- Test Focus: choices: single choice with discrete_range covering entire integer subtype range in case statement
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity choices_syn5_ent is port(addr:in integer range 0 to 7; y:out bit); end entity;
architecture bh of choices_syn5_ent is
begin
  process(addr) is
  begin
    case addr is
      when 0 to 3   => y <= '1';
      when 4 to 7   => y <= '0';
    end case;
  end process;
end architecture bh;
