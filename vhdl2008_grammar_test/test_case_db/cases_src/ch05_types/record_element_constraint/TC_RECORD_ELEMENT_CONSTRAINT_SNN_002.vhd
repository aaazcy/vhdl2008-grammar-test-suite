-- =============================================================
-- Case ID: TC_RECORD_ELEMENT_CONSTRAINT_SNN_002
-- Rule Type: Syntax (Negative)
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_element_constraint ::= record_element_simple_name element_constraint
-- Test Focus: Swapping the order: element_constraint before
--   record_element_simple_name. The BNF requires the name first,
--   then the constraint. A constraint before the name is invalid.
-- Expected Result: VHDL syntax error: unexpected constraint
-- Dependencies: None
-- =============================================================
entity rec_elem_constraint_swapped_order is
end entity rec_elem_constraint_swapped_order;

architecture name_after_constraint of rec_elem_constraint_swapped_order is
  type t_rec is record
    width : integer;
  end record;
  -- ERROR: constraint before name; BNF requires name first
  signal s : t_rec(range 0 to 255 width);
begin
end architecture name_after_constraint;
