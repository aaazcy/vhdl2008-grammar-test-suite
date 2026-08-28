-- =============================================================
-- Case ID: TC_ASSERTION_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ASSERTION
-- Standard Reference: IEEE 1076-2008 Section 10.3
-- Production: assertion ::= assert condition [ report expression ] [ severity expression ]
-- Case Type: Negative
-- Test Focus: SNN: expression missing after severity - ends directly after the `severity` keyword, missing the required severity_level expression
-- Expected Result: Triggers syntax error: expression missing after 'severity' keyword
-- Dependencies: None
-- =============================================================
entity assert_no_sevexpr_ent is
  port (overflow : in boolean; halt : out bit);
end entity assert_no_sevexpr_ent;

architecture err of assert_no_sevexpr_ent is
begin
  process(overflow) is
  begin
    assert not overflow report "overflow" severity;  -- ERROR: missing severity expression
    halt <= '1';
  end process;
end architecture err;
