-- =============================================================
-- Case ID: TC_ARRAY_TYPE_DEFINITION_SYN_S08
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARRAY_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: array_type_definition ::= unbounded_array_definition | constrained_array_definition
-- Case Type: Positive
-- Test Focus: constrained 3D array cube — exercises constrained_array_definition with three index ranges, representing a 3-dimensional spatial matrix
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity arr_2d_ent is port(r:out integer); end entity;
architecture bh of arr_2d_ent is
  type t_cube is array(0 to 3, 0 to 3, 0 to 3) of integer;
  signal s_c : t_cube := (others => (others => (others => 0)));
begin
  process
  begin
    s_c(0,1,2) <= 42;
    r <= s_c(0,1,2);
    wait;
  end process;
end architecture bh;
