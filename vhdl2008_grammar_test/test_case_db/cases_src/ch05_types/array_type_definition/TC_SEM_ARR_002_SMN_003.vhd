-- =============================================================
-- Case ID: TC_SEM_ARR_002_SMN_003
-- Rule Type: Semantics
-- Related Rule ID: BNF_ARRAY_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2
-- Production: array_type_definition ::= constrained_array_definition | unbounded_array_definition
-- Case Type: Negative
-- Test Focus: dimension count mismatch — referencing a 2D constrained array with only one index triggers a semantic error
-- Expected Result: Triggers semantic error (wrong number of indices)
-- Dependencies: None
-- =============================================================
entity arr_2d_ent is port(r:out integer); end entity;
architecture bh of arr_2d_ent is
  type t_mat is array(0 to 3, 0 to 3) of integer;
  signal s_m : t_mat := (others => (others => 0));
begin
  process
  begin
    s_m(0) <= 42;  -- ERROR: 2D array requires 2 indices, only 1 provided
    r <= 0;
    wait;
  end process;
end architecture bh;
