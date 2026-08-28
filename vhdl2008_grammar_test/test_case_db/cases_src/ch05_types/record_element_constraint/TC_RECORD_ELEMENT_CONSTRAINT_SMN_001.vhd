-- =============================================================
-- Case ID: TC_RECORD_ELEMENT_CONSTRAINT_SMN_001
-- Related Rule ID: SMN_RECORD_E_001
-- Rule Type: Semantic (Negative)
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_element_constraint ::= record_element_simple_name element_constraint
-- Test Focus: Range constraint on an element that falls completely
--   outside meaningful values. Constrains an integer field to range
--   -1 to -1 (single useless value). While valid, results in a
--   single-element range that serves no practical purpose.
-- Expected Result: Compiles; practical usability warning
-- Dependencies: None
-- =============================================================
entity rec_elem_constraint_single_value is
  port (
    fixed_val : out integer
  );
end entity rec_elem_constraint_single_value;

architecture single_val_range of rec_elem_constraint_single_value is
  type t_rec is record
    magic : integer;
  end record;
  signal s : t_rec(magic range -1 to -1);
begin
  s.magic <= -1;
  fixed_val <= s.magic;
end architecture single_val_range;
