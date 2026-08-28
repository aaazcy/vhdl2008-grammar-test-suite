-- =============================================================
-- Case ID: TC_SEM_ARR_001_SEM_001
-- Rule Type: Semantics
-- Related Rule ID: BNF_ARRAY_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2
-- Production: array_type_definition ::= constrained_array_definition | unbounded_array_definition
-- Case Type: Positive
-- Test Focus: array aggregate assignment — verifies that a constrained array type supports positional aggregate assignment with correct element count
-- Expected Result: Compiles and synthesizes successfully
-- Dependencies: None
-- =============================================================
entity arr_constrained_ent is port(r:out integer); end entity;
architecture bh of arr_constrained_ent is
  type t_vec is array(0 to 3) of integer;
  signal s_v : t_vec := (0, 1, 2, 3);
  signal s_sum : integer := 0;
begin
  process
  begin
    s_sum <= s_v(0) + s_v(1) + s_v(2) + s_v(3);
    r <= s_sum;
    wait;
  end process;
end architecture bh;
