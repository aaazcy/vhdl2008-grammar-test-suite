-- =============================================================
-- Case ID: TC_RECORD_RESOLUTION_SYN_S01
-- Rule Type: Syntax (Production-Specific)
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_resolution ::= record_element_resolution { , record_element_resolution }
-- Test Focus: Production-specific isolation of the comma-separated
--   repetition structure. A record with 4 elements, each with a
--   distinct resolution function name. Verifies the BNF allows
--   arbitrary-length comma-separated lists of element resolutions.
-- Expected Result: Compiles; four-element record resolution
-- Dependencies: None
-- =============================================================
entity record_resolution_comma_list is
  port (
    i1, i2 : in  bit;
    o1 : out bit
  );
end entity record_resolution_comma_list;

architecture four_elem_res of record_resolution_comma_list is
  function r_or(d : bit_vector) return bit is
  begin
    for i in d'range loop if d(i)='1' then return '1'; end if; end loop;
    return '0';
  end function;
  function r_and(d : bit_vector) return bit is
    variable v:bit:='1';
  begin
    for i in d'range loop v:=v and d(i); end loop;
    return v;
  end function;
  type t_quad is record
    f1, f2, f3, f4 : bit;
  end record;
  -- 4 comma-separated record_element_resolution entries
  subtype t_res is (f1 r_or, f2 r_and, f3 r_or, f4 r_and) t_quad;
  signal s : t_res;
begin
  s.f1 <= i1; s.f1 <= i2;
  o1 <= s.f1;
end architecture four_elem_res;
