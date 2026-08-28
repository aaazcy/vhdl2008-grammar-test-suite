-- =============================================================
-- Case ID: TC_TARGET_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_TARGET_AGGREGATE_TYPE
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: target ::= name | aggregate
-- Case Type: Negative
-- Test Focus: SMN: aggregate target element type mismatch — integer signal in aggregate receives bit value
-- Expected Result: Triggers type error: element type mismatch in target aggregate
-- Dependencies: None
-- =============================================================
entity target_smn1_ent is port(y:out integer); end entity;
architecture bh of target_smn1_ent is
  signal s_a,s_b:integer:=0;
begin
  process is begin (s_a,s_b)<=std.standard."+"(1,'1'); y<=s_a+s_b; wait; end process; end architecture bh;
