-- =============================================================
-- Case ID: TC_CONCURRENT_ASSERTION_STATEMENT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_ASSERTION_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.5
-- Production: concurrent_assertion_statement ::= [ label : ] [ postponed ] assertion ;
-- Case Type: Negative
-- Test Focus: SNN: missing terminating semicolon — `assert a = b report "err" severity error` has no trailing semicolon, verifying that a concurrent assertion must terminate with a semicolon
-- Expected Result: Triggers syntax error: missing ";" after concurrent assertion
-- Dependencies: None
-- =============================================================
entity ca_snn4_ent is
  port(a, b : in bit);
end entity ca_snn4_ent;
architecture bh of ca_snn4_ent is
begin
  assert a = b report "mismatch" severity error
end architecture bh;
