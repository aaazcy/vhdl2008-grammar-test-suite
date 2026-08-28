-- =============================================================
-- Case ID: TC_RESOLUTION_INDICATION_SYN_S01
-- Rule Type: Syntax (Production-Specific)
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: resolution_indication ::= resolution_function_name | ( element_resolution )
-- Test Focus: Production-specific: side-by-side comparison of the
--   two BNF alternatives. One subtype uses the bare function name
--   form; the other uses the parenthesized form. Both produce
--   equivalent resolved subtypes for the same base type.
-- Expected Result: Compiles; both forms produce correct resolution
-- Dependencies: None
-- =============================================================
entity resolution_indication_compare is
  port (
    a1, a2 : in  integer_vector(0 to 3);
    b1, b2 : in  integer_vector(0 to 3);
    sum_a : out integer_vector(0 to 3);
    sum_b : out integer_vector(0 to 3)
  );
end entity resolution_indication_compare;

architecture compare_forms of resolution_indication_compare is
  type t_intvec_arr is array(natural range <>) of integer_vector(0 to 3);
  function resolve_adder(drivers : t_intvec_arr) return integer_vector is
    variable s : integer_vector(0 to 3) := (others => 0);
  begin
    for i in drivers'range loop
      for j in s'range loop
        s(j) := s(j) + drivers(i)(j);
      end loop;
    end loop;
    return s;
  end function;
  function resolve_elt(drivers : integer_vector) return integer is
    variable s : integer := 0;
  begin
    for i in drivers'range loop s := s + drivers(i); end loop;
    return s;
  end function;
  -- Form A: resolution_function_name
  subtype t_form_a is resolve_adder integer_vector(0 to 3);
  signal sa : t_form_a;
  -- Form B: ( element_resolution )
  subtype t_form_b is (resolve_elt) integer_vector(0 to 3);
  signal sb : t_form_b;
begin
  sa <= a1; sa <= a2;
  sb <= b1; sb <= b2;
  sum_a <= sa;
  sum_b <= sb;
end architecture compare_forms;
