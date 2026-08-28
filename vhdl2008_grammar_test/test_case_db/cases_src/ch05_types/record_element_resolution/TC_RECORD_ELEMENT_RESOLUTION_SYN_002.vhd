-- =============================================================
-- Case ID: TC_RECORD_ELEMENT_RESOLUTION_SYN_002
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_element_resolution ::= record_element_simple_name resolution_indication
-- Test Focus: Resolution_indication as a parenthesized element_resolution
--   for an array element. The "(array_element_resolution)" form is used
--   to apply per-element resolution to an array field.
-- Expected Result: Compiles; array element resolution applied
-- Dependencies: None
-- =============================================================
entity rec_elem_res_paren_form is
  port (
    din_a : in  bit_vector(3 downto 0);
    din_b : in  bit_vector(3 downto 0);
    dout  : out bit_vector(3 downto 0)
  );
end entity rec_elem_res_paren_form;

architecture paren_res_indication of rec_elem_res_paren_form is
  function resolve_wired_or(drivers : bit_vector) return bit is
  begin
    for i in drivers'range loop
      if drivers(i) = '1' then return '1'; end if;
    end loop;
    return '0';
  end function;
  type t_rec is record
    bus_data : bit_vector(3 downto 0);
  end record;
  -- resolution_indication in parenthesized element_resolution form
  subtype t_resolved_bus is (bus_data(resolve_wired_or)) t_rec;
  signal s : t_resolved_bus;
begin
  s.bus_data <= din_a;
  s.bus_data <= din_b;
  dout <= s.bus_data;
end architecture paren_res_indication;
