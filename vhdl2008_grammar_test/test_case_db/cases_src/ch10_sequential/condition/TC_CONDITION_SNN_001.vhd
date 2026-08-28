-- =============================================================
-- Case ID: TC_CONDITION_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITION
-- Standard Reference: IEEE 1076-2008 Section 10.8
-- Production: condition ::= expression
-- Case Type: Negative
-- Test Focus: SNN: non-boolean expression used as condition - integer used where boolean expected
-- Expected Result: Triggers type error: condition must be boolean
-- Dependencies: None
-- =============================================================
entity condition_snn1_ent is port(a:in integer; y:out integer); end entity;
architecture bh of condition_snn1_ent is
begin process(a) begin if a then y<=1; end if; end process; end architecture bh;
