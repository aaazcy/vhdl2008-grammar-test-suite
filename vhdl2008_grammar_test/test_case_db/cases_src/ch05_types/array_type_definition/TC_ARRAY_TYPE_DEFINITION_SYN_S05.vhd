-- =============================================================
-- Case ID: TC_ARRAY_TYPE_DEFINITION_SYN_S05
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARRAY_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: array_type_definition ::= unbounded_array_definition | constrained_array_definition
-- Case Type: Positive
-- Test Focus: constrained array with boolean index descending range — exercising non-integer discrete index type with downto direction
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity arr_constrained_ent is port(r:out integer); end entity;
architecture bh of arr_constrained_ent is
  type t_flag is array(boolean range true downto false) of real;
  signal s_f : t_flag := (true => 1.0, false => 0.0);
begin
  process
  begin
    r <= integer(s_f(true) - s_f(false));
    wait;
  end process;
end architecture bh;
