-- =============================================================
-- Case ID: TC_TARGET_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: SEM_TARGET_MODE
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: target ::= name | aggregate
-- Case Type: Negative
-- Test Focus: SEM: input port used as target — cannot assign to IN mode port
-- Expected Result: Triggers semantic error: cannot assign to input port
-- Dependencies: None
-- =============================================================
entity target_sem1_ent is port(x:in integer; y:out integer); end entity;
architecture bh of target_sem1_ent is
begin process(x) begin x<=5; y<=x; end process; end architecture bh;
