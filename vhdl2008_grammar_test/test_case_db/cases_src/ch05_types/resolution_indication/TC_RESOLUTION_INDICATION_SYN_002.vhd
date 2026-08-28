-- =============================================================
-- Case ID: TC_RESOLUTION_INDICATION_SYN_002
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: resolution_indication ::= resolution_function_name | ( element_resolution )
-- Test Focus: Resolution_indication using the parenthesized
--   element_resolution form: ( resolve_function_name ). The
--   parentheses wrap the element_resolution, demonstrating the
--   second BNF alternative.
-- Expected Result: Compiles; parenthesized resolution works
-- Dependencies: None
-- =============================================================
entity resolution_indication_paren_form is
  port (
    a, b : in  bit_vector(3 downto 0);
    out_bit : out bit_vector(3 downto 0)
  );
end entity resolution_indication_paren_form;

architecture paren_element_res of resolution_indication_paren_form is
  function resolve_or(drivers : bit_vector) return bit is
  begin
    for i in drivers'range loop
      if drivers(i) = '1' then return '1'; end if;
    end loop;
    return '0';
  end function;
  -- resolution_indication in parenthesized form
  subtype t_resolved_bit is (resolve_or) bit_vector(3 downto 0);
  signal s : t_resolved_bit;
begin
  s <= a;
  s <= b;
  out_bit <= s;
end architecture paren_element_res;
