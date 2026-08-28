-- =============================================================
-- Case ID: TC_RECORD_RESOLUTION_SYN_005
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_resolution ::= record_element_resolution { , record_element_resolution }
-- Test Focus: Record resolution with array-type record elements.
--   Each array element uses a per-element resolution function via
--   parenthesized form. Tests nesting: record_resolution contains
--   record_element_resolution which uses resolution_indication
--   in parenthesized element_resolution form.
-- Expected Result: Compiles; array elements resolved
-- Dependencies: None
-- =============================================================
entity record_resolution_array_elements is
  port (
    va, vb : in  bit_vector(0 to 7);
    vout    : out bit_vector(0 to 7)
  );
end entity record_resolution_array_elements;

architecture array_res_elements of record_resolution_array_elements is
  function resolve_bit_or(drivers : bit_vector) return bit is
  begin
    for i in drivers'range loop
      if drivers(i) = '1' then return '1'; end if;
    end loop;
    return '0';
  end function;
  type t_bus is record
    data_bus : bit_vector(0 to 7);
  end record;
  subtype t_res_bus is (data_bus(resolve_bit_or)) t_bus;
  signal s : t_res_bus;
begin
  s.data_bus <= va;
  s.data_bus <= vb;
  vout <= s.data_bus;
end architecture array_res_elements;
