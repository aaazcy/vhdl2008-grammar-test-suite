-- =============================================================
-- Case ID: TC_INTEGER_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTEGER
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: integer ::= digit { [ underline ] digit }
-- Case Type: Positive
-- Test Focus: Single-digit integer literals (0-9), testing the minimal form of integer — a single digit
-- Expected Result: Compiles
-- Dependencies: None
-- =============================================================
entity int_single_digit is
  port (
    val_out : out integer
  );
end entity int_single_digit;

architecture rtl of int_single_digit is
  constant C_ZERO : integer := 0;
  constant C_NINE : integer := 9;
  signal s_sum    : integer := 0;
begin
  s_sum   <= C_ZERO + C_NINE;
  val_out <= s_sum;
end architecture rtl;
