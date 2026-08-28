-- =============================================================
-- Case ID: TC_SEM_ARR_001_SMN_002
-- Rule Type: Semantics
-- Related Rule ID: BNF_ARRAY_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2
-- Production: array_type_definition ::= constrained_array_definition | unbounded_array_definition
-- Case Type: Negative
-- Test Focus: aggregate element count mismatch for constrained array — an aggregate providing fewer elements than the declared array size should trigger a semantic error
-- Expected Result: Triggers semantic error (aggregate size mismatch)
-- Dependencies: None
-- =============================================================
entity arr_constrained_ent is port(r:out integer); end entity;
architecture bh of arr_constrained_ent is
  type t_vec is array(0 to 3) of integer;
  signal s_v : t_vec := (0, 1, 2);  -- ERROR: aggregate has 3 elements but array has 4
begin
  process
  begin
    r <= s_v(0);
    wait;
  end process;
end architecture bh;
