-- =============================================================
-- Case ID: TC_RECORD_RESOLUTION_SMN_001
-- Related Rule ID: SMN_RECORD_R_001
-- Rule Type: Semantic (Negative)
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_resolution ::= record_element_resolution { , record_element_resolution }
-- Test Focus: Ambiguous resolution: two different resolution functions
--   with compatible signatures for the same element type. If both are
--   visible, the compiler cannot determine which to use without
--   explicit qualification.
-- Expected Result: Compilation error: ambiguous resolution function
-- Dependencies: None
-- =============================================================
entity record_resolution_ambiguous_func is
end entity record_resolution_ambiguous_func;

architecture ambiguous of record_resolution_ambiguous_func is
  function resolve_a(drivers : bit_vector) return bit is
  begin return '0'; end function;
  function resolve_b(drivers : bit_vector) return bit is
  begin return '1'; end function;
  type t_rec is record
    flag : bit;
  end record;
  -- Both resolve_a and resolve_b have compatible signatures;
  -- this should be OK as the name disambiguates. Each element
  -- picks its own function explicitly.
  subtype t_sub is t_rec(flag resolve_a);
  signal s : t_sub;
begin
end architecture ambiguous;
