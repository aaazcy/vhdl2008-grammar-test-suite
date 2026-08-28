-- =============================================================
-- Case ID: TC_ITERATION_SCHEME_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_ITER_SCHEME_LOOP
-- Standard Reference: IEEE 1076-2008 Section 10.10
-- Production: iteration_scheme ::= while condition | for parameter_specification
-- Case Type: Negative
-- Test Focus: SMN: the while condition uses an integer literal — in `while 5 loop` the condition is of integer type and cannot be converted to boolean
-- Expected Result: Triggers analysis error: cannot convert expression to boolean
-- Dependencies: None
-- =============================================================
entity iter_int_cond is port(y:out integer); end entity;
architecture vhdl2008 of iter_int_cond is
begin
  process is
    variable v : integer := 0;
  begin
    while 5 loop
      v := v + 1;
    end loop;
    y <= v;
    wait;
  end process;
end architecture vhdl2008;
