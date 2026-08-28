-- =============================================================
-- Case ID: TC_RECORD_ELEMENT_RESOLUTION_SYN_003
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_element_resolution ::= record_element_simple_name resolution_indication
-- Test Focus: Multiple record_element_resolutions in a record_resolution
--   context (2 elements, each with its own resolution function).
--   Tests that each simple_name + resolution_indication pair is
--   parsed independently in sequence.
-- Expected Result: Compiles; dual-field resolution
-- Dependencies: None
-- =============================================================
entity rec_elem_res_multi_field is
  port (
    a_val : in  integer;
    b_val : in  integer;
    sum   : out integer
  );
end entity rec_elem_res_multi_field;

architecture multi_elem_res of rec_elem_res_multi_field is
  function resolve_or(drivers : bit_vector) return bit is
  begin
    for i in drivers'range loop
      if drivers(i) = '1' then return '1'; end if;
    end loop;
    return '0';
  end function;
  function resolve_max(drivers : integer_vector) return integer is
    variable m : integer := integer'low;
  begin
    for i in drivers'range loop
      if drivers(i) > m then m := drivers(i); end if;
    end loop;
    return m;
  end function;
  type t_dual is record
    level : integer;
    valid : bit;
  end record;
  subtype t_res is (level resolve_max, valid resolve_or) t_dual;
  signal s : t_res;
begin
  s.level <= a_val;
  s.level <= b_val;
  s.valid <= '1';
  s.valid <= '0';
  sum <= s.level;
end architecture multi_elem_res;
