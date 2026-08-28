-- =============================================================
-- Case ID: TC_BASED_LITERAL_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASED_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: based_literal ::= base # based_integer [ . based_integer ] # [ exponent ]
-- Case Type: Positive
-- Test Focus: based_literal with fractional part form(16#AB.CD#) — integer part AB + decimal point + fractional part CD, verify the optional [ . based_integer ] segment is legal in based_literal
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bl_with_fractional is
  port (
    val : out real
  );
end entity bl_with_fractional;

architecture rtl of bl_with_fractional is
  constant C_FRAC : real := 16#AB.CD#;
begin
  val <= C_FRAC;
end architecture rtl;
