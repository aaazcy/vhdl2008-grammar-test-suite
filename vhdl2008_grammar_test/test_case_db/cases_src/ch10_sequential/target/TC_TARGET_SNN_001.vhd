-- =============================================================
-- Case ID: TC_TARGET_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_TARGET
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: target ::= name | aggregate
-- Case Type: Negative
-- Test Focus: SNN: aggregate target with mismatched element count — 3-element aggregate assigned to 2-element signal tuple
-- Expected Result: Triggers type error: aggregate element count mismatch
-- Dependencies: None
-- =============================================================
entity target_snn1_ent is port(a:in integer; y:out integer); end entity;
architecture bh of target_snn1_ent is
  signal s1,s2:integer:=0;
begin process(a) begin  (s1,s2)<=std.standard."+"(a,1,2); end process; y<=s1+s2; end architecture bh;
