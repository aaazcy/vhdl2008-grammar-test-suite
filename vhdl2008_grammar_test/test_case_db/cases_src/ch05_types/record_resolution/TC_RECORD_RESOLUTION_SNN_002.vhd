-- =============================================================
-- Case ID: TC_RECORD_RESOLUTION_SNN_002
-- Rule Type: Syntax (Negative)
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_resolution ::= record_element_resolution { , record_element_resolution }
-- Test Focus: Missing comma separator between two record_element_
--   resolution entries. The BNF requires comma between elements;
--   juxtaposing two element names without comma is invalid.
-- Expected Result: VHDL syntax error: expected ',' between elements
-- Dependencies: None
-- =============================================================
entity record_resolution_missing_comma is
end entity record_resolution_missing_comma;

architecture no_comma of record_resolution_missing_comma is
  function r_or(d : bit_vector) return bit is
  begin for i in d'range loop if d(i)='1' then return '1'; end if; end loop;
    return '0';
  end function;
  type t_rec is record
    x : bit;
    y : bit;
  end record;
  -- ERROR: missing comma between x and y element resolutions
  subtype t_sub is t_rec(x r_or y r_or);
  signal s : t_sub;
begin
end architecture no_comma;
