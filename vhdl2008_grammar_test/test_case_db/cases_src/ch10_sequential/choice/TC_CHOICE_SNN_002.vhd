-- =============================================================
-- Case ID: TC_CHOICE_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_CHOICE
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: choice ::= simple_expression | discrete_range | element_simple_name | others
-- Case Type: Negative
-- Test Focus: SNN: invalid choice syntax - missing "when" keyword before choices list
-- Expected Result: Triggers syntax error: missing when
-- Dependencies: None
-- =============================================================
entity choice_snn2_ent is port(sel:in integer range 0 to 3; y:out integer); end entity;
architecture bh of choice_snn2_ent is
begin process(sel) begin case sel is when 0 to 1000000000=>y<=1; end case; end process; end architecture bh;
