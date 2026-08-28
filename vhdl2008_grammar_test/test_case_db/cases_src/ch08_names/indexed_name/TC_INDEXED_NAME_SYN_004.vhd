-- =============================================================
-- Case ID: TC_INDEXED_NAME_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_INDEXED_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.4
-- Production: indexed_name ::= prefix ( expression { , expression } )
-- Case Type: Positive
-- Test Focus: Multi-expression index of a multidimensional array — s_matrix(row_idx, col_idx) uses two comma-separated expressions to index the row and column of a two-dimensional matrix, verifying the multi-expression (expression , expression) syntax of indexed_name
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity idx_name_2d_index is
  port(row_sel : in natural range 0 to 3;
       col_sel : in natural range 0 to 3;
       cell_out : out integer);
end entity;

architecture vhdl2008 of idx_name_2d_index is
  type t_mat is array(0 to 3, 0 to 3) of integer;
  signal s_matrix : t_mat := ((1,2,3,4),(5,6,7,8),(9,10,11,12),(13,14,15,16));
  signal cell_val : integer := 0;
begin
  process(row_sel, col_sel)
  begin
    cell_val <= s_matrix(row_sel, col_sel);
  end process;
  cell_out <= cell_val;
end architecture vhdl2008;
