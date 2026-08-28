-- =============================================================
-- Case ID: TC_EXTENDED_DIGIT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTENDED_DIGIT
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: extended_digit ::= digit | letter
-- Case Type: Positive
-- Test Focus: extended_digit with mixed uppercase/lowercase letters and digits in a based literal, fully verifying digit+letter combinations
-- Expected Result: Compiles
-- Dependencies: None
-- =============================================================
entity ext_dig_mixed_case is
  port (
    val_out : out integer
  );
end entity ext_dig_mixed_case;

architecture rtl of ext_dig_mixed_case is
  constant C_MIX1 : integer := 16#DeAd#;
  constant C_MIX2 : integer := 16#BeEf#;
  signal s_xor   : integer := 0;
begin
  s_xor   <= C_MIX1 + C_MIX2;
  val_out <= s_xor;
end architecture rtl;
