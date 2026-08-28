-- =============================================================
-- Case ID: TC_CHOICES_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CHOICES
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: choices ::= choice { | choice }
-- Case Type: Negative
-- Test Focus: SNN: double pipe with missing choice between them — when 0｜｜2 =>
-- Expected Result: Triggers syntax error: consecutive pipes without choice
-- Dependencies: None
-- =============================================================
entity choices_snn3_ent is port(sel:in integer range 0 to 3; y:out integer); end entity;
architecture bh of choices_snn3_ent is
begin process(sel) begin case sel is when 0||2=>y<=1; when others=>y<=0; end case; end process; end architecture bh;
