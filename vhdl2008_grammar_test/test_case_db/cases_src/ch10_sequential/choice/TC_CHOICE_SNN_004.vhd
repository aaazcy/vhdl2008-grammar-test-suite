-- =============================================================
-- Case ID: TC_CHOICE_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CHOICE
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: choice ::= simple_expression | discrete_range | element_simple_name | others
-- Case Type: Negative
-- Test Focus: SNN: choice using reserved keyword as element_simple_name — 'entity' is not a valid identifier
-- Expected Result: Triggers syntax error: reserved word used as identifier
-- Dependencies: None
-- =============================================================
entity choice_snn4_ent is port(sel:in integer range 0 to 3; y:out integer); end entity;
architecture bh of choice_snn4_ent is
begin process(sel) begin case sel is when entity=>y<=1; when others=>y<=0; end case; end process; end architecture bh;
