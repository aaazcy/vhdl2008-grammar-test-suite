-- =============================================================
-- Case ID: TC_CHOICE_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_CHOICE_LOCALLY_STATIC
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: choice ::= simple_expression | discrete_range | element_simple_name | others
-- Case Type: Negative
-- Test Focus: SEM: choice expression must be locally static — non-static signal value used as case choice
-- Expected Result: Triggers semantic error: choice not locally static
-- Dependencies: None
-- =============================================================
entity choice_sem2_ent is port(sel:in integer range 0 to 3; thresh:in integer; y:out integer); end entity;
architecture bh of choice_sem2_ent is
begin process(sel,thresh) begin case sel is when thresh=>y<=1; when others=>y<=0; end case; end process; end architecture bh;
