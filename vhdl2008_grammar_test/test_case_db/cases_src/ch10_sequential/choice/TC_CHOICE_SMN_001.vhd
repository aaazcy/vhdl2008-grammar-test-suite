-- =============================================================
-- Case ID: TC_CHOICE_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_CHOICE_OTHERS_POSITION
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: choice ::= simple_expression | discrete_range | element_simple_name | others
-- Case Type: Negative
-- Test Focus: SMN: others choice not in last position — others appears before other case alternatives
-- Expected Result: Triggers semantic error: others must be the last choice
-- Dependencies: None
-- =============================================================
entity choice_smn1_ent is port(sel:in integer range 0 to 3; y:out integer); end entity;
architecture bh of choice_smn1_ent is
begin process(sel) begin case sel is when others=>y<=0; when 0=>y<=1; end case; end process; end architecture bh;
