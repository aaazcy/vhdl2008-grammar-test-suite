-- =============================================================
-- Case ID: TC_SEM_ARR_001_SMN_001
-- Rule Type: Semantics
-- Related Rule ID: BNF_ARRAY_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2
-- Production: array_type_definition ::= constrained_array_definition | unbounded_array_definition
-- Case Type: Negative
-- Test Focus: array index out of static bounds — referencing an element beyond the declared index range should trigger a semantic/synthesis error
-- Expected Result: Triggers semantic error (index out of range)
-- Dependencies: None
-- =============================================================
entity arr_constrained_ent is port(r:out integer); end entity;
architecture bh of arr_constrained_ent is
  type t_vec is array(0 to 3) of integer;
  signal s_v : t_vec := (0,0,0,0);
begin
  process
  begin
    s_v(4) <= 42;  -- ERROR: index 4 is out of range (valid: 0 to 3)
    r <= s_v(0);
    wait;
  end process;
end architecture bh;
