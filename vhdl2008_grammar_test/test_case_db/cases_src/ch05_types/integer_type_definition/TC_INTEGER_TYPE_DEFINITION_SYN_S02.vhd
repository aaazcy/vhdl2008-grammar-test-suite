-- =============================================================
-- Case ID: TC_INTEGER_TYPE_DEFINITION_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTEGER_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: integer_type_definition ::= range_constraint
-- Case Type: Positive
-- Test Focus: integer with expression-based bounds
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity int_spc2_ent is port(r:out integer); end entity;
architecture bh of int_spc2_ent is
  constant C_W : integer := 8;
  type t_dyn is range 0 to 2**C_W - 1;
  type t_mask is range 0 to 2**C_W - 1;
  signal s_d : t_dyn := 0;
  signal s_m : t_mask := 16#FF#;
begin
  s_d <= s_d + 1 after 1 ns;
  r <= integer(s_d);
end architecture bh;
