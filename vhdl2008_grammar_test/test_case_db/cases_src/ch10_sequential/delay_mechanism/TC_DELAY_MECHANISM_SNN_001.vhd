-- =============================================================
-- Case ID: TC_DELAY_MECHANISM_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_DELAY_MECHANISM
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: delay_mechanism ::= transport | [ reject time_expression ] inertial
-- Case Type: Negative
-- Test Focus: SNN: reject without inertial keyword — 'reject 2 ns' without following 'inertial'
-- Expected Result: Triggers syntax error: reject requires inertial keyword
-- Dependencies: None
-- =============================================================
entity delay_mech_snn1_ent is port(a:in integer; y:out integer); end entity;
architecture bh of delay_mech_snn1_ent is
  signal s:integer:=0;
begin s<=reject 2 ns a after 10 ns; y<=s; end architecture bh;
