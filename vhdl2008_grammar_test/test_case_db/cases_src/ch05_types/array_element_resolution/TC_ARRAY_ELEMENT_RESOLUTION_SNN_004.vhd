-- =============================================================
-- Case ID: TC_ARRAY_ELEMENT_RESOLUTION_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARRAY_ELEMENT_RESOLUTION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: array_element_resolution ::= resolution_indication
-- Case Type: Negative
-- Test Focus: resolution_indication with wrong parameter profile.
--            The resolution function parameter must be an
--            unconstrained array of the element type. A function
--            taking a scalar parameter is not a valid resolution
--            function for the element.
-- Expected Result: Triggers profile mismatch error
-- Dependencies: None
-- =============================================================
entity bad_resolution_wrong_param is
  port (
    q : out bit
  );
end entity bad_resolution_wrong_param;

architecture rtl of bad_resolution_wrong_param is
  function scalar_resolve (x : bit) return bit is
  begin
    return x;
  end function;
  -- ERROR: resolution function must take unconstrained array parameter,
  -- not a scalar parameter
  subtype bad_bit is scalar_resolve bit;
  signal s : bad_bit;
begin
  s <= '0';
  q <= s;
end architecture rtl;
