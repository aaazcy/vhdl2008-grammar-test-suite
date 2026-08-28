-- =============================================================
-- Case ID: TC_DELAY_MECHANISM_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: SEM_DELAY_REJECT_LIMIT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: delay_mechanism ::= transport | [ reject time_expression ] inertial
-- Case Type: Negative
-- Test Focus: SEM: wrong type of the reject time expression - in reject 5 inertial the reject time expression is an integer literal, it must be of time type
-- Expected Result: Triggers analysis error: can't match integer literal with type physical type "time"
-- Dependencies: None
-- =============================================================
entity delay_mech_reject_int is port(a:in integer; y:out integer); end entity;
architecture vhdl2008 of delay_mech_reject_int is
  signal s:integer:=0;
begin
  process(a) is
  begin
    s <= reject 5 inertial a after 10 ns;
  end process;
  y<=s;
end architecture vhdl2008;
