-- =============================================================
-- Case ID: TC_RECORD_CONSTRAINT_SEM_001
-- Related Rule ID: SEM_RECORD_C_001
-- Rule Type: Semantic
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_constraint ::= ( record_element_constraint { , record_element_constraint } )
-- Test Focus: Record constraint with a field name that does not
--   exist in the record type. The element simple name must match
--   an actual record element; a non-existent name is a semantic
--   error.
-- Expected Result: Compilation error: undefined record element
-- Dependencies: None
-- =============================================================
entity record_constraint_bad_field_name is
end entity record_constraint_bad_field_name;

architecture unknown_field of record_constraint_bad_field_name is
  type t_rec is record
    width : integer;
    height : integer;
  end record;
  -- ERROR: "depth" is not an element of t_rec
  signal s : t_rec(width => 10, depth => 5);
begin
end architecture unknown_field;
