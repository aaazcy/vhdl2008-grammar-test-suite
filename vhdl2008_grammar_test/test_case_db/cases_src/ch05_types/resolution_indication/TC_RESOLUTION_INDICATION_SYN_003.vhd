-- =============================================================
-- Case ID: TC_RESOLUTION_INDICATION_SYN_003
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: resolution_indication ::= resolution_function_name | ( element_resolution )
-- Test Focus: Both forms used in the same architecture for comparison:
--   (1) resolution_function_name on an integer subtype
--   (2) ( element_resolution ) on a bit subtype
--   Verifies both alternatives parse independently.
-- Expected Result: Compiles; both forms produce resolved signals
-- Dependencies: None
-- =============================================================
entity resolution_indication_both_forms is
  port (
    i_a, i_b : in  integer;
    b_a, b_b : in  bit_vector(3 downto 0);
    i_out : out integer;
    b_out : out bit_vector(3 downto 0)
  );
end entity resolution_indication_both_forms;

architecture both_res_forms of resolution_indication_both_forms is
  function resolve_sum(drivers : integer_vector) return integer is
    variable s : integer := 0;
  begin
    for i in drivers'range loop s := s + drivers(i); end loop;
    return s;
  end function;
  function resolve_and(drivers : bit_vector) return bit is
    variable r : bit := '1';
  begin
    for i in drivers'range loop r := r and drivers(i); end loop;
    return r;
  end function;
  -- Form 1: resolution_function_name
  subtype t_int_res is resolve_sum integer;
  signal s_int : t_int_res;
  -- Form 2: ( element_resolution )
  subtype t_bit_res is (resolve_and) bit_vector(3 downto 0);
  signal s_bit : t_bit_res;
begin
  s_int <= i_a; s_int <= i_b;
  s_bit <= b_a; s_bit <= b_b;
  i_out <= s_int;
  b_out <= s_bit;
end architecture both_res_forms;
