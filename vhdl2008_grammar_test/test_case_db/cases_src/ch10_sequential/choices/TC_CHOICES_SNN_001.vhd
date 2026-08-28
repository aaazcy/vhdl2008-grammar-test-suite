-- =============================================================
-- Case ID: TC_CHOICES_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CHOICES
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: choices ::= choice { | choice }
-- Case Type: Negative
-- Test Focus: SNN: trailing pipe with missing choice after ｜ - when 0｜ =>
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity choices_snn1_ent is port(sel:in integer range 0 to 3; y:out integer); end entity;
architecture bh of choices_snn1_ent is
begin process(sel) begin case sel is when 0|=>y<=1; when others=>y<=0; end case; end process; end architecture bh;
