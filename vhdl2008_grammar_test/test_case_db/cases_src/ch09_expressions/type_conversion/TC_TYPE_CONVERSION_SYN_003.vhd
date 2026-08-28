-- =============================================================
-- Case ID: TC_TYPE_CONVERSION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_TYPE_CONVERSION
-- Standard Reference: IEEE 1076-2008 Section 9.3.5
-- Production: type_conversion ::= type_mark ( expression )
-- Case Type: Positive
-- Test Focus: real to integer: integer(r) explicitly converts real type to integer (truncation), verifying the floating-point to integer type conversion
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_tc_real2int is
  port (
    r : in  real;
    y : out integer
  );
end entity ent_tc_real2int;

architecture real_to_int of ent_tc_real2int is
begin
  y <= integer(r);
end architecture real_to_int;
