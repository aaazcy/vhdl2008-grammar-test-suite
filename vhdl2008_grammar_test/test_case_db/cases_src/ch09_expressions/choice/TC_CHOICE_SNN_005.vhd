-- =============================================================
-- Case ID: TC_CHOICE_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CHOICE
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: choice ::= simple_expression | discrete_range | element_simple_name | others
-- Case Type: Negative
-- Test Focus: SNN: choice type does not match the case expression type: the case expression is of type bit_vector, but choice '0' is of type character, so the types are incompatible
-- Expected Result: Triggers type mismatch error: choice type character does not match case expression type bit_vector
-- Dependencies: None
-- =============================================================
entity ch_snn_005 is
  port (
    sel : in  bit_vector(1 downto 0);
    y   : out integer
  );
end entity ch_snn_005;

architecture type_mismatch of ch_snn_005 is
begin
  process(sel)
  begin
    case sel is
      when '0' =>   -- ERROR: character literal, not bit_vector literal
        y <= 10;
      when others =>
        y <= 0;
    end case;
  end process;
end architecture type_mismatch;
