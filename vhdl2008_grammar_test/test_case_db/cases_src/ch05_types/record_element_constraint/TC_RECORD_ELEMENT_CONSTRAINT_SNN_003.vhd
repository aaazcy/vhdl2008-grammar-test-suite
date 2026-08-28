-- =============================================================
-- Case ID: TC_RECORD_ELEMENT_CONSTRAINT_SNN_003
-- Rule Type: Syntax (Negative)
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_element_constraint ::= record_element_simple_name element_constraint
-- Test Focus: Uses "others" as the record_element_simple_name,
--   which is not valid here. The BNF requires a specific
--   record_element_simple_name, not the "others" choice.
-- Expected Result: VHDL syntax error: "others" not allowed here
-- Dependencies: None
-- =============================================================
entity rec_elem_constraint_others_invalid is
end entity rec_elem_constraint_others_invalid;

architecture others_not_name of rec_elem_constraint_others_invalid is
  type t_rec is record
    a : integer;
    b : integer;
  end record;
  -- ERROR: "others" is not a record_element_simple_name
  subtype t_sub is t_rec(others => 0);
  signal s : t_sub;
begin
end architecture others_not_name;
