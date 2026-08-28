-- =============================================================
-- Case ID: TC_CONCURRENT_STATEMENT_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: SEM_CONC_STMT_LABEL
-- Standard Reference: IEEE 1076-2008 Section 11.1
-- Rule Description: Generate statement requires a label
-- Case Type: Negative
-- Error Category: syntax_error
-- Test Focus: SEM: generate statement without required label
-- Expected Result: Triggers semantic error: generate statement must have label
-- Dependencies: None
-- =============================================================
entity conc_stmt_sem1_ent is port(y:out integer); end entity;
architecture bh of conc_stmt_sem1_ent is
begin
  for i in 0 to 3 generate
    y<=i;
  end generate;
end architecture bh;
