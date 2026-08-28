-- =============================================================
-- Case ID: TC_RESOLUTION_INDICATION_SYN_001
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: resolution_indication ::= resolution_function_name | ( element_resolution )
-- Test Focus: Resolution_indication using the resolution_function_name
--   form. A function name is passed directly as the resolution
--   indication for an array subtype. Tests the first BNF alternative.
-- Expected Result: Compiles; function name used as resolution
-- Dependencies: None
-- =============================================================
entity resolution_indication_func_name is
  port (
    drv_a : in  integer;
    drv_b : in  integer;
    result : out integer
  );
end entity resolution_indication_func_name;

architecture func_name_form of resolution_indication_func_name is
  function resolve_winner(drivers : integer_vector) return integer is
    variable best : integer := 0;
  begin
    for i in drivers'range loop
      if drivers(i) > best then best := drivers(i); end if;
    end loop;
    return best;
  end function;
  -- resolution_indication as bare function name
  subtype t_resolved_int is resolve_winner integer;
  signal s : t_resolved_int;
begin
  s <= drv_a;
  s <= drv_b;
  result <= s;
end architecture func_name_form;
