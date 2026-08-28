-- =============================================================
-- Case ID: TC_RECORD_ELEMENT_CONSTRAINT_SYN_006
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_element_constraint ::= record_element_simple_name element_constraint
-- Test Focus: Element constraint with a 2D array field. The
--   element_constraint applies index_constraints for both
--   dimensions. This is a complex nesting of constraint forms
--   inside record_element_constraint.
-- Expected Result: Compiles; 2D array field constrained
-- Dependencies: None
-- =============================================================
entity rec_elem_constraint_2d_array is
  port (
    row_i : in  integer range 0 to 2;
    col_i : in  integer range 0 to 2;
    bit_out : out bit
  );
end entity rec_elem_constraint_2d_array;

architecture elem_2d_constraint of rec_elem_constraint_2d_array is
  type bit_matrix is array(natural range <>, natural range <>) of bit;
  type t_grid is record
    matrix : bit_matrix;
  end record;
  signal grid : t_grid(matrix(0 to 2, 0 to 2))
    := (matrix => (others => (others => '0')));
begin
  bit_out <= grid.matrix(row_i, col_i);
end architecture elem_2d_constraint;
