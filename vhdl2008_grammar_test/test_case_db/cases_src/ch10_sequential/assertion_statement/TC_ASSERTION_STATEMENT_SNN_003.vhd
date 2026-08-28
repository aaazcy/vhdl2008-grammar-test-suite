-- =============================================================
-- Case ID: TC_ASSERTION_STATEMENT_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ASSERTION_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.3
-- Production: assertion_statement ::= [ label : ] assert condition [ report expression ] [ severity expression ] ;
-- Case Type: Negative
-- Test Focus: SNN: empty after label colon - label written as `label : ;` with no assert statement body, verifying a complete assert statement is required after the label colon
-- Expected Result: Triggers syntax error: expected 'assert' after label colon
-- Dependencies: None
-- =============================================================
entity assert_stmt_empty_ent is
  port (en : in boolean; out_sig : out bit);
end entity assert_stmt_empty_ent;

architecture err of assert_stmt_empty_ent is
begin
  process(en) is
  begin
    validate: ;  -- ERROR: label colon followed by empty statement
    out_sig <= '1';
  end process;
end architecture err;
