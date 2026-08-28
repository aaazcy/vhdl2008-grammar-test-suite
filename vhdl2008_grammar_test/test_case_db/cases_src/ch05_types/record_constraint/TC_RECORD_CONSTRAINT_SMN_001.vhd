-- =============================================================
-- Case ID: TC_RECORD_CONSTRAINT_SMN_001
-- Related Rule ID: SMN_RECORD_C_001
-- Rule Type: Semantic (Negative)
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_constraint ::= ( record_element_constraint { , record_element_constraint } )
-- Test Focus: Missing element constraint for one field of a
--   multi-field record. All elements must be constrained when
--   any are. An incomplete record_constraint is a semantic error.
-- Expected Result: Compilation error: missing element constraint
-- Dependencies: None
-- =============================================================
entity record_constraint_incomplete is
end entity record_constraint_incomplete;

architecture missing_field of record_constraint_incomplete is
  type t_rec is record
    addr : integer;
    data : bit_vector;
  end record;
  -- ERROR: only "addr" constrained, "data" is missing
  subtype t_sub is t_rec(addr => 0);
  signal s : t_sub;
begin
end architecture missing_field;
