-- =============================================================
-- Case ID: TC_INTEGER_TYPE_DEFINITION_SYN_S03
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTEGER_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: integer_type_definition ::= range_constraint
-- Case Type: Positive
-- Test Focus: nested subtypes with progressively tighter constraints
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity int_spc3_ent is port(r:out integer); end entity;
architecture bh of int_spc3_ent is
  type t_base is range -128 to 127;
  subtype t_pos  is t_base range 0 to 127;
  subtype t_small is t_pos range 0 to 15;
  subtype t_tiny  is t_small range 0 to 7;
  signal s_base : t_base := 0;
  signal s_pos  : t_pos := 10;
  signal s_small: t_small := 5;
  signal s_tiny : t_tiny := 3;
begin
  s_pos <= s_base;
  s_small <= s_pos;
  s_tiny <= s_small;
  r <= integer(s_tiny);
end architecture bh;
