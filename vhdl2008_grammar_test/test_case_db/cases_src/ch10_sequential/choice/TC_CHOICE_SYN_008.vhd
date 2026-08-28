-- =============================================================
-- Case ID: TC_CHOICE_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_CHOICE
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: choice ::= simple_expression | discrete_range | element_simple_name | others
-- Case Type: Positive
-- Test Focus: choice: others keyword as catch-all in case statement covering std_ulogic vector
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity choice_syn8_ent is port(op:in bit_vector(1 downto 0); y:out integer); end entity;
architecture bh of choice_syn8_ent is
begin
  process(op) is
  begin
    case op is
      when "00"   => y <= 0;
      when "01"   => y <= 1;
      when "10"   => y <= 2;
      when others => y <= 3;
    end case;
  end process;
end architecture bh;
