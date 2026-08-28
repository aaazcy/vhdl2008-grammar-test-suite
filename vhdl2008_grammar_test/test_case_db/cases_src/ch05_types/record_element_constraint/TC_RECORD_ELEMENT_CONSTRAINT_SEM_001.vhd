-- =============================================================
-- Case ID: TC_RECORD_ELEMENT_CONSTRAINT_SEM_001
-- Related Rule ID: SEM_RECORD_E_001
-- Rule Type: Semantic
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_element_constraint ::= record_element_simple_name element_constraint
-- Test Focus: Element constraint with incompatible type: constraining
--   an integer field with an array index constraint. The element_constraint
--   must be compatible with the element's type. Applying array constraint
--   to scalar is a semantic error.
-- Expected Result: Compilation error: constraint not compatible with element type
-- Dependencies: None
-- =============================================================
entity rec_elem_constraint_type_mismatch is
end entity rec_elem_constraint_type_mismatch;

architecture bad_constraint_type of rec_elem_constraint_type_mismatch is
  type t_rec is record
    id : integer;
  end record;
  -- ERROR: array constraint on scalar integer field
  signal s : t_rec(id(0 to 7) => (others => 0));
begin
end architecture bad_constraint_type;
