-- =============================================================
-- Case ID: TC_CHOICE_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_CHOICE
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: choice ::= simple_expression | discrete_range | element_simple_name | others
-- Case Type: Positive
-- Test Focus: choice: discrete_range (0 to 1) and (2 to 3) covering integer range via ranges
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity choice_syn2_ent is port(sel:in integer range 0 to 3; y:out integer); end entity;
architecture bh of choice_syn2_ent is
begin
  process(sel) is
  begin
    case sel is
      when 0 to 1 => y <= 50;
      when 2 to 3 => y <= 75;
    end case;
  end process;
end architecture bh;
