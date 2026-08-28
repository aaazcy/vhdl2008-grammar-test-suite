-- =============================================================
-- Case ID: TC_EXTENDED_DIGIT_SYN_S01
-- Rule Type: Syntax
-- BNF Production: EXTENDED_DIGIT
-- IEEE Section: 15.5.3
-- BNF Text: extended_digit ::= digit | letter
-- Test Focus: Extended digits 0-9 (digit subclass) in a based integer literal
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity extended_digit_syn_s01 is
  port (
    val_out : out integer
  );
end entity extended_digit_syn_s01;

architecture bh of extended_digit_syn_s01 is
  -- Extended digits 0-9 in a decimal based literal
  constant C_DIGITS : integer := 10#9876543210#;
  signal s_result   : integer := 0;
begin
  s_result <= C_DIGITS;
  val_out  <= s_result;
end architecture bh;
