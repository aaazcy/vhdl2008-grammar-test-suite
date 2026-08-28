-- =============================================================
-- Case ID: TC_ITERATION_SCHEME_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: SEM_ITER_SCHEME_LOOP
-- Standard Reference: IEEE 1076-2008 Section 10.10
-- Production: iteration_scheme ::= while condition | for parameter_specification
-- Case Type: Negative
-- Test Focus: SEM: for loop parameter cannot be modified — inside the for loop an assignment to the loop variable i is attempted `i := i+1`, the loop parameter is an implicit constant in the loop body
-- Expected Result: Triggers semantic error: cannot assign to loop parameter (implicit constant)
-- Dependencies: None
-- =============================================================
entity iter_sem1_ent is port(y:out integer); end entity;
architecture bh of iter_sem1_ent is
begin
  process is
    variable v : integer := 0;
  begin
    for i in 0 to 7 loop
      i := i + 1;
      v := v + i;
    end loop;
    y <= v;
    wait;
  end process;
end architecture bh;
