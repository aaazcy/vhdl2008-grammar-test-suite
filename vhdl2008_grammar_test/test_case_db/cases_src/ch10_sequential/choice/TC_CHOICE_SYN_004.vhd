-- =============================================================
-- Case ID: TC_CHOICE_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CHOICE
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: choice ::= simple_expression | discrete_range | element_simple_name | others
-- Case Type: Positive
-- Test Focus: choice: element_simple_name with multiple names separated by ｜ in when clause
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity choice_syn4_ent is port(sel:in integer range 0 to 7; y:out integer); end entity;
architecture bh of choice_syn4_ent is
begin
  process(sel) is
  begin
    case sel is
      when 0|2|4|6 => y <= 100;
      when 1|3|5|7 => y <= 200;
    end case;
  end process;
end architecture bh;
