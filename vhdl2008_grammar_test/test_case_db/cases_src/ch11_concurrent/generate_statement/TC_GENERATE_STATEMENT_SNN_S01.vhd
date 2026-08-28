-- =============================================================
-- Case ID: TC_GENERATE_STATEMENT_SNN_S01
-- Rule Type: Syntax
-- BNF Production: GENERATE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Test Focus: generate_statement: if-generate missing condition
-- Case Type: Negative (Production-Specific)
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity gs_e is port(r:out integer); end entity;
architecture bh of gs_e is
begin
  g_bad: if generate  -- ERROR: missing condition after "if"
    r<=1;
  end generate;
end architecture;
