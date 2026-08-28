-- =============================================================
-- Case ID: TC_RECORD_ELEMENT_RESOLUTION_SYN_004
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_element_resolution ::= record_element_simple_name resolution_indication
-- Test Focus: Resolution_indication using the simple function name
--   form for an std_logic-like resolved type. The function name
--   is passed directly as the resolution_indication per the BNF
--   alternative resolution_function_name.
-- Expected Result: Compiles; single function name resolves element
-- Dependencies: None
-- =============================================================
entity rec_elem_res_simple_func is
  port (
    drv_a : in  bit;
    drv_b : in  bit;
    resolved : out bit
  );
end entity rec_elem_res_simple_func;

architecture simple_func_res of rec_elem_res_simple_func is
  function resolve_bit_and(drivers : bit_vector) return bit is
    variable r : bit := '1';
  begin
    for i in drivers'range loop
      r := r and drivers(i);
    end loop;
    return r;
  end function;
  type t_rec is record
    enable : bit;
    status : integer;
  end record;
  -- resolution_function_name form of resolution_indication
  subtype t_res is (enable resolve_bit_and) t_rec;
  signal s : t_res;
begin
  s.enable <= drv_a;
  s.enable <= drv_b;
  s.status <= 0;
  resolved <= s.enable;
end architecture simple_func_res;
