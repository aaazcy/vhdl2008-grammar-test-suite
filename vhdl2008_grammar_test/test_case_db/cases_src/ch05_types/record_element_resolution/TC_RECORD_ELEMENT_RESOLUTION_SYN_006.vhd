-- =============================================================
-- Case ID: TC_RECORD_ELEMENT_RESOLUTION_SYN_006
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_element_resolution ::= record_element_simple_name resolution_indication
-- Test Focus: Resolution function with generic type (VHDL-2008 feature)
--   used as a resolution_indication. Tests that resolution functions
--   can be applied to record elements of generic or derived types.
-- Expected Result: Compiles; generic array type resolution
-- Dependencies: None
-- =============================================================
entity rec_elem_res_generic_type is
  port (
    vec_a : in  bit_vector(1 to 8);
    vec_b : in  bit_vector(1 to 8);
    vec_out : out bit_vector(1 to 8)
  );
end entity rec_elem_res_generic_type;

architecture generic_res of rec_elem_res_generic_type is
  type t_vec_arr is array(natural range <>) of bit_vector(1 to 8);
  function resolve_vec_or(drivers : t_vec_arr) return bit_vector is
    variable r : bit_vector(1 to 8) := (others => '0');
  begin
    for i in drivers'range loop
      r := r or drivers(i);
    end loop;
    return r;
  end function;
  type t_rec is record
    packet : bit_vector(1 to 8);
  end record;
  subtype t_res is (packet resolve_vec_or) t_rec;
  signal s : t_res;
begin
  s.packet <= vec_a;
  s.packet <= vec_b;
  vec_out <= s.packet;
end architecture generic_res;
