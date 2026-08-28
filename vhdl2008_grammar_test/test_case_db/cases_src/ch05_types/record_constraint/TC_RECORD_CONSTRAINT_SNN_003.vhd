-- =============================================================
-- Case ID: TC_RECORD_CONSTRAINT_SNN_003
-- Rule Type: Syntax (Negative)
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_constraint ::= ( record_element_constraint { , record_element_constraint } )
-- Test Focus: Duplicate element constraint for the same record field.
--   The record_element_simple_name must be unique within a
--   record_constraint; a repeated field name is invalid.
-- Expected Result: VHDL semantic error: duplicate element constraint
-- Dependencies: None
-- =============================================================
entity record_constraint_duplicate_field is
end entity record_constraint_duplicate_field;

architecture dup_field_constraint of record_constraint_duplicate_field is
  type t_rec is record
    val : integer;
  end record;
  -- ERROR: duplicate constraint for "val"
  signal s : t_rec(val => 5, val => 10);
begin
end architecture dup_field_constraint;
