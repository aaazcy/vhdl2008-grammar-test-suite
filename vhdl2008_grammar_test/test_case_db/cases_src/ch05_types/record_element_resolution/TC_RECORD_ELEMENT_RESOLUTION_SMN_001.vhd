-- =============================================================
-- Case ID: TC_RECORD_ELEMENT_RESOLUTION_SMN_001
-- Related Rule ID: SMN_RECORD_E_001
-- Rule Type: Semantic (Negative)
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_element_resolution ::= record_element_simple_name resolution_indication
-- Test Focus: Resolution function parameter profile mismatch: the
--   function expects an unconstrained array but the element type
--   doesn't match the expected driver type. Resolution function
--   must accept an array of the element's base type.
-- Expected Result: Compilation error or simulation error: parameter mismatch
-- Dependencies: None
-- =============================================================
entity rec_elem_res_param_mismatch is
end entity rec_elem_res_param_mismatch;

architecture bad_params of rec_elem_res_param_mismatch is
  -- Wrong parameter type: bit_vector instead of integer_vector
  function bad_resolver(drivers : bit_vector) return integer is
  begin
    return 0;
  end function;
  type t_rec is record
    data : integer;
  end record;
  -- ERROR: bad_resolver expects bit_vector, not integer_vector
  subtype t_sub is t_rec(data bad_resolver);
  signal s : t_sub;
begin
end architecture bad_params;
