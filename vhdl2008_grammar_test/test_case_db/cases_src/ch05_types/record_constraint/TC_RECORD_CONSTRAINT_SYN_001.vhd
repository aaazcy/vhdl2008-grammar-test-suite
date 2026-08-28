-- =============================================================
-- Case ID: TC_RECORD_CONSTRAINT_SYN_001
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_constraint ::= ( record_element_constraint { , record_element_constraint } )
-- Test Focus: Record constraint with single element constraint
--   constraining a bit_vector field of a record. The parenthesized
--   single-element form tests the minimal valid record_constraint.
-- Expected Result: Compiles; single field constrained
-- Dependencies: None
-- =============================================================
entity record_constraint_single_element is
  port (
    val_in  : in  integer;
    val_out : out integer
  );
end entity record_constraint_single_element;

architecture single_elem_constraint of record_constraint_single_element is
  type t_rec is record
    data : bit_vector;
    flag : bit;
  end record;
  signal s : t_rec(data(0 to 7)) := (data => (others => '0'), flag => '1');
begin
  val_out <= s.data'length;
end architecture single_elem_constraint;
