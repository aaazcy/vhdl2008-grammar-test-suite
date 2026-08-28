-- =============================================================
-- Case ID: TC_ASSERTION_STATEMENT_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ASSERTION_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.3
-- Production: assertion_statement ::= [ label : ] assert condition [ report expression ] [ severity expression ] ;
-- Case Type: Negative
-- Test Focus: SNN: missing assert keyword - condition directly follows the label colon without assert, verifying the assert keyword is required after a label
-- Expected Result: Triggers syntax error: 'assert' keyword missing after label
-- Dependencies: None
-- =============================================================
entity assert_stmt_noassert_ent is
  port (ok : in boolean; pass : out bit);
end entity assert_stmt_noassert_ent;

architecture err of assert_stmt_noassert_ent is
begin
  process(ok) is
  begin
    chk: ok;  -- ERROR: label with no assert keyword
    pass <= '1';
  end process;
end architecture err;
