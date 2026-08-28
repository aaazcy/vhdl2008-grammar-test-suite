-- =============================================================
-- Case ID: TC_ELEMENT_RESOLUTION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_RESOLUTION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: element_resolution ::= array_element_resolution
--              | record_resolution
-- Case Type: Negative
-- Test Focus: record_resolution used with a field that is not a
--            resolved subtype. The record_resolution requires each
--            element of the record to have a resolution_indication,
--            applied per-element during record subtype declaration.
--            Here the resolution function name is applied to a
--            record type without field-level resolution.
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity bad_record_resolution_direct is
  port (
    q : out bit
  );
end entity bad_record_resolution_direct;

architecture rtl of bad_record_resolution_direct is
  function resolve_bit (vs : bit_vector) return bit is
  begin
    return vs(0);
  end function;
  type plain_rec is record
    a : bit;
    b : bit;
  end record;
  -- ERROR: cannot apply resolution function directly to record type
  -- without per-field resolution
  subtype bad_rec is resolve_bit plain_rec;
  signal s : bad_rec;
begin
  q <= '0';
end architecture rtl;
