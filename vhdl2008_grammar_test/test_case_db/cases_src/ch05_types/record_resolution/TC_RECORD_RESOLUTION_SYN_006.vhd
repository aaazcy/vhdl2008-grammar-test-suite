-- =============================================================
-- Case ID: TC_RECORD_RESOLUTION_SYN_006
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_resolution ::= record_element_resolution { , record_element_resolution }
-- Test Focus: Nested record resolution where one field is itself a
--   resolved record subtype. The outer record_resolution delegates
--   to an inner record_resolution via the subtype, testing
--   hierarchical resolution.
-- Expected Result: Compiles; nested record resolution
-- Dependencies: None
-- =============================================================
entity record_resolution_nested is
  port (
    p1, p2 : in  integer;
    s1, s2 : in  bit;
    res_int : out integer;
    res_bit : out bit
  );
end entity record_resolution_nested;

architecture nested_res of record_resolution_nested is
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
  type t_inner is record
    value  : integer;
    status : bit;
  end record;
  subtype t_inner_res is (value resolve_max, status resolve_or) t_inner;
  type t_outer is record
    inner : t_inner_res;
    extra : bit;
  end record;
  subtype t_outer_res is (extra resolve_or) t_outer;
  signal s : t_outer_res;
begin
  s.inner.value  <= p1;
  s.inner.value  <= p2;
  s.inner.status <= s1;
  s.inner.status <= s2;
  s.extra <= '1';
  res_int <= s.inner.value;
  res_bit <= s.inner.status;
end architecture nested_res;
