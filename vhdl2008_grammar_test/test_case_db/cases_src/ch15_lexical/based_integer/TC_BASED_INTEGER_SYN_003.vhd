-- =============================================================
-- Case ID: TC_BASED_INTEGER_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASED_INTEGER
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: based_integer ::= extended_digit { [ underline ] extended_digit }
-- Case Type: Positive
-- Test Focus: based_integer in multi-group underscore-separated form(2#1111_0000_1010_0101#): verify extended_digit sequences separated by multiple underscores are legal in based_integer, each group with multiple digits
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bi_multi_underscore is
  port (
    val : out integer
  );
end entity bi_multi_underscore;

architecture rtl of bi_multi_underscore is
  constant C_B16 : integer := 2#1111_0000_1010_0101#;
begin
  val <= C_B16;
end architecture rtl;
