-- =============================================================
-- Case ID: TC_DIRECTION_SYN_005
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: direction ::= to | downto
-- Test Focus: Mixed "to" and "downto" directions in different array
--   dimensions of a multi-dimensional type. Verifies that direction
--   per dimension is independent. 2D array uses to for rows, downto
--   for columns.
-- Expected Result: Compiles; matrix indexed in both directions
-- Dependencies: None
-- =============================================================
entity matrix_indexer is
  port (
    row_sel  : in  integer range 0 to 3;
    col_sel  : in  integer range 0 to 7;
    data_out : out bit
  );
end entity matrix_indexer;

architecture mixed_directions of matrix_indexer is
  -- rows: 0 to 3 (ascending), cols: 7 downto 0 (descending)
  type t_matrix is array(0 to 3, 7 downto 0) of bit;
  constant MATRIX : t_matrix := (
    0 => ('1','0','1','0','1','0','1','0'),
    1 => ('0','1','0','1','0','1','0','1'),
    2 => ('1','1','1','1','0','0','0','0'),
    3 => ('0','0','0','0','1','1','1','1')
  );
begin
  data_out <= MATRIX(row_sel, col_sel);
end architecture mixed_directions;
