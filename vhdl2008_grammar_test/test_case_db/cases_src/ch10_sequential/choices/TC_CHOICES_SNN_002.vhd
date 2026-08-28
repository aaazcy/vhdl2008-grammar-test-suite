-- =============================================================
-- Case ID: TC_CHOICES_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_CHOICES
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: choices ::= choice { | choice }
-- Case Type: Negative
-- Test Focus: SNN: empty choices (when => without any choice)
-- Expected Result: Triggers syntax error: missing choice
-- Dependencies: None
-- =============================================================
entity choices_snn2_ent is port(sel:in integer range 0 to 3; y:out integer); end entity;
architecture bh of choices_snn2_ent is
begin process(sel) begin case sel is when =>y<=0; end case; end process; end architecture bh;
