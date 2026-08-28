-- =============================================================
-- Case ID: TC_ELEMENT_RESOLUTION_SMN_001
-- Rule Type: Static Model
-- Related Rule ID: BNF_ELEMENT_RESOLUTION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: element_resolution ::= array_element_resolution
--              | record_resolution
-- Case Type: Negative
-- Test Focus: Static model: a resolved signal is driven by
--            a process that assigns it in multiple branches of
--            a case statement without covering all cases — not
--            strictly a resolution error, but the resolution
--            function receives unexpected values when not assigned.
--            Actually, the static error is that a resolved array
--            is indexed with an out-of-range value.
-- Expected Result: Triggers static bounds error
-- Dependencies: None
-- =============================================================
entity bad_resolved_array_index is
  port (
    q : out bit
  );
end entity bad_resolved_array_index;

architecture rtl of bad_resolved_array_index is
  function res_bit (vs : bit_vector) return bit is
  begin
    return vs(0);
  end function;
  subtype rb is res_bit bit;
  type arr4 is array (0 to 3) of rb;
  signal a : arr4;
begin
  -- ERROR: index 5 is out of array range 0 to 3
  a(5) <= '0';
  q <= a(0);
end architecture rtl;
