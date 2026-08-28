-- =============================================================
-- Case ID: TC_TYPE_CONVERSION_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_TYPE_CONVERSION_CLOSELY_RELATED
-- Standard Reference: IEEE 1076-2008 Section 9.3.5
-- Production: type_conversion ::= type_mark ( expression )
-- Case Type: Positive
-- Rule Description: Type conversion is allowed between closely related types: integer/real, arrays with same dimensions and element types, and between a type and its subtypes.
-- Test Focus: SEM: legal conversion between closely related types — conversions between integer and a user-defined integer subtype, verifying the legal conversion paths within the type hierarchy
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_tc_sem_001 is
  port (
    x : in  integer;
    y : out integer
  );
end entity ent_tc_sem_001;

architecture related_conv of ent_tc_sem_001 is
  type t_my_int is range -128 to 127;
  signal s_a : t_my_int;
  signal s_b : integer;
begin
  s_a <= t_my_int(x);
  s_b <= integer(s_a);
  y <= s_b;
end architecture related_conv;
