-- =============================================================
-- Case ID: TC_DELAY_MECHANISM_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_DELAY_MECHANISM
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: delay_mechanism ::= transport | [ reject time_expression ] inertial
-- Case Type: Positive
-- Test Focus: delay_mechanism: explicit inertial keyword with default pulse rejection in signal assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity delay_mech_syn3_ent is port(a:in integer; y:out integer); end entity;
architecture bh of delay_mech_syn3_ent is
  signal s_inert:integer:=0;
begin
  s_inert <= inertial a after 10 ns;
  y <= s_inert;
end architecture bh;
