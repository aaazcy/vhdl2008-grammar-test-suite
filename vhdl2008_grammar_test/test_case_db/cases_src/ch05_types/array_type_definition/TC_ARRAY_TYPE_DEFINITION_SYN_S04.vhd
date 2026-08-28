-- =============================================================
-- Case ID: TC_ARRAY_TYPE_DEFINITION_SYN_S04
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARRAY_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: array_type_definition ::= unbounded_array_definition | constrained_array_definition
-- Case Type: Positive
-- Test Focus: constrained array of arrays — nested array type where the element type is itself an array type, exercising multi-dimensional type composition via two separate type definitions
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity arr_2d_ent is port(r:out integer); end entity;
architecture bh of arr_2d_ent is
  type t_row is array(0 to 7) of bit;
  type t_matrix is array(0 to 3) of t_row;
  signal s_m : t_matrix := (others => (others => '0'));
begin
  process
  begin
    s_m(0)(0) <= '1';
    r <= 0 when s_m(0)(0) = '0' else 1;
    wait;
  end process;
end architecture bh;
