-- =============================================================
-- Case ID: TC_ITERATION_SCHEME_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ITERATION_SCHEME
-- Standard Reference: IEEE 1076-2008 Section 10.10
-- Production: iteration_scheme ::= while condition | for parameter_specification
-- Case Type: Positive
-- Test Focus: while condition with logical operations: while (a > 0) and (b < 100) loop — a compound boolean expression as the while condition
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity iter_syn5_ent is port(a,b:in integer; y:out integer); end entity;
architecture bh of iter_syn5_ent is
begin
  process(a,b) is
    variable v_a, v_b : integer;
    variable v_cnt : integer := 0;
  begin
    v_a := a; v_b := b; v_cnt := 0;
    while (v_a > 0) and (v_b < 100) loop
      v_a := v_a - 1;
      v_b := v_b + 1;
      v_cnt := v_cnt + 1;
    end loop;
    y <= v_cnt;
  end process;
end architecture bh;
