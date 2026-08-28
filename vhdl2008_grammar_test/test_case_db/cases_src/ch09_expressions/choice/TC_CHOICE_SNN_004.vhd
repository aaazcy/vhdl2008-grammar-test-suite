-- =============================================================
-- Case ID: TC_CHOICE_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CHOICE
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: choice ::= simple_expression | discrete_range | element_simple_name | others
-- Case Type: Negative
-- Test Focus: SNN: others not in the last branch of a case: an others choice must be in the last position of a case statement or aggregate; appearing in the middle is a syntax error
-- Expected Result: Triggers syntax error: "others" choice must be the last alternative
-- Dependencies: None
-- =============================================================
entity ch_snn_004 is
  port (
    sel : in  integer range 0 to 3;
    y   : out integer
  );
end entity ch_snn_004;

architecture others_not_last of ch_snn_004 is
begin
  process(sel)
  begin
    case sel is
      when others =>   -- ERROR: others must be the last choice
        y <= 0;
      when 1 =>
        y <= 10;
    end case;
  end process;
end architecture others_not_last;
