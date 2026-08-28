-- =============================================================
-- Case ID: TC_RESOLUTION_INDICATION_SYN_006
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: resolution_indication ::= resolution_function_name | ( element_resolution )
-- Test Focus: Nested element_resolution forms: ( resolve_inner )
--   where the element being resolved is itself a 2D array type.
--   The unit resolution works per element of the inner dimension.
-- Expected Result: Compiles; 2D array element-level resolution
-- Dependencies: None
-- =============================================================
entity resolution_indication_nested_array is
  port (
    grid_a : in  bit_vector(0 to 15);
    grid_b : in  bit_vector(0 to 15);
    grid_out : out bit_vector(0 to 15)
  );
end entity resolution_indication_nested_array;

architecture nested_elem_res of resolution_indication_nested_array is
  function resolve_wire_and(drivers : bit_vector) return bit is
    variable r : bit := '1';
  begin
    for i in drivers'range loop r := r and drivers(i); end loop;
    return r;
  end function;
  -- Parenthesized form resolves each element of the array independently
  subtype t_res_grid is (resolve_wire_and) bit_vector(0 to 15);
  signal s : t_res_grid;
begin
  s <= grid_a;
  s <= grid_b;
  grid_out <= s;
end architecture nested_elem_res;
