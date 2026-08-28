-- =============================================================
-- Case ID: TC_CHOICE_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_CHOICE
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: choice ::= simple_expression | discrete_range | element_simple_name | others
-- Case Type: Negative
-- Rule Description: When an element_simple_name choice is used inside an aggregate, the identifier must reference a declared field name of the record; a choice value in a case must lie within the value range of the case expression
-- Error Category: choice_out_of_range
-- Test Focus: SMN: a choice value in a case outside the range of the case expression: expr is an integer of 0..7, but the when 10 choice value is not within its range
-- Expected Result: Triggers semantic error: choice value 10 is outside the range of case expression (0 to 7)
-- Dependencies: None
-- =============================================================
entity ch_smn_001 is
  port (
    sel : in  integer range 0 to 7;
    y   : out integer
  );
end entity ch_smn_001;

architecture out_of_range of ch_smn_001 is
begin
  process(sel)
  begin
    case sel is
      when 0 =>
        y <= 10;
      when 10 =>   -- ERROR: choice 10 outside range 0 to 7 of sel
        y <= 20;
      when others =>
        y <= 0;
    end case;
  end process;
end architecture out_of_range;
