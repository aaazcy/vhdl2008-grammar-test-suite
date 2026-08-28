-- =============================================================
-- Case ID: TC_EXTENDED_DIGIT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTENDED_DIGIT
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: extended_digit ::= digit | letter
-- Case Type: Positive
-- Test Focus: Pure digits (0-9) used as extended_digit in a based literal, verifying the digit branch
-- Expected Result: Compiles
-- Dependencies: None
-- =============================================================
entity ext_dig_digit_only is
  port (
    val_out : out integer
  );
end entity ext_dig_digit_only;

architecture rtl of ext_dig_digit_only is
  constant C_OCT : integer := 8#377#;
  constant C_DEC : integer := 10#255#;
  signal s_sum   : integer := 0;
begin
  s_sum   <= C_OCT + C_DEC;
  val_out <= s_sum;
end architecture rtl;
