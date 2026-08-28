-- =============================================================
-- Case ID: TC_BASED_LITERAL_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASED_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: based_literal ::= base # based_integer [ . based_integer ] # [ exponent ]
-- Case Type: Positive
-- Test Focus: based_literal with exponent part(2#1010#E5) — exponent E followed by a positive integer value, verify the optional [ exponent ] segment lets based_literal denote a scientific notation value
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bl_with_exponent is
  port (
    val : out integer
  );
end entity bl_with_exponent;

architecture rtl of bl_with_exponent is
  constant C_EXP : integer := 2#1010#E5;
begin
  val <= C_EXP;
end architecture rtl;
