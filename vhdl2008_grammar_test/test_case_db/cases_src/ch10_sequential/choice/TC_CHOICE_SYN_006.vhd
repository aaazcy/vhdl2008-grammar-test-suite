-- =============================================================
-- Case ID: TC_CHOICE_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_CHOICE
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: choice ::= simple_expression | discrete_range | element_simple_name | others
-- Case Type: Positive
-- Test Focus: choice: discrete_range using subtype attribute 'range as descending range in case alternative
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity choice_syn6_ent is port(addr:in integer range 0 to 15; y:out bit); end entity;
architecture bh of choice_syn6_ent is
  constant C_LO:integer:=0;
  constant C_HI:integer:=7;
begin
  process(addr) is
  begin
    y <= '0';
    case addr is
      when C_LO to C_HI      => y <= '1';
      when 8 to 12           => y <= '0';
      when 13|14|15          => y <= '1';
    end case;
  end process;
end architecture bh;
