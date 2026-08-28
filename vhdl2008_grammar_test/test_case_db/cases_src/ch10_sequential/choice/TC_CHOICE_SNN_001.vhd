-- =============================================================
-- Case ID: TC_CHOICE_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CHOICE
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: choice ::= simple_expression | discrete_range | element_simple_name | others
-- Case Type: Negative
-- Test Focus: SNN: missing "when" before choice in case alternative - bare choice without when
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity choice_snn1_ent is port(sel:in integer range 0 to 1; y:out integer); end entity;
architecture bh of choice_snn1_ent is
begin process(sel) begin case sel is 0=>y<=0; when others=>y<=1; end case; end process; end architecture bh;
