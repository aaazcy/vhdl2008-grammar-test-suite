-- =============================================================
-- Case ID: TC_RECORD_RESOLUTION_SYN_002
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_resolution ::= record_element_resolution { , record_element_resolution }
-- Test Focus: Multiple comma-separated record_element_resolution
--   entries. Each element gets its own resolution function. Tests the
--   repetition structure { , record_element_resolution }.
-- Expected Result: Compiles; three resolved record elements
-- Dependencies: None
-- =============================================================
entity record_resolution_multi is
  port (
    a1, a2 : in  bit;
    b1, b2 : in  integer;
    c1, c2 : in  bit;
    r_bit   : out bit;
    r_int   : out integer;
    r_and   : out bit
  );
end entity record_resolution_multi;

architecture multi_res of record_resolution_multi is
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
  function resolve_and(drivers : bit_vector) return bit is
    variable r : bit := '1';
  begin
    for i in drivers'range loop r := r and drivers(i); end loop;
    return r;
  end function;
  type t_triple is record
    en   : bit;
    cnt  : integer;
    done : bit;
  end record;
  -- three record_element_resolution entries, comma-separated
  subtype t_res_triple is (en resolve_or, cnt resolve_max, done resolve_and) t_triple;
  signal s : t_res_triple;
begin
  s.en <= a1;  s.en <= a2;
  s.cnt <= b1; s.cnt <= b2;
  s.done <= c1; s.done <= c2;
  r_bit <= s.en;
  r_int <= s.cnt;
  r_and <= s.done;
end architecture multi_res;
