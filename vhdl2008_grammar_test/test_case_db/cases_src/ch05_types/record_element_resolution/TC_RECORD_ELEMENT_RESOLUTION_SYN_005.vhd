-- =============================================================
-- Case ID: TC_RECORD_ELEMENT_RESOLUTION_SYN_005
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_element_resolution ::= record_element_simple_name resolution_indication
-- Test Focus: Mixed resolution: one element uses function name form,
--   another uses parenthesized form. Tests that resolution_indication's
--   two alternatives can be mixed freely within record_element_resolution
--   instances.
-- Expected Result: Compiles; mixed resolution forms coexist
-- Dependencies: None
-- =============================================================
entity rec_elem_res_mixed_forms is
  port (
    int_a  : in  integer;
    int_b  : in  integer;
    bit_a  : in  bit;
    bit_b  : in  bit;
    int_out : out integer;
    bit_out : out bit
  );
end entity rec_elem_res_mixed_forms;

architecture mixed_res_forms of rec_elem_res_mixed_forms is
  function resolve_avg(drivers : integer_vector) return integer is
    variable s : integer := 0;
  begin
    for i in drivers'range loop
      s := s + drivers(i);
    end loop;
    return s / drivers'length;
  end function;
  function resolve_and(drivers : bit_vector) return bit is
    variable r : bit := '1';
  begin
    for i in drivers'range loop
      r := r and drivers(i);
    end loop;
    return r;
  end function;
  type t_rec is record
    cnt : integer;
    flg : bit;
  end record;
  -- cnt: function name form; flg: parenthesized form
  subtype t_res is (cnt resolve_avg, flg(resolve_and)) t_rec;
  signal s : t_res;
begin
  s.cnt <= int_a;
  s.cnt <= int_b;
  s.flg <= bit_a;
  s.flg <= bit_b;
  int_out <= s.cnt;
  bit_out <= s.flg;
end architecture mixed_res_forms;
