-- =============================================================
-- Case ID: TC_TYPE_CONVERSION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_TYPE_CONVERSION
-- Standard Reference: IEEE 1076-2008 Section 9.3.5
-- Production: type_conversion ::= type_mark ( expression )
-- Case Type: Positive
-- Test Focus: minimal form: integer(s) converts a user-defined integer subtype to the predefined integer type
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_tc_int is
  port (
    s : in  integer;
    y : out integer
  );
end entity ent_tc_int;

architecture simple_conv of ent_tc_int is
begin
  y <= integer(s);
end architecture simple_conv;
