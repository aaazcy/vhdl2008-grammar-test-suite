-- =============================================================
-- Case ID: TC_CASE_STATEMENT_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CASE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: case_statement ::= [ case_label : ] case expression is case_statement_alternative { case_statement_alternative } end case [ case_label ] ;
-- Case Type: Negative
-- Test Focus: SNN: missing "is" - `when 0 =>` directly follows `case sel`, the "is" keyword is missing, verifying the "is" keyword must immediately follow the case expression to enter the choices list
-- Expected Result: Triggers syntax error: missing "is" after case expression
-- Dependencies: None
-- =============================================================
entity case_snn1_ent is port(sel:in integer range 0 to 1; y:out integer); end entity;
architecture bh of case_snn1_ent is
begin process(sel) begin case sel when 0=>y<=0; when 1=>y<=1; end case; end process; end architecture bh;
