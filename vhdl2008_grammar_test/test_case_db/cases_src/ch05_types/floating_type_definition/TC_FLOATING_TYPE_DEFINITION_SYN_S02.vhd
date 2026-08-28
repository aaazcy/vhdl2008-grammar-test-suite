-- =============================================================
-- Case ID: TC_FLOATING_TYPE_DEFINITION_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_FLOATING_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: floating_type_definition ::= range_constraint
-- Case Type: Positive
-- Test Focus: descending real range
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity float_spc2_ent is port(r:out integer); end entity;
architecture bh of float_spc2_ent is
  type t_gain is range 10.0 downto 0.1;
  type t_neg  is range -0.1 downto -100.0;
  signal s_g : t_gain := 5.0;
  signal s_n : t_neg := -50.0;
begin
  s_g <= 0.5 after 1 ns;
  r <= integer(s_g);
end architecture bh;
