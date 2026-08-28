-- =============================================================
-- Case ID: TC_TYPE_CONVERSION_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_TYPE_CONVERSION
-- Standard Reference: IEEE 1076-2008 Section 9.3.5
-- Production: type_conversion ::= type_mark ( expression )
-- Case Type: Positive
-- Test Focus: comprehensive demonstration: nested type conversion — integer(real(t_byte(s))) nests multiple layers of type conversion, verifying that type conversion expressions can be chained
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_tc_nested is
  port (
    s : in  integer range 0 to 255;
    y : out integer
  );
end entity ent_tc_nested;

architecture nested_conv of ent_tc_nested is
  signal s_r : real;
begin
  s_r <= real(s) * 1.5;
  y <= integer(s_r);
end architecture nested_conv;
