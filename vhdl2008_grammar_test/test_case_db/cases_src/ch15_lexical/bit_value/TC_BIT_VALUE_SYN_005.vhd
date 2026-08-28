-- =============================================================
-- Case ID: TC_BIT_VALUE_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_BIT_VALUE
-- Standard Reference: IEEE 1076-2008 Section 15.8
-- Production: bit_value ::= graphic_character { [ underline ] graphic_character }
-- Case Type: Positive
-- Test Focus: graphic_character sequence of bit_value under octal(O"377") and decimal(D"255") base_specifiers — verify extended digit sequences under non-binary/hexadecimal specifiers are legal
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bv_octal_decimal is
  port (
    oct : out bit_vector(8 downto 0);
    dec : out bit_vector(7 downto 0)
  );
end entity bv_octal_decimal;

architecture rtl of bv_octal_decimal is
  constant C_OCT : bit_vector(8 downto 0) := O"377";
  constant C_DEC : bit_vector(7 downto 0) := D"255";
begin
  oct <= C_OCT;
  dec <= C_DEC;
end architecture rtl;
