-- =============================================================
-- Case ID: TC_TARGET_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_TARGET
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: target ::= name | aggregate
-- Case Type: Negative
-- Test Focus: SNN: expression used as assignment target — literal on left side of signal assignment
-- Expected Result: Triggers syntax error: expression is not a valid target
-- Dependencies: None
-- =============================================================
entity target_snn2_ent is port(a:in integer; y:out integer); end entity;
architecture bh of target_snn2_ent is
begin process(a) begin  5<=a; y<=a; end process; end architecture bh;
