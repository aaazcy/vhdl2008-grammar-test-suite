-- =============================================================
-- Case ID: TC_ASSERTION_STATEMENT_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ASSERTION_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.3
-- Production: assertion_statement ::= [ label : ] assert condition [ report expression ] [ severity expression ] ;
-- Case Type: Negative
-- Test Focus: SNN: missing condition - `assert ;` followed directly by a semicolon, missing the required condition expression after the assert keyword
-- Expected Result: Triggers syntax error: condition expression missing after 'assert' keyword
-- Dependencies: None
-- =============================================================
entity assert_stmt_nocond_ent is
  port (rdy : out bit);
end entity assert_stmt_nocond_ent;

architecture err of assert_stmt_nocond_ent is
begin
  process is
  begin
    assert;  -- ERROR: assert with no condition
    rdy <= '0';
    wait;
  end process;
end architecture err;
