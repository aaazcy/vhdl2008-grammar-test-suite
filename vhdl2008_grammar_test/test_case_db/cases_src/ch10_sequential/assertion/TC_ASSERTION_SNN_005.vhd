-- =============================================================
-- Case ID: TC_ASSERTION_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ASSERTION
-- Standard Reference: IEEE 1076-2008 Section 10.3
-- Production: assertion ::= assert condition [ report expression ] [ severity expression ]
-- Case Type: Negative
-- Test Focus: SNN: wrong clause order - severity appears before report, violating the BNF order constraint that report must precede severity
-- Expected Result: Triggers syntax error: 'severity' before 'report' - wrong clause order
-- Dependencies: None
-- =============================================================
entity assert_order_err_ent is
  port (valid : in boolean; pass : out bit);
end entity assert_order_err_ent;

architecture err of assert_order_err_ent is
begin
  process(valid) is
  begin
    assert valid severity error report "msg";  -- ERROR: severity before report
    pass <= '1';
  end process;
end architecture err;
