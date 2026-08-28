-- =============================================================
-- Case ID: TC_FLOATING_TYPE_DEFINITION_SYN_S03
-- Rule Type: Syntax
-- Related Rule ID: BNF_FLOATING_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: floating_type_definition ::= range_constraint
-- Case Type: Positive
-- Test Focus: real with scientific notation bounds
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity float_spc3_ent is port(r:out integer); end entity;
architecture bh of float_spc3_ent is
  type t_res is range -1.0e3 to 1.0e3;
  type t_prec is range -1.0e-9 to 1.0e-9;
  signal s_r : t_res := 0.0;
  signal s_p : t_prec := 1.0e-10;
begin
  s_r <= 9.99e2 after 1 ns;
  r <= integer(s_r);
end architecture bh;
