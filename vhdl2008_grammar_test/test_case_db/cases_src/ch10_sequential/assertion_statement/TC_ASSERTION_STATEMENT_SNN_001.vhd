-- =============================================================
-- Case ID: TC_ASSERTION_STATEMENT_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ASSERTION_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.3
-- Production: assertion_statement ::= [ label : ] assert condition [ report expression ] [ severity expression ] ;
-- Case Type: Negative
-- Test Focus: SNN: missing semicolon - newline directly after `assert condition` with no semicolon, verifying assertion_statement must end with a semicolon
-- Expected Result: Triggers syntax error: missing ';' after assertion_statement
-- Dependencies: None
-- =============================================================
entity assert_stmt_nosemi_ent is
  port (flag : in boolean; done : out bit);
end entity assert_stmt_nosemi_ent;

architecture err of assert_stmt_nosemi_ent is
begin
  process(flag) is
  begin
    assert flag  -- ERROR: missing semicolon
    done <= '1';
  end process;
end architecture err;
