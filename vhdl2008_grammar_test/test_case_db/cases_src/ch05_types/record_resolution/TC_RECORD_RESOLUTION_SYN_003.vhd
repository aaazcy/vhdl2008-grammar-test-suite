-- =============================================================
-- Case ID: TC_RECORD_RESOLUTION_SYN_003
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_resolution ::= record_element_resolution { , record_element_resolution }
-- Test Focus: Mixed resolution_indication forms within the record_
--   resolution: some elements use function name, others use
--   parenthesized element_resolution. Tests that the BNF allows
--   both alternatives to coexist in the repetition list.
-- Expected Result: Compiles; mixed resolution forms in one record
-- Dependencies: None
-- =============================================================
entity record_resolution_mixed_forms is
  port (
    x1, x2 : in  bit;
    y1, y2 : in  bit;
    z1, z2 : in  integer;
    out_or  : out bit;
    out_and : out bit;
    out_sum : out integer
  );
end entity record_resolution_mixed_forms;

architecture mixed_in_record of record_resolution_mixed_forms is
  function resolve_or(drivers : bit_vector) return bit is
  begin
    for i in drivers'range loop
      if drivers(i) = '1' then return '1'; end if;
    end loop;
    return '0';
  end function;
  function resolve_and(drivers : bit_vector) return bit is
    variable r : bit := '1';
  begin
    for i in drivers'range loop r := r and drivers(i); end loop;
    return r;
  end function;
  function resolve_sum(drivers : integer_vector) return integer is
    variable s : integer := 0;
  begin
    for i in drivers'range loop s := s + drivers(i); end loop;
    return s;
  end function;
  type t_rec is record
    sig_a : bit;
    sig_b : bit;
    total : integer;
  end record;
  -- Mixed: function name, parenthesized, function name
  subtype t_res is (sig_a resolve_or, sig_b(resolve_and), total resolve_sum) t_rec;
  signal s : t_res;
begin
  s.sig_a <= x1; s.sig_a <= x2;
  s.sig_b <= y1; s.sig_b <= y2;
  s.total <= z1; s.total <= z2;
  out_or  <= s.sig_a;
  out_and <= s.sig_b;
  out_sum <= s.total;
end architecture mixed_in_record;
