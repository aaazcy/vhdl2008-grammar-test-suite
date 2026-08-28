-- =============================================================
-- Case ID: TC_ARRAY_ELEMENT_CONSTRAINT_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARRAY_ELEMENT_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: array_element_constraint ::= element_constraint
-- Case Type: Negative
-- Test Focus: element_constraint wrapping a record_constraint
--            where the record field constraint uses a non-existent
--            type name as the constraint. The type_mark in the
--            record_element_constraint must resolve to a known type.
-- Expected Result: Triggers semantic/type error
-- Dependencies: None
-- =============================================================
entity bad_record_constraint is
  port (
    flag : out boolean
  );
end entity bad_record_constraint;

architecture rtl of bad_record_constraint is
  type rec_t is record
    a : integer;
    b : bit;
  end record;
  -- ERROR: "nonexistent_type" is not declared, invalid in record_constraint
  subtype bad_rec is rec_t(a nonexistent_type, b bit);
  signal s : bad_rec;
begin
  flag <= true;
end architecture rtl;
