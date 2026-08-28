-- =============================================================
-- Case ID: TC_EXTENDED_DIGIT_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTENDED_DIGIT
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: extended_digit ::= digit | letter
-- Case Type: Positive
-- Test Focus: Based literals of several different bases use extended_digit, from base-2 to base-16, verifying applicability of digit/letter under different bases
-- Expected Result: Compiles
-- Dependencies: None
-- =============================================================
entity ext_dig_multi_base is
  port (
    b2_out  : out integer;
    b8_out  : out integer;
    b16_out : out integer
  );
end entity ext_dig_multi_base;

architecture rtl of ext_dig_multi_base is
  constant C_BIN : integer := 2#1010_1100#;
  constant C_OCT : integer := 8#377#;
  constant C_HEX : integer := 16#F0E1_D2C3#;
begin
  b2_out  <= C_BIN;
  b8_out  <= C_OCT;
  b16_out <= C_HEX;
end architecture rtl;
