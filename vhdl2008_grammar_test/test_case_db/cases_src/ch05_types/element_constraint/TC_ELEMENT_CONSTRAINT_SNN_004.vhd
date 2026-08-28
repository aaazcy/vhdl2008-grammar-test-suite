-- =============================================================
-- Case ID: TC_ELEMENT_CONSTRAINT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: element_constraint ::= array_constraint
--              | record_constraint
-- Case Type: Negative
-- Test Focus: element_constraint with record_constraint that has
--            mismatched type for a field. The record_constraint
--            must specify a subtype that is compatible with the
--            base field type.
-- Expected Result: Triggers type mismatch error
-- Dependencies: None
-- =============================================================
entity bad_record_field_type is
  port (
    x : out integer
  );
end entity bad_record_field_type;

architecture rtl of bad_record_field_type is
  type rec_t is record
    a : integer;
    b : bit;
  end record;
  -- ERROR: field "a" is integer but constrained with bit_vector range
  subtype bad_r is rec_t(a bit_vector(7 downto 0));
  signal s : bad_r;
begin
  x <= 0;
end architecture rtl;
