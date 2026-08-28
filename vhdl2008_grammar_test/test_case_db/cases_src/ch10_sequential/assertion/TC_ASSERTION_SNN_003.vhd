-- =============================================================
-- Case ID: TC_ASSERTION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ASSERTION
-- Standard Reference: IEEE 1076-2008 Section 10.3
-- Production: assertion ::= assert condition [ report expression ] [ severity expression ]
-- Case Type: Negative
-- Test Focus: SNN: expression missing after report - `severity` follows the `report` keyword directly, missing the required report expression
-- Expected Result: Triggers syntax error: expression missing after 'report' keyword
-- Dependencies: None
-- =============================================================
entity assert_no_rexpr_ent is
  port (flag : in boolean; result : out bit);
end entity assert_no_rexpr_ent;

architecture err of assert_no_rexpr_ent is
begin
  process(flag) is
  begin
    assert flag report severity note;  -- ERROR: missing expression after report
    result <= '1';
  end process;
end architecture err;
