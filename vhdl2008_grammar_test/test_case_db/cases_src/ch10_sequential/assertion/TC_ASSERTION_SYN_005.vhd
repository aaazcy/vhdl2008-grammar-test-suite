-- =============================================================
-- Case ID: TC_ASSERTION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ASSERTION
-- Standard Reference: IEEE 1076-2008 Section 10.3
-- Production: assertion ::= assert condition [ report expression ] [ severity expression ]
-- Case Type: Positive
-- Test Focus: Multiple assertion combination: two asserts in a process, one using report+severity and one without report, verifying multiple assertions coexist in sequential statements
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity assert_multi_ent is
  port (
    x : in  real;
    y : in  real;
    z : out real
  );
end entity assert_multi_ent;

architecture validate of assert_multi_ent is
begin
  process(x, y) is
    variable result : real;
  begin
    assert x >= 0.0 report "x is negative" severity warning;
    result := x * y;
    assert result >= 0.0 severity error;
    z <= result;
  end process;
end architecture validate;
