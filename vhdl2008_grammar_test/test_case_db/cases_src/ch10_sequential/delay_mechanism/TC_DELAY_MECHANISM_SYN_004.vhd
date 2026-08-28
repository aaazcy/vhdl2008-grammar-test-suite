-- =============================================================
-- Case ID: TC_DELAY_MECHANISM_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_DELAY_MECHANISM
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: delay_mechanism ::= transport | [ reject time_expression ] inertial
-- Case Type: Positive
-- Test Focus: delay_mechanism: reject time_expression inertial — explicit pulse rejection limit shorter than first delay
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity delay_mech_syn4_ent is port(a:in integer; y:out integer); end entity;
architecture bh of delay_mech_syn4_ent is
  signal s_rej:integer:=0;
begin
  s_rej <= reject 2 ns inertial a after 10 ns, a+1 after 20 ns;
  y <= s_rej;
end architecture bh;
