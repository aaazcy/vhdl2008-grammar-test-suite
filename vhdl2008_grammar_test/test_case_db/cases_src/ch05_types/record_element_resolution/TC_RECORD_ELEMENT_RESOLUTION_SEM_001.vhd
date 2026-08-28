-- =============================================================
-- Case ID: TC_RECORD_ELEMENT_RESOLUTION_SEM_001
-- Related Rule ID: SEM_RECORD_E_001
-- Rule Type: Semantic
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_element_resolution ::= record_element_simple_name resolution_indication
-- Test Focus: Resolution function with wrong return type for the
--   record element. The resolution function must return the same
--   type as the element it resolves. An integer resolver applied
--   to a bit element is a type mismatch.
-- Expected Result: Compilation error: type mismatch in resolution
-- Dependencies: None
-- =============================================================
entity rec_elem_res_wrong_return is
end entity rec_elem_res_wrong_return;

architecture wrong_return_type of rec_elem_res_wrong_return is
  function resolve_int(drivers : integer_vector) return integer is
  begin
    return drivers(0);
  end function;
  type t_rec is record
    flag : bit;
  end record;
  -- ERROR: resolve_int returns integer, but flag is bit
  subtype t_sub is t_rec(flag resolve_int);
  signal s : t_sub;
begin
end architecture wrong_return_type;
