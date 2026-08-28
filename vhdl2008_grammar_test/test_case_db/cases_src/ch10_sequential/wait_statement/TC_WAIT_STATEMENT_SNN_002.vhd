-- =============================================================
-- Case ID: TC_WAIT_STATEMENT_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_WAIT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Production: wait_statement ::= [ label : ] wait [ sensitivity_clause ] [ condition_clause ] [ timeout_clause ] ;
-- Case Type: Negative
-- Test Focus: SNN: Wrong sensitivity_clause keyword — `wait at clk;` uses `at` instead of `on`, verifying that the sensitivity_clause must be in the `on signal_list` form
-- Expected Result: Triggers syntax error: expected 'on' keyword in sensitivity clause
-- Dependencies: None
-- =============================================================
entity wait_bad_on_kw_ent is
  port (sig : in bit; done : out bit);
end entity wait_bad_on_kw_ent;

architecture err of wait_bad_on_kw_ent is
begin
  process is
  begin
    wait at sig;  -- ERROR: 'at' instead of 'on'
    done <= '1';
    wait;
  end process;
end architecture err;
