-- =============================================================
-- Case ID: TC_DELAY_MECHANISM_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_DELAY_AFTER_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: delay_mechanism ::= transport | [ reject time_expression ] inertial
-- Case Type: Negative
-- Test Focus: SMN: wrong type of the after time expression of transport - in transport a after 5 the after time expression is an integer literal, it must be of time type
-- Expected Result: Triggers analysis error: can't match integer literal with type physical type "time"
-- Dependencies: None
-- =============================================================
entity delay_mech_after_int is port(a:in integer; y:out integer); end entity;
architecture vhdl2008 of delay_mech_after_int is
  signal s:integer:=0;
begin
  s<=transport a after 5;
  y<=s;
end architecture vhdl2008;
