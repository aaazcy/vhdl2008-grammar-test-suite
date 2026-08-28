-- =============================================================
-- Case ID: TC_EXTENDED_DIGIT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTENDED_DIGIT
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: extended_digit ::= digit | letter
-- Case Type: Positive
-- Test Focus: Uppercase letters as the letter branch of extended_digit in a hexadecimal based literal, letters A-F represent 10-15
-- Expected Result: Compiles
-- Dependencies: None
-- =============================================================
entity ext_dig_upper_letter is
  port (
    val_out : out integer
  );
end entity ext_dig_upper_letter;

architecture rtl of ext_dig_upper_letter is
  constant C_HEX_MAX : integer := 16#FF#;
  constant C_HEX_CA  : integer := 16#CAFE#;
  signal s_mask      : integer := 0;
begin
  s_mask  <= C_HEX_MAX + C_HEX_CA;
  val_out <= s_mask;
end architecture rtl;
