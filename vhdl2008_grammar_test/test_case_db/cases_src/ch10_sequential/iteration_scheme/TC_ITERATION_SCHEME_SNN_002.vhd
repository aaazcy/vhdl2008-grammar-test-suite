-- =============================================================
-- Case ID: TC_ITERATION_SCHEME_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ITERATION_SCHEME
-- Standard Reference: IEEE 1076-2008 Section 10.10
-- Production: iteration_scheme ::= while condition | for parameter_specification
-- Case Type: Negative
-- Test Focus: SNN: missing identifier after for — `for 0 to 7 loop` starts directly with a range without a loop variable name
-- Expected Result: Triggers syntax error: missing loop parameter identifier after 'for'
-- Dependencies: None
-- =============================================================
entity iter_snn2_ent is end entity;
architecture bh of iter_snn2_ent is
begin
  process is
    variable v_acc : integer := 0;
  begin
    for 0 to 7 loop
      v_acc := v_acc + 1;
    end loop;
    wait;
  end process;
end architecture bh;
