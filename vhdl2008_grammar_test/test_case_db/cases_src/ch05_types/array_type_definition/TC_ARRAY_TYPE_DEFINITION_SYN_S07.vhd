-- =============================================================
-- Case ID: TC_ARRAY_TYPE_DEFINITION_SYN_S07
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARRAY_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: array_type_definition ::= unbounded_array_definition | constrained_array_definition
-- Case Type: Positive
-- Test Focus: constrained array type used in port signature — exercises array type passing through entity port interface, verifying that array_type_definition types integrate with port clauses
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity arr_constrained_ent is
  port(
    p_in  : in  integer_vector(0 to 3);
    p_out : out integer
  );
end entity;
architecture bh of arr_constrained_ent is
  type t_vec is array(0 to 3) of integer;
  signal s_in : t_vec := (others => 0);
begin
  s_in <= t_vec(p_in);
  p_out <= s_in(0) + s_in(1) + s_in(2) + s_in(3);
end architecture bh;
