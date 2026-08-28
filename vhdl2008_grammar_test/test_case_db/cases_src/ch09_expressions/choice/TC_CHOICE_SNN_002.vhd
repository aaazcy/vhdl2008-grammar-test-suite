-- =============================================================
-- Case ID: TC_CHOICE_SNN_002
-- Rule Type: Syntax
-- BNF Production: choice
-- IEEE Section: 9.3.3.1
-- BNF Text: choice ::= simple_expression | discrete_range | element_simple_name | others
-- Test Focus: type mismatch in choice - integer choice for bit_vector case expression
-- Case Type: Negative
-- Expected Result: Triggers semantic error (type mismatch between choice and case expression)
-- Dependencies: None
-- =============================================================
entity tc_choice_snn_002 is
  port (
    sel    : in  bit_vector(1 downto 0);
    result : out integer
  );
end entity tc_choice_snn_002;

architecture error of tc_choice_snn_002 is
begin
  process(sel)
  begin
    case sel is
      when "00" => result <= 0;
      when 1    => result <= 1;  -- ERROR: integer choice incompatible with bit_vector case expression
      when others => result <= 2;
    end case;
  end process;
end architecture error;
