-- =============================================================
-- Case ID: TC_RESOLUTION_INDICATION_SYN_005
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: resolution_indication ::= resolution_function_name | ( element_resolution )
-- Test Focus: Resolution_indication used inside a record element
--   context. The ( element_resolution ) form is placed within a
--   record_resolution, verifying that resolution_indication is
--   correctly parsed as a sub-production in the larger context.
-- Expected Result: Compiles; parenthesized form in record resolution
-- Dependencies: None
-- =============================================================
entity resolution_indication_in_record is
  port (
    x_a, x_b : in  integer;
    result   : out integer
  );
end entity resolution_indication_in_record;

architecture res_in_record of resolution_indication_in_record is
  function resolve_min(drivers : integer_vector) return integer is
    variable m : integer := integer'high;
  begin
    for i in drivers'range loop
      if drivers(i) < m then m := drivers(i); end if;
    end loop;
    return m;
  end function;
  type t_rec is record
    val : integer;
  end record;
  -- resolution_indication as ( element_resolution ) in record context
  subtype t_res is (val(resolve_min)) t_rec;
  signal s : t_res;
begin
  s.val <= x_a;
  s.val <= x_b;
  result <= s.val;
end architecture res_in_record;
