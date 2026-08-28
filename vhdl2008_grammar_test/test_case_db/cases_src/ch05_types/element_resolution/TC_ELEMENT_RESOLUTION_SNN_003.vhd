-- =============================================================
-- Case ID: TC_ELEMENT_RESOLUTION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_RESOLUTION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: element_resolution ::= array_element_resolution
--              | record_resolution
-- Case Type: Negative
-- Test Focus: resolution_indication with wrong parameter type.
--            The function takes an unconstrained array of the
--            element type. Here the function takes integer_vector
--            but the element type is bit.
-- Expected Result: Triggers profile mismatch error
-- Dependencies: None
-- =============================================================
entity bad_resolution_wrong_input is
  port (
    x : out bit
  );
end entity bad_resolution_wrong_input;

architecture rtl of bad_resolution_wrong_input is
  function resolve_int (vs : integer_vector) return bit is
  begin
    return '0';
  end function;
  -- ERROR: resolution function takes integer_vector, element is bit
  subtype bad_bit is resolve_int bit;
  signal s : bad_bit;
begin
  s <= '0';
  x <= s;
end architecture rtl;
