-- =============================================================
-- Case ID: TC_DELAY_MECHANISM_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_DELAY_MECHANISM
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: delay_mechanism ::= transport | [ reject time_expression ] inertial
-- Case Type: Negative
-- Test Focus: SNN: invalid delay mechanism keyword — mistyped 'transprot' instead of 'transport'
-- Expected Result: Triggers syntax error: unrecognized keyword in delay mechanism
-- Dependencies: None
-- =============================================================
entity delay_mech_snn2_ent is port(a:in integer; y:out integer); end entity;
architecture bh of delay_mech_snn2_ent is
  signal s:integer:=0;
begin s<=transprot a after 5 ns; y<=s; end architecture bh;
