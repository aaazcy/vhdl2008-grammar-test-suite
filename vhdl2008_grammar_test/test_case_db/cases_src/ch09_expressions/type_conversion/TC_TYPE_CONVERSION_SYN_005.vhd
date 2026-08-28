-- =============================================================
-- Case ID: TC_TYPE_CONVERSION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_TYPE_CONVERSION
-- Standard Reference: IEEE 1076-2008 Section 9.3.5
-- Production: type_conversion ::= type_mark ( expression )
-- Case Type: Positive
-- Test Focus: user-defined integer type conversion: t_byte(a) converts integer to a user-defined subtype with range 0-255
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_tc_subtype is
  port (
    a : in  integer;
    y : out integer
  );
end entity ent_tc_subtype;

architecture sub_conv of ent_tc_subtype is
  type t_byte is range 0 to 255;
  signal s_b : t_byte;
begin
  s_b <= t_byte(a);
  y <= integer(s_b);
end architecture sub_conv;
