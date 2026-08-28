-- =============================================================
-- Case ID: TC_ITERATION_SCHEME_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ITERATION_SCHEME
-- Standard Reference: IEEE 1076-2008 Section 10.10
-- Production: iteration_scheme ::= while condition | for parameter_specification
-- Case Type: Negative
-- Test Focus: SNN: for missing discrete_range — `for i in loop` has identifier and in but no range
-- Expected Result: Triggers syntax error: missing discrete_range after 'in'
-- Dependencies: None
-- =============================================================
entity iter_snn4_ent is end entity;
architecture bh of iter_snn4_ent is
begin
  process is
    variable v_acc : integer := 0;
  begin
    for i in loop
      v_acc := v_acc + 1;
    end loop;
    wait;
  end process;
end architecture bh;
