-- =============================================================
-- Case ID: TC_PROCESS_STATEMENT_SNN_S01
-- Rule Type: Syntax
-- BNF Production: PROCESS_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Test Focus: process_statement: missing "begin" inside process
-- Case Type: Negative (Production-Specific)
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity prs_e is port(r:out integer); end entity;
architecture bh of prs_e is
  signal s:integer:=0;
  bad_proc: process(s)
    s<=s+1;  -- ERROR: missing "begin"
  end process;
end architecture;
