-- =============================================================
-- Case ID: TC_ARCHITECTURE_STATEMENT_PART_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_statement_part ::= { concurrent_statement }
-- Case Type: Negative
-- Test Focus: SNN: Concurrent signal assignment missing semicolon - a concurrent_signal_assignment statement lacks the trailing ; separator, so the next concurrent statement cannot be parsed as an independent concurrent_statement, verifying each concurrent_statement in the architecture statement part must end with a semicolon
-- Expected Result: Triggers syntax error: missing semicolon after concurrent statement
-- Dependencies: None
-- =============================================================
entity asp_snn4_ent is port(a,b:in bit; y:out bit); end entity;
architecture bh of asp_snn4_ent is
  signal s_mid:bit;
begin
  s_mid<=a and b
  y<=s_mid;
end architecture bh;
