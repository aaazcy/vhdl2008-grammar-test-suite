-- =============================================================
-- Case ID: TC_RECORD_ELEMENT_RESOLUTION_SYN_S01
-- Rule Type: Syntax (Production-Specific)
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_element_resolution ::= record_element_simple_name resolution_indication
-- Test Focus: Production-specific comparison: both resolution_indication
--   forms shown. First uses resolution_function_name directly ("resolve_max"),
--   second uses parenthesized element_resolution form. Isolates the
--   two BNF alternatives of resolution_indication inside record_element_resolution.
-- Expected Result: Compiles; both forms parsed correctly
-- Dependencies: None
-- =============================================================
entity rec_elem_res_both_indications is
  port (
    v1 : in  integer;
    v2 : in  integer;
    b1 : in  bit;
    b2 : in  bit;
    r_int : out integer;
    r_bit : out bit
  );
end entity rec_elem_res_both_indications;

architecture both_res_indications of rec_elem_res_both_indications is
  function resolve_max(drivers : integer_vector) return integer is
    variable m : integer := integer'low;
  begin
    for i in drivers'range loop
      if drivers(i) > m then m := drivers(i); end if;
    end loop;
    return m;
  end function;
  function resolve_or(drivers : bit_vector) return bit is
  begin
    for i in drivers'range loop
      if drivers(i) = '1' then return '1'; end if;
    end loop;
    return '0';
  end function;
  type t_rec is record
    val_int : integer;
    val_bit : bit;
  end record;
  -- Form 1: resolution_function_name, Form 2: (element_resolution)
  subtype t_res is (val_int resolve_max, val_bit(resolve_or)) t_rec;
  signal s : t_res;
begin
  s.val_int <= v1;  s.val_int <= v2;
  s.val_bit <= b1;  s.val_bit <= b2;
  r_int <= s.val_int;
  r_bit <= s.val_bit;
end architecture both_res_indications;
