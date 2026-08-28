-- =============================================================
-- Case ID: TC_ITERATION_SCHEME_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_ITERATION_SCHEME
-- Standard Reference: IEEE 1076-2008 Section 10.10
-- Production: iteration_scheme ::= while condition | for parameter_specification
-- Case Type: Positive
-- Test Focus: nested loops each with their own iteration_scheme: outer for i in 0 to 3 + inner while v_j < 4 — verifies iteration_scheme acts independently in nested loops
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity iter_syn6_ent is port(y:out integer); end entity;
architecture bh of iter_syn6_ent is
  type t_mat is array(0 to 3, 0 to 3) of integer;
begin
  process is
    variable v_mat : t_mat := (others => (others => 0));
    variable v_sum : integer := 0;
    variable v_j   : integer;
  begin
    for i in 0 to 3 loop
      v_j := 0;
      while v_j < 4 loop
        v_mat(i, v_j) := i * 4 + v_j;
        v_sum := v_sum + v_mat(i, v_j);
        v_j := v_j + 1;
      end loop;
    end loop;
    y <= v_sum;
    wait;
  end process;
end architecture bh;
