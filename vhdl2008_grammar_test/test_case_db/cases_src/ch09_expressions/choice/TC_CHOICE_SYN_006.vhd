-- =============================================================
-- Case ID: TC_CHOICE_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_CHOICE
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: choice ::= simple_expression | discrete_range | element_simple_name | others
-- Case Type: Positive
-- Test Focus: discrete_range with 'downto' direction: descending discrete ranges such as 7 downto 4, 3 downto 0 used as choices, applied in the bit scan of a priority encoder
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ch_range_downto is
  port (
    byte_in  : in  integer range 0 to 255;
    hi_bit   : out integer range 0 to 7
  );
end entity ch_range_downto;

architecture priority_encoder of ch_range_downto is
begin
  process(byte_in)
  begin
    case byte_in is
      when 0 =>
        hi_bit <= 0;
      when 127 downto 1 =>
        hi_bit <= 6;
      when 128 to 191 =>
        hi_bit <= 7;
      when 192 to 254 =>
        hi_bit <= 7;
      when others =>
        hi_bit <= 7;
    end case;
  end process;
end architecture priority_encoder;
