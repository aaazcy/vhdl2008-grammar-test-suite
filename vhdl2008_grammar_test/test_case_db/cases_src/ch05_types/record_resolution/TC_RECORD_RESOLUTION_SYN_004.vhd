-- =============================================================
-- Case ID: TC_RECORD_RESOLUTION_SYN_004
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_resolution ::= record_element_resolution { , record_element_resolution }
-- Test Focus: Record resolution with unresolved elements mixed with
--   resolved ones. Unresolved elements are simply listed by name
--   without resolution_indication (VHDL-2008 allows mixing).
--   Tests partial resolution within a record type.
-- Expected Result: Compiles; resolved + unresolved elements coexist
-- Dependencies: None
-- =============================================================
entity record_resolution_partial is
  port (
    v1, v2 : in  integer;
    b1, b2 : in  bit;
    out_val : out integer;
    out_bit : out bit
  );
end entity record_resolution_partial;

architecture partial_res of record_resolution_partial is
  function resolve_avg(drivers : integer_vector) return integer is
    variable s : integer := 0;
  begin
    for i in drivers'range loop s := s + drivers(i); end loop;
    return s / drivers'length;
  end function;
  type t_rec is record
    measurement : integer;
    status_bit  : bit;
  end record;
  -- Only measurement is resolved; status_bit is unconstrained
  subtype t_res is (measurement resolve_avg) t_rec;
  signal s : t_res;
begin
  s.measurement <= v1;
  s.measurement <= v2;
  s.status_bit  <= b1;
  out_val <= s.measurement;
  out_bit <= s.status_bit;
end architecture partial_res;
