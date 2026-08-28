-- =============================================================
-- Case ID: TC_TYPE_CONVERSION_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_TYPE_CONVERSION
-- Standard Reference: IEEE 1076-2008 Section 9.3.5
-- Production: type_conversion ::= type_mark ( expression )
-- Case Type: Positive
-- Test Focus: integer to real: real(a) explicitly converts an integer signal to real type for arithmetic
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_tc_int2real is
  port (
    a : in  integer;
    y : out real
  );
end entity ent_tc_int2real;

architecture int_to_real of ent_tc_int2real is
begin
  y <= real(a) * 3.14;
end architecture int_to_real;
