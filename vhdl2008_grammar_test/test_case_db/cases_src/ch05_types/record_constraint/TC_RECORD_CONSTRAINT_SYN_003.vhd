-- =============================================================
-- Case ID: TC_RECORD_CONSTRAINT_SYN_003
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_constraint ::= ( record_element_constraint { , record_element_constraint } )
-- Test Focus: Record constraint with array element constraint using
--   range_constraint inside the element. Tests nesting: record_constraint
--   contains element_constraint which contains array_constraint which
--   contains range_constraint. Deep nesting of constraint forms.
-- Expected Result: Compiles; array slice constrained
-- Dependencies: None
-- =============================================================
entity record_constraint_nested_array is
  port (
    idx  : in  integer range 0 to 3;
    bit_out : out bit
  );
end entity record_constraint_nested_array;

architecture nested_array_constraint of record_constraint_nested_array is
  type t_rec is record
    vec : bit_vector;
    num : integer;
  end record;
  signal s : t_rec(vec(0 to 7)) := (vec => (others => '0'), num => 0);
begin
  s.vec(idx) <= '1';
  bit_out <= s.vec(idx);
end architecture nested_array_constraint;
