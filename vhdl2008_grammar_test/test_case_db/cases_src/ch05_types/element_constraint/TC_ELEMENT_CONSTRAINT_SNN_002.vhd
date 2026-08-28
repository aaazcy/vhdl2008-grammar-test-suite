-- =============================================================
-- Case ID: TC_ELEMENT_CONSTRAINT_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: element_constraint ::= array_constraint
--              | record_constraint
-- Case Type: Negative
-- Test Focus: record_constraint in element_constraint referencing
--            a field name that does not exist in the record type.
--            The element_constraint must constrain existing fields.
-- Expected Result: Triggers name resolution error
-- Dependencies: None
-- =============================================================
entity bad_record_constraint_field is
  port (
    q : out integer
  );
end entity bad_record_constraint_field;

architecture rtl of bad_record_constraint_field is
  type base_rec is record
    x : integer;
    y : bit;
  end record;
  -- ERROR: "z" is not a field of base_rec
  subtype bad_rec is base_rec(z integer range 0 to 7);
  signal s : bad_rec;
begin
  q <= s.x;
end architecture rtl;
