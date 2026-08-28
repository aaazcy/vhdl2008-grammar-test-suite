-- =============================================================
-- Case ID: TC_RECORD_RESOLUTION_SYN_001
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_resolution ::= record_element_resolution { , record_element_resolution }
-- Test Focus: Single record_element_resolution forming a minimal
--   record_resolution. Tests the base case where the repetition
--   clause ({ , ... }) produces zero additional elements.
-- Expected Result: Compiles; single-element record resolution
-- Dependencies: None
-- =============================================================
entity record_resolution_single is
  port (
    drv_a : in  integer;
    drv_b : in  integer;
    result : out integer
  );
end entity record_resolution_single;

architecture single_res of record_resolution_single is
  function resolve_sum(drivers : integer_vector) return integer is
    variable s : integer := 0;
  begin
    for i in drivers'range loop s := s + drivers(i); end loop;
    return s;
  end function;
  type t_data is record
    value : integer;
  end record;
  -- record_resolution with one record_element_resolution
  subtype t_resolved_data is (value resolve_sum) t_data;
  signal s : t_resolved_data;
begin
  s.value <= drv_a;
  s.value <= drv_b;
  result <= s.value;
end architecture single_res;
