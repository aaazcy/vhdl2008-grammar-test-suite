-- =============================================================
-- Case ID: TC_RESOLUTION_INDICATION_SYN_004
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: resolution_indication ::= resolution_function_name | ( element_resolution )
-- Test Focus: Resolution_indication with a function name for an
--   array type. The function name directly resolves the whole
--   array. Tests that the function name form works for
--   composite (array) base types.
-- Expected Result: Compiles; array resolved by function name
-- Dependencies: None
-- =============================================================
entity resolution_indication_array_func is
  port (
    vec_a : in  bit_vector(3 downto 0);
    vec_b : in  bit_vector(3 downto 0);
    vec_out : out bit_vector(3 downto 0)
  );
end entity resolution_indication_array_func;

architecture array_func_name of resolution_indication_array_func is
  type t_vec_arr is array(natural range <>) of bit_vector(3 downto 0);
  function resolve_vec_or(drivers : t_vec_arr) return bit_vector is
    variable r : bit_vector(3 downto 0) := (others => '0');
  begin
    for i in drivers'range loop
      r := r or drivers(i);
    end loop;
    return r;
  end function;
  subtype t_res_vec is resolve_vec_or bit_vector(3 downto 0);
  signal s : t_res_vec;
begin
  s <= vec_a;
  s <= vec_b;
  vec_out <= s;
end architecture array_func_name;
