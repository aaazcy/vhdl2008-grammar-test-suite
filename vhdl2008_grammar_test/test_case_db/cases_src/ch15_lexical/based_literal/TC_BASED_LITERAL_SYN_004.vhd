-- =============================================================
-- Case ID: TC_BASED_LITERAL_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASED_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: based_literal ::= base # based_integer [ . based_integer ] # [ exponent ]
-- Case Type: Positive
-- Test Focus: based_literal full form(2#1010.01#E3) — integer part + fractional part + exponent all three segments present together, verify the complete syntax with all optional segments of based_literal activated at once
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bl_full_form is
  port (
    val : out real
  );
end entity bl_full_form;

architecture rtl of bl_full_form is
  constant C_FULL : real := 2#1010.01#E3;
begin
  val <= C_FULL;
end architecture rtl;
