-- =============================================================
-- Case ID: TC_CHOICE_SYN_002
-- Rule Type: Syntax
-- BNF Production: choice
-- IEEE Section: 9.3.3.1
-- BNF Text: choice ::= simple_expression | discrete_range | element_simple_name | others
-- Test Focus: discrete_range as choice (e.g., "1 to 3" or "7 downto 4") in a case statement
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_choice_syn_002 is
  port (
    data_in  : in  integer range 0 to 15;
    seg_out  : out bit_vector(6 downto 0)
  );
end entity tc_choice_syn_002;

architecture display of tc_choice_syn_002 is
begin
  process(data_in)
  begin
    case data_in is
      when 0 =>
        seg_out <= "1111110";  -- simple_expression choice
      when 1 to 3 =>
        seg_out <= "0110000";  -- discrete_range choice (to)
      when 8 downto 4 =>
        seg_out <= "1101101";  -- discrete_range choice (downto)
      when 10 | 11 | 12 =>
        seg_out <= "1111001";  -- pipe-separated simple_expression choices
      when others =>
        seg_out <= "0000000";  -- others choice
    end case;
  end process;
end architecture display;
