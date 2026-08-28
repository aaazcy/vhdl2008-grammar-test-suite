-- =============================================================
-- Case ID: TC_CASE_STATEMENT_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CASE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: case_statement ::= [ case_label : ] case expression is case_statement_alternative { case_statement_alternative } end case [ case_label ] ;
-- Case Type: Negative
-- Test Focus: SNN: missing "when" - the "when" keyword is missing before choice value `0`, written directly as `0 => y<=0`, verifying every case_statement_alternative must be introduced by "when"
-- Expected Result: Triggers syntax error: missing "when" before choices
-- Dependencies: None
-- =============================================================
entity case_snn3_ent is port(sel:in integer range 0 to 1; y:out integer); end entity;
architecture bh of case_snn3_ent is
begin process(sel) begin case sel is 0=>y<=0; when others=>y<=99; end case; end process; end architecture bh;
