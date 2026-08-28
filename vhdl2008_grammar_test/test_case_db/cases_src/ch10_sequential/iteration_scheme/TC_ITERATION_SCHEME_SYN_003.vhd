-- =============================================================
-- Case ID: TC_ITERATION_SCHEME_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ITERATION_SCHEME
-- Standard Reference: IEEE 1076-2008 Section 10.10
-- Production: iteration_scheme ::= while condition | for parameter_specification
-- Case Type: Positive
-- Test Focus: for loop with parameter_specification: for i in 0 to 7 loop — a simple for iteration with discrete_range as integer 0 to 7
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity iter_syn3_ent is port(y:out integer); end entity;
architecture bh of iter_syn3_ent is
begin
  process is
    variable v_acc : integer := 0;
  begin
    v_acc := 0;
    for i in 0 to 7 loop
      v_acc := v_acc + i;
    end loop;
    y <= v_acc;
    wait;
  end process;
end architecture bh;
