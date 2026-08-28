-- =============================================================
-- Case ID: TC_TERM_SMN_003
-- Rule Type: Semantic
-- Related Rule ID: BNF_TERM
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: term ::= factor { multiplying_operator factor }
-- Case Type: Negative
-- Rule Description: A multiplying operator requires at least one operand of numeric type; multiplication of a physical type by a physical type is undefined
-- Error Category: type_mismatch
-- Test Focus: SMN: physical types multiplied——in t1 * t2, time is multiplied by time; multiplication of physical types is undefined (time * time does not yield time) and no corresponding overload exists
-- Expected Result: Triggers analysis error: no function declarations for operator "*"
-- Dependencies: None
-- =============================================================
entity term_time_times_time is
  port(t1, t2 : in time; y : out time);
end entity;
architecture vhdl2008 of term_time_times_time is
begin
  y <= t1 * t2;
end architecture vhdl2008;
