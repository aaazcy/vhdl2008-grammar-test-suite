-- =============================================================
-- Case ID: TC_ARRAY_ELEMENT_RESOLUTION_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARRAY_ELEMENT_RESOLUTION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: array_element_resolution ::= resolution_indication
-- Case Type: Negative
-- Test Focus: resolution_indication references a function with a
--            return type incompatible with the element type being
--            resolved. The resolution function must return the
--            same type as the element it resolves.
-- Expected Result: Triggers type mismatch error
-- Dependencies: None
-- =============================================================
entity bad_resolution_return_type is
  port (
    sig : out bit
  );
end entity bad_resolution_return_type;

architecture rtl of bad_resolution_return_type is
  function bad_resolve (vals : bit_vector) return integer is
  begin
    return 0;
  end function;
  -- ERROR: resolution function returns integer, not bit
  subtype bad_bit is bad_resolve bit;
  signal s : bad_bit;
begin
  s <= '0';
  sig <= s;
end architecture rtl;
