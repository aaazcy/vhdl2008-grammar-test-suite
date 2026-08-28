-- =============================================================
-- Case ID: TC_RECORD_ELEMENT_RESOLUTION_SYN_001
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_element_resolution ::= record_element_simple_name resolution_indication
-- Test Focus: Record element resolution naming a resolution function
--   for a specific field. The resolution_indication is a function
--   name (resolved_sum) applied to the "data" element.
-- Expected Result: Compiles; element-level resolution applied
-- Dependencies: None
-- =============================================================
entity rec_elem_res_func_name is
  port (
    a_in : in  integer;
    b_in : in  integer;
    result : out integer
  );
end entity rec_elem_res_func_name;

architecture elem_res_func of rec_elem_res_func_name is
  function resolved_sum(drivers : integer_vector) return integer is
    variable s : integer := 0;
  begin
    for i in drivers'range loop
      s := s + drivers(i);
    end loop;
    return s;
  end function;
  type t_rec is record
    data : integer;
    flag : bit;
  end record;
  -- record_element_resolution: "data" element uses resolved_sum
  subtype t_resolved is (data resolved_sum) t_rec;
  signal s : t_resolved;
begin
  s.data <= a_in;
  s.data <= b_in;  -- multiple drivers, resolved by resolved_sum
  s.flag <= '1';
  result <= s.data;
end architecture elem_res_func;
