-- =============================================================
-- Case ID: TC_RECORD_ELEMENT_RESOLUTION_SNN_003
-- Rule Type: Syntax (Negative)
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_element_resolution ::= record_element_simple_name resolution_indication
-- Test Focus: Uses a non-existent function name as resolution_indication.
--   The function must be visible; an undefined name causes a semantic
--   error at the resolution_indication position.
-- Expected Result: Compilation error: undefined resolution function
-- Dependencies: None
-- =============================================================
entity rec_elem_res_undefined_func is
end entity rec_elem_res_undefined_func;

architecture undefined_res_func of rec_elem_res_undefined_func is
  type t_rec is record
    x : integer;
  end record;
  -- ERROR: "nonexistent_resolver" is not declared as a function
  subtype t_sub is t_rec(x nonexistent_resolver);
  signal s : t_sub;
begin
end architecture undefined_res_func;
