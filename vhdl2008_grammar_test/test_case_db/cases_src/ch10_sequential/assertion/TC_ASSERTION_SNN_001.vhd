-- =============================================================
-- Case ID: TC_ASSERTION_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ASSERTION
-- Standard Reference: IEEE 1076-2008 Section 10.3
-- Production: assertion ::= assert condition [ report expression ] [ severity expression ]
-- Case Type: Negative
-- Test Focus: SNN: missing assert keyword - condition written directly, missing assert keyword causes a syntax error
-- Expected Result: Triggers syntax error: missing 'assert' keyword
-- Dependencies: None
-- =============================================================
entity assert_no_keyword_ent is
  port (valid : in boolean; pass : out bit);
end entity assert_no_keyword_ent;

architecture err of assert_no_keyword_ent is
begin
  process(valid) is
  begin
    valid;  -- ERROR: assert keyword missing
    pass <= '1';
  end process;
end architecture err;
