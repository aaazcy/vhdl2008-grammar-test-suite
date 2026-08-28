-- =============================================================
-- Case ID: TC_SEM_ARR_001_SEM_002
-- Rule Type: Semantics
-- Related Rule ID: BNF_ARRAY_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2
-- Production: array_type_definition ::= constrained_array_definition | unbounded_array_definition
-- Case Type: Positive
-- Test Focus: array slicing — verifies that a constrained array type correctly supports slice operations on signals
-- Expected Result: Compiles and synthesizes successfully
-- Dependencies: None
-- =============================================================
entity arr_constrained_ent is port(r:out integer); end entity;
architecture bh of arr_constrained_ent is
  type t_vec is array(0 to 7) of integer;
  signal s_v : t_vec := (0,1,2,3,4,5,6,7);
  signal s_slice : integer := 0;
begin
  process
  begin
    s_slice <= s_v(2) + s_v(3) + s_v(4);
    r <= s_slice;
    wait;
  end process;
end architecture bh;
