-- =============================================================
-- Case ID: TC_CONCURRENT_ASSERTION_STATEMENT_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_ASSERTION_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.5
-- Production: concurrent_assertion_statement ::= [ label : ] [ postponed ] assertion ;
-- Case Type: Negative
-- Test Focus: SNN: missing "assert" keyword — the concurrent assertion writes the condition and report directly with no assert keyword, verifying that a concurrent assertion must begin with assert
-- Expected Result: Triggers syntax error: missing "assert" keyword in concurrent assertion
-- Dependencies: None
-- =============================================================
entity ca_snn1_ent is
  port(a, b : in bit);
end entity ca_snn1_ent;
architecture bh of ca_snn1_ent is
begin
  a = b report "signals differ" severity error;
end architecture bh;
