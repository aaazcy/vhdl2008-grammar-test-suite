-- =============================================================
-- Case ID: TC_ASSERTION_STATEMENT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ASSERTION_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.3
-- Production: assertion_statement ::= [ label : ] assert condition [ report expression ] [ severity expression ] ;
-- Case Type: Negative
-- Test Focus: SNN: missing semicolon after condition followed by another statement - the next statement directly follows `assert cond report msg` without a semicolon separator
-- Expected Result: Triggers syntax error: missing ';' terminator after assertion
-- Dependencies: None
-- =============================================================
entity assert_stmt_nodelim_ent is
  port (a : in integer; b : out integer);
end entity assert_stmt_nodelim_ent;

architecture err of assert_stmt_nodelim_ent is
begin
  process(a) is
  begin
    assert a > 0 report "zero"  -- ERROR: no semicolon before next statement
    b <= a;
  end process;
end architecture err;
