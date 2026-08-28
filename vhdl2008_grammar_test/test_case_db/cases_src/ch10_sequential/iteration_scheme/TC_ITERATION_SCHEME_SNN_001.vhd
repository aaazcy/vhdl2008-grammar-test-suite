-- =============================================================
-- Case ID: TC_ITERATION_SCHEME_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ITERATION_SCHEME
-- Standard Reference: IEEE 1076-2008 Section 10.10
-- Production: iteration_scheme ::= while condition | for parameter_specification
-- Case Type: Negative
-- Test Focus: SNN: missing condition after while — `while loop` goes directly to loop, no boolean expression
-- Expected Result: Triggers syntax error: missing condition after 'while'
-- Dependencies: None
-- =============================================================
entity iter_snn1_ent is end entity;
architecture bh of iter_snn1_ent is
begin
  process is
    variable v_n : integer := 5;
  begin
    while loop
      v_n := v_n - 1;
    end loop;
    wait;
  end process;
end architecture bh;
