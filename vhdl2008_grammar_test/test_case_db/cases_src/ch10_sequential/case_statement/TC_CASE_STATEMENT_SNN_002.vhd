-- =============================================================
-- Case ID: TC_CASE_STATEMENT_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_CASE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: case_statement ::= [ case_label : ] case expression is case_statement_alternative { case_statement_alternative } end case [ case_label ] ;
-- Case Type: Negative
-- Test Focus: SNN: missing "end case" - the process ends directly after the when others alternative with no end case closure, verifying the case body must be explicitly terminated by end case and cannot be auto-closed by an outer construct
-- Expected Result: Triggers syntax error: case statement not properly closed
-- Dependencies: None
-- =============================================================
entity case_snn2_ent is port(sel:in integer range 0 to 1; y:out integer); end entity;
architecture bh of case_snn2_ent is
begin process(sel) begin case sel is when 0=>y<=0; when 1=>y<=1; end process; end architecture bh;
