-- =============================================================
-- Case ID: TC_ITERATION_SCHEME_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_ITER_SCHEME_LOOP
-- Standard Reference: IEEE 1076-2008 Section 10.10
-- Production: iteration_scheme ::= while condition | for parameter_specification
-- Case Type: Negative
-- Test Focus: SMN: while condition type is not boolean — `while 42 loop`, the integer 42 is not a boolean expression
-- Expected Result: Triggers semantic error: while condition must be boolean type
-- Dependencies: None
-- =============================================================
entity iter_smn2_ent is port(y:out integer); end entity;
architecture bh of iter_smn2_ent is
begin
  process is
    variable v : integer := 0;
  begin
    while 42 loop
      v := v + 1;
    end loop;
    y <= v;
    wait;
  end process;
end architecture bh;
