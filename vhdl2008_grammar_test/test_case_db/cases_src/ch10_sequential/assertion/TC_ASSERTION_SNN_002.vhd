-- =============================================================
-- Case ID: TC_ASSERTION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ASSERTION
-- Standard Reference: IEEE 1076-2008 Section 10.3
-- Production: assertion ::= assert condition [ report expression ] [ severity expression ]
-- Case Type: Negative
-- Test Focus: SNN: missing condition - no boolean expression after assert, followed directly by a semicolon, missing the condition required by BNF
-- Expected Result: Triggers syntax error: condition expression missing after 'assert'
-- Dependencies: None
-- =============================================================
entity assert_no_cond_ent is
  port (ready : out bit);
end entity assert_no_cond_ent;

architecture err of assert_no_cond_ent is
begin
  process is
  begin
    assert;  -- ERROR: missing condition expression
    ready <= '1';
    wait;
  end process;
end architecture err;
