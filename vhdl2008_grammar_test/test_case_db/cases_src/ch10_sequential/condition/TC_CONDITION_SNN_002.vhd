-- =============================================================
-- Case ID: TC_CONDITION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITION
-- Standard Reference: IEEE 1076-2008 Section 10.8
-- Production: condition ::= expression
-- Case Type: Negative
-- Test Focus: SNN: incomplete condition expression - missing right operand after >
-- Expected Result: Triggers syntax error: incomplete expression
-- Dependencies: None
-- =============================================================
entity condition_snn2_ent is port(a:in integer; y:out integer); end entity;
architecture bh of condition_snn2_ent is
begin process(a) begin if a> then y<=1; end if; end process; end architecture bh;
