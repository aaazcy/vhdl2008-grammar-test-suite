-- =============================================================
-- Case ID: TC_BASED_INTEGER_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASED_INTEGER
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: based_integer ::= extended_digit { [ underline ] extended_digit }
-- Case Type: Positive
-- Test Focus: based_integer minimal form — single extended_digit without underscore(2#1#): verify a single digit character as the smallest based_integer is legal in based_literal
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bi_single_digit is
  port (
    val : out integer
  );
end entity bi_single_digit;

architecture rtl of bi_single_digit is
  constant C_ONE : integer := 2#1#;
begin
  val <= C_ONE;
end architecture rtl;
