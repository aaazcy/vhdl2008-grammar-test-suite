-- =============================================================
-- Case ID: TC_RECORD_RESOLUTION_SNN_001
-- Rule Type: Syntax (Negative)
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_resolution ::= record_element_resolution { , record_element_resolution }
-- Test Focus: Trailing comma after the last element resolution
--   entry. The BNF does not allow a trailing comma; the separator
--   only appears between elements ({ , ... }), not after the last.
-- Expected Result: VHDL syntax error: unexpected trailing comma
-- Dependencies: None
-- =============================================================
entity record_resolution_trailing_comma is
end entity record_resolution_trailing_comma;

architecture trailing_comma of record_resolution_trailing_comma is
  function r_or(d : bit_vector) return bit is
  begin for i in d'range loop if d(i)='1' then return '1'; end if; end loop;
    return '0';
  end function;
  type t_rec is record
    a : bit;
    b : bit;
  end record;
  -- ERROR: trailing comma after last element
  subtype t_sub is t_rec(a r_or, b r_or,);
  signal s : t_sub;
begin
end architecture trailing_comma;
