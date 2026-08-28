-- =============================================================
-- Case ID: TC_RECORD_ELEMENT_CONSTRAINT_SNN_001
-- Rule Type: Syntax (Negative)
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_element_constraint ::= record_element_simple_name element_constraint
-- Test Focus: Missing element_constraint entirely after the element
--   name. The BNF requires an element_constraint following the
--   record_element_simple_name. A bare name with no constraint
--   is invalid.
-- Expected Result: VHDL syntax error: expected element_constraint
-- Dependencies: None
-- =============================================================
entity rec_elem_constraint_missing_constr is
end entity rec_elem_constraint_missing_constr;

architecture no_element_constraint of rec_elem_constraint_missing_constr is
  type t_rec is record
    x : integer;
    y : integer;
  end record;
  -- ERROR: "x" has no element_constraint following it
  signal s : t_rec(x, y => 10);
begin
end architecture no_element_constraint;
