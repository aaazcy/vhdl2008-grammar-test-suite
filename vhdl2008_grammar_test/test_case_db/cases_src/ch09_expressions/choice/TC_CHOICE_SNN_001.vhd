-- =============================================================
-- Case ID: TC_CHOICE_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CHOICE
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: choice ::= simple_expression | discrete_range | element_simple_name | others
-- Case Type: Negative
-- Test Focus: SNN: duplicate choice label in a case: the simple_expression 0 appears twice in when 0, making the case choice not unique
-- Expected Result: Triggers error: duplicate choice label "0" in case statement
-- Dependencies: None
-- =============================================================
entity ch_snn_001 is
  port (
    sel : in  integer range 0 to 3;
    y   : out integer
  );
end entity ch_snn_001;

architecture dup_choice of ch_snn_001 is
begin
  process(sel)
  begin
    case sel is
      when 0 =>    -- first occurrence
        y <= 10;
      when 0 =>    -- ERROR: duplicate choice label
        y <= 20;
      when others =>
        y <= 0;
    end case;
  end process;
end architecture dup_choice;
