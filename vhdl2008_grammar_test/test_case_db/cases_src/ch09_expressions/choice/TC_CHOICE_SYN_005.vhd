-- =============================================================
-- Case ID: TC_CHOICE_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CHOICE
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: choice ::= simple_expression | discrete_range | element_simple_name | others
-- Case Type: Positive
-- Test Focus: discrete_range with 'to' direction: ascending discrete ranges such as 0 to 3, 4 to 7 used as choices, applied in temperature sensor level classification
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ch_range_to is
  port (
    temp     : in  integer range -40 to 125;
    level    : out integer range 0 to 3
  );
end entity ch_range_to;

architecture temp_sense of ch_range_to is
begin
  process(temp)
  begin
    case temp is
      when -40 to 0 =>
        level <= 0;              -- discrete_range (to) choice: cold
      when 1 to 25 =>
        level <= 1;              -- discrete_range (to) choice: normal
      when 26 to 50 =>
        level <= 2;              -- discrete_range (to) choice: warm
      when 51 to 125 =>
        level <= 3;              -- discrete_range (to) choice: hot
    end case;
  end process;
end architecture temp_sense;
