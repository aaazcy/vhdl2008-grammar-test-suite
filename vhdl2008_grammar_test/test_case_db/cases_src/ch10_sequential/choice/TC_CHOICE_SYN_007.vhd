-- =============================================================
-- Case ID: TC_CHOICE_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_CHOICE
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: choice ::= simple_expression | discrete_range | element_simple_name | others
-- Case Type: Positive
-- Test Focus: choice: simple_expression using computed constant expression as case choice value
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity choice_syn7_ent is port(sel:in integer range 0 to 7; y:out integer); end entity;
architecture bh of choice_syn7_ent is
  constant C_BASE:integer:=4;
begin
  process(sel) is
  begin
    case sel is
      when C_BASE           => y <= 100;
      when C_BASE+1         => y <= 200;
      when C_BASE+2         => y <= 300;
      when C_BASE+3         => y <= 400;
      when 0 to C_BASE-1    => y <= 50;
    end case;
  end process;
end architecture bh;
