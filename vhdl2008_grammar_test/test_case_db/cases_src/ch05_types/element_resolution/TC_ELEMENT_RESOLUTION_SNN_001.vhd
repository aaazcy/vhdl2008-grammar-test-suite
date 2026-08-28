-- =============================================================
-- Case ID: TC_ELEMENT_RESOLUTION_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_RESOLUTION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: element_resolution ::= array_element_resolution
--              | record_resolution
-- Case Type: Negative
-- Test Focus: Resolution function used in array_element_resolution
--            has wrong return type (returns integer but element is bit).
--            The resolution_indication must return the element type.
-- Expected Result: Triggers type mismatch error
-- Dependencies: None
-- =============================================================
entity bad_array_resolution_return is
  port (
    d : out bit
  );
end entity bad_array_resolution_return;

architecture rtl of bad_array_resolution_return is
  function bad_func (vs : bit_vector) return integer is
  begin
    return 0;
  end function;
  -- ERROR: resolution function returns integer, not bit
  subtype bad_bit is bad_func bit;
  signal s : bad_bit;
begin
  s <= '0';
  d <= s;
end architecture rtl;
