-- =============================================================
-- Case ID: TC_ITERATION_SCHEME_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ITERATION_SCHEME
-- Standard Reference: IEEE 1076-2008 Section 10.10
-- Production: iteration_scheme ::= while condition | for parameter_specification
-- Case Type: Negative
-- Test Focus: SNN: missing the in keyword after for — `for i 0 to 7 loop` has identifier and range but no in
-- Expected Result: Triggers syntax error: missing 'in' after loop parameter
-- Dependencies: None
-- =============================================================
entity iter_snn3_ent is end entity;
architecture bh of iter_snn3_ent is
begin
  process is
    variable v_acc : integer := 0;
  begin
    for i 0 to 7 loop
      v_acc := v_acc + i;
    end loop;
    wait;
  end process;
end architecture bh;
