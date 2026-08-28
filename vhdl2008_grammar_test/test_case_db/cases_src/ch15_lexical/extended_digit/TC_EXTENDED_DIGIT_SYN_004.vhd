-- =============================================================
-- Case ID: TC_EXTENDED_DIGIT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTENDED_DIGIT
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: extended_digit ::= digit | letter
-- Case Type: Positive
-- Test Focus: Lowercase letters as extended_digit in a based literal, testing recognition of lower_case_letter as a letter sub-branch
-- Expected Result: Compiles
-- Dependencies: None
-- =============================================================
entity ext_dig_lower_letter is
  port (
    val_out : out integer
  );
end entity ext_dig_lower_letter;

architecture rtl of ext_dig_lower_letter is
  constant C_HEX_A : integer := 16#a#;
  constant C_HEX_F : integer := 16#f#;
  constant C_HEX_B : integer := 16#b#;
  signal s_or_val : integer := 0;
begin
  s_or_val <= C_HEX_A + C_HEX_B + C_HEX_F;
  val_out  <= s_or_val;
end architecture rtl;
